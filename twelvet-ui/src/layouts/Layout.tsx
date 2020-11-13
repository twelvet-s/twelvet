/**
 * Ant Design Pro v4 use `@ant-design/pro-layout` to handle Layout.
 * You can view component api by:
 * https://github.com/ant-design/ant-design-pro-layout
 */
import ProLayout, { BasicLayoutProps as ProLayoutProps, Settings, MenuDataItem } from '@ant-design/pro-layout'
import { createFromIconfontCN } from '@ant-design/icons'
import React, { useEffect, useState } from 'react'
import { Link, useIntl, connect, Dispatch, history } from 'umi'
import { Result, Button } from 'antd'
import Authorized from '@/utils/Authorized'
import RightContent from '@/components/GlobalHeader/RightContent'
import { ConnectState } from '@/models/connect'
import { getAuthorityFromRouter } from '@/utils/utils'
import logo from '../assets/logo.svg'
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

    const [menuData, setMenuData] = useState<MenuDataItem[]>([])

    // 菜单加载状态控制
    const [loading, setLoading] = useState(true);

    const [title, setTitle] = useState<string>('undefined')

    const {
        dispatch,
        children,
        settings,
        location = {
            pathname: '/',
        },
        currentUser = {}
    } = props

    /**
     * 当获取到最新菜单时执行
     */
    useEffect(() => {
        const { menus = [] } = currentUser;
        setMenuData(menus)
        // 设置标题
        setTitle('TwelveT')
    }, [currentUser])

    /**
     * 当数据发生改变时执行
     */
    useEffect(() => {
        if(menuData.length > 0){
            setLoading(false)
        }
    }, [menuData])

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
            logo={logo}
            menu={{
                defaultOpenAll: false,
                locale: false,
                // 控制菜单渲染
                loading,
            }}
            // 渲染菜单数据
            menuDataRender={() => menuData}
            // 标题
            title={title}
            formatMessage={formatMessage}
            onCollapse={handleMenuCollapse}
            // 点击头部Logo
            onMenuHeaderClick={() => history.push('/')}
            // 重写菜单渲染
            menuItemRender={(TWTProps, TWTDom) => {
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
            {...settings}

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
