/**
 * Ant Design Pro v4 use `@ant-design/pro-layout` to handle Layout.
 * You can view component api by:
 * https://github.com/ant-design/ant-design-pro-layout
 */
import ProLayout, { PageHeaderWrapper, BasicLayoutProps as ProLayoutProps, Settings, MenuDataItem, PageLoading, SettingDrawer } from '@ant-design/pro-layout'
import { createFromIconfontCN } from '@ant-design/icons'
import React, { useEffect, useState } from 'react'
import { Link, useIntl, connect, Dispatch, history, Redirect } from 'umi'
import { Result, Button, Input, Tabs, Dropdown, Menu, message } from 'antd'
import Authorized from '@/utils/Authorized'
import RightContent from '@/components/GlobalHeader/RightContent'
import { ConnectState } from '@/models/connect'
import { getAuthorityFromRouter } from '@/utils/utils'
import logo from '@/assets/logo.png'
import Footer from '@/components/TwelveT/Footer'
import { CurrentUser } from '@/models/user'
import TWT from '../setting'
import { stringify } from 'querystring'
import styles from './index.less';

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
    currentUser: CurrentUser
    children: any
    location: {
        pathname: string
    }
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

    // 不存在token需要求登录
    if (props.location.pathname !== '/login' && !localStorage.getItem(TWT.accessToken)) {

        let queryString = stringify({
            redirect: window.location.href,
        });

        if (window.location.href.indexOf("login") > 0) {
            queryString = "";
        }

        return <Redirect to={`/login?${queryString}`} />
    }

    // 登录组件
    if (props.location.pathname === '/login') {
        return props.children
    }

    let menus: MenuDataItem[] = [];
    let tabMenus: { title: string, key: string, path: string, closable: boolean }[] = [];
    const defaultTabs: { title: string, key: string, path: string, closable: boolean }[] = [{
        title: '欢迎页',
        key: '/',
        path: '/',
        closable: false,
    }]


    const [tabs, setTabs] = useState<{ title: string, key: string, path: string, closable: boolean }[]>(defaultTabs);
    const [activeTabKey, setActiveTabKey] = useState<string>('');

    const removeTabs = (activeKey, action) => {
        if (action === "remove") {
            const newTabs = [...tabs];
            let index = 0;
            for (let i = 0; i < tabs.length; i += 1) {
                if (tabs[i].key === activeKey) {
                    index = i;
                    break;
                }
            }
            let openIndex = 0;
            if (index === 0) {
                // 说明我们删除的是的一个标签。打开标签应该是下一个
                openIndex = index + 1;
            } else {
                openIndex = index - 1;
            }
            if (openIndex >= tabs.length) {
                message.destroy();
                message.warn("至少保留一个标签");
            } else {
                history.push(tabs[openIndex].key);
                setActiveTabKey(tabs[openIndex].key);
                setTabs(newTabs.filter(item => item.key !== activeTabKey));
            }
        }
    }

    const closeTabs = ({ key }: { key: string }) => {
        if (key === "other") {
            // 关闭其他标签
            setTabs(tabs.filter(item => item.key === activeTabKey));
        } else if (key === "all") {
            // 关闭所有标签
            history.push(defaultTabs[0].path);
            setActiveTabKey(defaultTabs[0].key);
            setTabs(defaultTabs);
        }
    }

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

    useEffect(() => {
        // 获取用户信息
        if (dispatch) {
            // 获取用户信息
            dispatch({
                type: 'user/getCurrentUser',
            })
        }
    }, [])

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

    // 全局加载页面
    if (currentUser.menuData.loading) {
        return <PageLoading />
    }

    return (
        <ProLayout
            navTheme='light'
            // 拂晓蓝
            primaryColor='#1890ff'
            layout='mix'
            contentWidth='Fluid'
            fixedHeader={false}
            fixSiderbar={true}
            // 是否开启分割菜单
            splitMenus={true}
            colorWeak={false}
            iconfontUrl='js/icon.js'
            // 渲染菜单数据
            menuDataRender={() => currentUser.menuData.data}
            menu={{
                defaultOpenAll: false,
                locale: false,
                // 控制菜单渲染
                loading: currentUser.menuData.loading,
            }}
            logo={logo}
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
                const DOM = (
                    <>
                        <span role="img" className="anticon">
                            {TWTProps.icon && < IconFont type={TWTProps.icon.toString()} />}
                        </span>
                        <span>
                            {TWTProps.name}
                        </span>
                    </>
                )
                return (
                    <span className="ant-pro-menu-item">
                        {TWTProps.isUrl ? (
                            <a target='_blank' href={TWTProps.path ? TWTProps.path : '#'}>
                                {DOM}
                            </a>
                        ) : (
                            <Link target={TWTProps.isUrl ? '_blank' : '_self'} to={TWTProps.path ? TWTProps.path : '#'}>
                                {DOM}
                            </Link>
                        )

                        }
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
            onPageChange={(location) => {
                // TODO 多tab栏的切换
                const currentTab = tabs.filter(tab => tab.path === location?.pathname);
                if (currentTab.length === 0) {
                    const newTabs = [...tabs];
                    const currentTabMenu = tabMenus.filter(tabMenu => tabMenu.path === location?.pathname);
                    if (currentTabMenu.length > 0) {
                        newTabs.push({
                            ...currentTabMenu[0],
                        });
                        setTabs(newTabs);
                    }
                }
                setActiveTabKey(location?.pathname || '');
            }}
            onOpenChange={(openKeys) => {
                if (openKeys.length === 1) {
                    const currentFirstMenu = menus.filter(item => item.path === openKeys[0]);
                    if (currentFirstMenu && currentFirstMenu.length > 0 && currentFirstMenu[0].children) {
                        const secondMenu = currentFirstMenu[0].children[0];
                        if (secondMenu.children) {
                            history.push(secondMenu.children[0].path);
                        } else {
                            history.push(secondMenu.path);
                        }
                    }
                }
            }}
            handleOpenChange={(openKeys) => {
                const { host, href } = window.location;
                const currentUrl = href.substr(href.indexOf("localhost:8000") + host.length);
                const currentFirstMenu = menus.filter(item => item.path === openKeys[0]);
                // const currentFirstMenu1 = menus.filter(item => item.path === currentUrl);
                // if (currentFirstMenu1.length === 0) {
                //     history.push(currentUrl);
                //     return;
                // }
                if (currentFirstMenu && currentFirstMenu.length > 0 && currentFirstMenu[0].children) {
                    const secondMenu = currentFirstMenu[0].children[0];
                    if (secondMenu.children) {
                        history.push(secondMenu.children[0].path);
                    } else {
                        history.push(secondMenu.path);
                    }
                }
            }}
            footerRender={() => <Footer />}
            rightContentRender={() => <RightContent />}
            {...props}

        >
            <Authorized authority={authorized!.authority} noMatch={noMatch}>

                <Tabs
                    className={styles.menuTabs}
                    type="editable-card"
                    activeKey={activeTabKey}
                    hideAdd
                    onTabClick={(activeKey) => {
                        setActiveTabKey(activeKey);
                        history.push(activeKey);
                    }}
                    onEdit={(e, action) => {
                        removeTabs(e, action);
                    }}
                    tabBarExtraContent={
                        <Dropdown overlay={
                            <Menu onClick={(e) => closeTabs(e)}>
                                <Menu.Item key='other'>
                                    关闭其他
                  </Menu.Item>
                                <Menu.Item key='all'>
                                    关闭全部
                  </Menu.Item>
                            </Menu>
                        } placement="bottomCenter">
                            <Button style={{ marginRight: 24 }} type='primary'>标签管理</Button>
                        </Dropdown>
                    }
                >
                    {
                        tabs.map(tab => <Tabs.TabPane key={tab.key} tab={tab.title} closable={!!tab.closable} />)
                    }
                </Tabs>

                {/* 页面位置信息 */}

                {/* 内容 */}
                <div className={styles.content}>
                    {children}
                </div>
            </Authorized>
        </ProLayout >
    )
}

export default connect(({ user, global, settings }: ConnectState) => ({
    currentUser: user.currentUser,
    collapsed: global.collapsed,
    settings,
}))(BasicLayout)
