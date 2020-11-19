/**
 * Ant Design Pro v4 use `@ant-design/pro-layout` to handle Layout.
 * You can view component api by:
 * https://github.com/ant-design/ant-design-pro-layout
 */
import ProLayout, { BasicLayoutProps as ProLayoutProps, Settings, MenuDataItem } from '@ant-design/pro-layout'
import { createFromIconfontCN } from '@ant-design/icons'
import React, { useState } from 'react'
import { Link, useIntl, connect, Dispatch, history } from 'umi'
import { Result, Button, Input } from 'antd'
import Authorized from '@/utils/Authorized'
import RightContent from '@/components/GlobalHeader/RightContent'
import { ConnectState } from '@/models/connect'
import { getAuthorityFromRouter } from '@/utils/utils'
import logo from '@/assets/logo.jpg'
import { PageHeaderWrapper } from '@ant-design/pro-layout'
import Footer from '@/components/TwelveT/Footer'

const IconFont = createFromIconfontCN();

const noMatch = (
    <Result
        status={403}
        title="403"
        subTitle="Sorry, you are not authorized to access this page."
        extra={
            <Button type="primary">
                <Link to="/login">Go Login</Link>
            </Button>
        }
    />
)
export interface BasicLayoutProps extends ProLayoutProps {
    breadcrumbNameMap: {
        [path: string]: MenuDataItem
    }
    route: ProLayoutProps['route'] & {
        authority: string[]
    }
    settings: Settings
    dispatch: Dispatch
    currentUser: currentUser
}
export type BasicLayoutContext = { [K in 'location']: BasicLayoutProps[K] } & {
    breadcrumbNameMap: {
        [path: string]: MenuDataItem
    }
}
/**
 * use Authorized check all menu item
 */
const menuDataRender = (menuList: MenuDataItem[]): MenuDataItem[] => {
    return (
        menuList.map((item) => {
            const localItem = {
                ...item,
                children: item.children ? menuDataRender(item.children) : undefined,
            }
            return Authorized.check(item.authority, localItem, null) as MenuDataItem
        })
    )
}


const BasicLayout: React.FC<BasicLayoutProps> = (props) => {

    const {
        dispatch,
        children,
        location = {
            pathname: '/',
        },
        currentUser = {
            menuData: {
                data: [],
                loading: true
            }
        }
    } = props

    const [title] = useState<string>('TwelveT')

    const [keyWord, setKeyWord] = useState('')

    /**
     * 关键字搜索菜单
     * 
     * @param data 
     * @param keyWord 
     */
    const filterByMenuDate = (data: MenuDataItem[], keyWord: string): MenuDataItem[] => {
        return data
            .map((item) => {
                if ((item.name && item.name.includes(keyWord)) ||
                    filterByMenuDate(item.children || [], keyWord).length > 0) {
                    return {
                        ...item,
                        children: filterByMenuDate(item.children || [], keyWord),
                    }
                }
                return undefined
            })
            .filter((item) => item) as MenuDataItem[]
    }


    /**
     * init variables
     */

    const handleMenuCollapse = (payload: boolean): void => {
        if (dispatch) {
            dispatch({
                type: 'global/changeLayoutCollapsed',
                payload,
            })
        }
    } // get children authority

    const authorized = getAuthorityFromRouter(props.route.routes, location.pathname || '/') || {
        authority: undefined,
    }
    const { formatMessage } = useIntl()

    return (
        <ProLayout
            navTheme='dark'
            // 拂晓蓝
            primaryColor='#1890ff'
            layout='side'
            contentWidth='Fluid'
            fixedHeader={false}
            fixSiderbar={true}
            colorWeak={false}
            iconfontUrl='//at.alicdn.com/t/font_2059726_do160kxqhh.js'
            menu={{
                defaultOpenAll: false,
                locale: false,
                // 控制菜单渲染
                loading: currentUser.menuData.loading,
            }}
            logo={logo}
            // 渲染菜单数据
            menuDataRender={() => currentUser.menuData.data}
            // 额外主体渲染
            menuExtraRender={({ collapsed }) =>
                // 菜单搜索框
                !collapsed && (
                    <Input.Search
                        allowClear
                        enterButton
                        placeholder='搜索菜单'
                        size='small'
                        onSearch={(e) => {
                            setKeyWord(e);
                        }}
                    />
                )
            }
            postMenuData={(menus) => filterByMenuDate(menus || [], keyWord)}
            // 标题
            title={title}
            formatMessage={formatMessage}
            onCollapse={handleMenuCollapse}
            // 点击头部Logo
            onMenuHeaderClick={() => history.push('/')}
            // 重写菜单渲染
            menuItemRender={(TWTProps) => {
                return (
                    <span className="ant-pro-menu-item">
                        <Link to={TWTProps.path ? TWTProps.path : '#'}>
                            <span role="img" className="anticon">
                                {TWTProps.icon && < IconFont type={TWTProps.icon.toString()} />}
                            </span>

                            <span>
                                {TWTProps.name}
                            </span>
                        </Link>
                    </span>
                )
            }}
            // 重写拥有子菜单菜单项的 render 方法
            subMenuItemRender={(TWTProps) => {
                return (
                    <>
                        <span className="ant-pro-menu-item">
                            <span role="img" className="anticon">
                                {TWTProps.icon && < IconFont type={TWTProps.icon.toString()} />}
                            </span>

                            <span>
                                {TWTProps.name}
                            </span>
                        </span>

                    </>
                )
            }}
            breadcrumbRender={(routers = []) => [
                {
                    path: '/',
                    breadcrumbName: formatMessage({ id: 'menu.home' }),
                },
                ...routers,
            ]}
            itemRender={(route, params, routes, paths) => {
                const first = routes.indexOf(route) === 0
                return first ? (
                    <Link to={paths.join('/')}>{route.breadcrumbName}</Link>
                ) : (
                        <span>{route.breadcrumbName}</span>
                    )
            }}
            footerRender={() => <Footer />}
            rightContentRender={() => <RightContent />}
            {...props}

        >
            <Authorized authority={authorized!.authority} noMatch={noMatch}>
                {/* 页面位置信息 */}
                <PageHeaderWrapper>
                    {/* 内容 */}
                    {children}
                </PageHeaderWrapper>
            </Authorized>
        </ProLayout >
    )
}

export default connect(({ user, global, settings }: ConnectState) => ({
    currentUser: user.currentUser,
    collapsed: global.collapsed,
    settings,
}))(BasicLayout)
