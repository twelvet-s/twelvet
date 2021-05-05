/**
 * request 网络请求工具
 * 更详细的 api 文档: https://github.com/umijs/umi-request
 */
import { extend } from 'umi-request'
import { notification } from 'antd'
import { getDvaApp } from 'umi'
import { system } from '@/utils/twelvet'
import TWT from '@/setting'
import { isArray } from 'lodash'
import { logout } from '@/utils/twelvet'


const codeMessage = {
    200: '服务器成功返回请求的数据。',
    201: '新建或修改数据成功。',
    202: '一个请求已经进入后台排队（异步任务）。',
    204: '删除数据成功。',
    400: '发出的请求有错误，服务器没有进行新建或修改数据的操作。',
    401: '用户没有权限（令牌、用户名、密码错误/失效）。',
    403: '用户得到授权，但是访问是被禁止的。',
    404: '发出的请求针对的是不存在的记录，服务器没有进行操作。',
    406: '请求的格式不可得。',
    410: '请求的资源被永久删除，且不会再得到的。',
    422: '当创建一个对象时，发生一个验证错误。',
    500: '服务器发生错误，请检查服务器。',
    502: '网关错误。',
    503: '服务不可用，服务器暂时过载或维护。',
    504: '网关超时。',
}

/**
 * 异常处理程序
 */
const errorHandler = async (error: { response: Response }): Promise<Response> => {
    const { response } = error

    if (response && response.status) {
        const errorText = codeMessage[response.status] || response.statusText
        const { status, url } = response

        notification.error({
            message: `请求错误 ${status}: ${url}`,
            description: errorText,
        })

    } else if (!response) {
        notification.error({
            description: '您的网络发生异常，无法连接服务器',
            message: '网络异常',
        });
        logout()
    }
    return response
}

/**
 * 配置request请求时的默认参数
 */
const request = extend({
    // 默认错误处理
    errorHandler,
    // 超时时间（毫秒）
    timeout: 15000,
    // 默认请求是否带上cookie(配置后无法跨域)
    // credentials: 'include',
})

// 请求前的处理
request.use(
    async (ctx, next) => {
        try {
            const { req } = ctx
            const { url, options } = req

            if (url.indexOf('http') && (url.indexOf('/api') !== 0)) {
                // 给url添加前缀
                ctx.req.url = `${TWT.urlPrefix}${url}`
            }

            // 统一传递的参数名称【get请求时参数传递需要放到params下】
            const _method: string = options.method?.toLocaleUpperCase()
            if (_method == 'GET' && options.data) {
                options.params = {
                    ...options.data
                }
            }

            const local = localStorage.getItem(TWT.accessToken)
            const { access_token, expires_in } = local ? JSON.parse(local) : { access_token: '', expires_in: 0 }

            // 附加参数
            ctx.req.options = {
                ...options,
                requestPath: url,
                headers: {
                    ...options.headers,
                    // 加入认证信息
                    'Authorization': `Bearer ${access_token}`
                }
            }

            await next()
        } catch (e) {
            system.error(e)
        }
    }
)


// Filter【请求后的处理】
request.interceptors.response.use(async (httpResponse, httpRequest) => {

    if(httpResponse.status === 504){
        notification.error({
            description: '服务异常,无法连接',
            message: codeMessage[504],
        });
        throw new Error(codeMessage[504])
    }

    // blob类型直接返回
    if (httpRequest.responseType === 'blob' && httpResponse.status == 200) {
        return httpResponse;
    }

    const data = await httpResponse.clone().json();

    // 默认返回
    let responseRes = httpResponse

    // 处理401状态
    if (data.code === 401) {
        const { params, method, requestPath } = httpRequest
        // 执行刷新token
        const res = await getDvaApp()._store.dispatch({
            type: 'user/refreshToken',
            payload: {
                requestPath: requestPath,
                method: method,
                responseType: httpRequest.responseType,
                data: params
            }
        })

        // 存在返回再设置
        if (res) {
            responseRes = res
        }

    }

    if (data && data.code === 403) {
        notification.error({
            message: data.msg,
        });
        // 跳转到登陆页
        // return router.replace('/user/login');
    } else if (data && data.status === -998) {
        // 无操作权限
        notification.error({
            message: data.msg
        });
    }

    return responseRes;

})

/**
 * 通用下载方法
 * @param url 地址
 * @param params 参数
 * @param filename 文件名称(空即为输出默认)
 */
export function download(url: string, params?: { [key: string]: any }, filename?: string) {
    return request(`${url}`, {
        method: 'POST',
        data: {
            ...params
        },
        params: {
            refresh: new Date().getTime()
        },
        responseType: 'blob',
        parseResponse: false
    })
        .then((response) => {

            // 空的将采用默认
            if (!filename) {

                const contentDisposition = response.headers.get('content-disposition')
                if (!contentDisposition) {
                    return response.blob()
                }
                const name = contentDisposition.split("filename=")
                if (isArray(name)) {
                    // 获取并还原编码
                    filename = decodeURIComponent(name[1])
                } else {
                    filename = 'unknown'
                }
            }

            return response.blob()

        })
        .then((blob) => {
            if ('download' in document.createElement('a')) {
                // 非IE下载
                const elink = document.createElement('a')
                elink.download = filename || 'unknown'
                elink.style.display = 'none'
                elink.href = URL.createObjectURL(blob)
                document.body.appendChild(elink)
                elink.click()
                URL.revokeObjectURL(elink.href)
                document.body.removeChild(elink)
            } else {
                // IE10+下载
                navigator.msSaveBlob(blob, filename)
            }
        }).catch((r) => {
            system.error(r)
        })
}

/**
 * 通用文件上传
 * @param url 地址
 * @param formData 数据对象 FormData
 * @param params 参数
 */
export function upload(url: string, formData: FormData) {
    return request(`${url}`, {
        method: 'POST',
        requestType: 'form',
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Accept': '*/*',
        },
        data: formData,
    })
}

export default request
