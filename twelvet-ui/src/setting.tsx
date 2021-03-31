const { NODE_ENV } = process.env

const isDev: boolean = NODE_ENV == 'development'
const urlPrefix: String = '/api'

const TWT: any = {
    // OAuth2
    accessToken: 'TWT_access_token',
    refreshToken: 'TWT_refresh_token',
    // 是否dev模式
    isDev,
    // api请求前缀
    urlPrefix,
    action: `${urlPrefix}/`,
    uploadUrl: `${urlPrefix}/dfs/commonUpload`
}

export default TWT