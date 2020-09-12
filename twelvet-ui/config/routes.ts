export default [
    // 登录
    {
        title: '登录',
        name: 'login',
        path: '/login',
        component: '../layouts/Login',
        routes: [
            {
                title: '首页页',
                name: 'login',
                path: '/login',
                component: './login',
            },
        ],
    },
    {
        path: '/',
        component: '../layouts/SecurityLayout',
        routes: [{
            path: '/',
            component: '../layouts/Layout',
            routes: [
                {
                    title: '首页',
                    path: '/',
                    redirect: '/index',
                },
                {
                    authority: ['admin', 'user'],
                    title: '首页',
                    name: 'home',
                    path: '/index',
                    icon: 'icon-home',
                    component: './index',
                },
                {
                    title: '系统管理',
                    name: 'systemManagement',
                    icon: 'icon-system',
                    path: '/system',
                    routes: [
                        {
                            title: '职员管理',
                            icon: 'icon-team',
                            name: 'staffManagement',
                            path: '/system/staff',
                            component: './system/staff'
                        }
                    ]
                },
                {
                    title: '账号管理',
                    name: 'account',
                    icon: 'icon-account',
                    path: '/account',
                    routes: [
                        {
                            title: '个人中心',
                            name: 'center',
                            icon: 'icon-user-info',
                            path: '/account/center',
                            component: './account/center'
                        },
                        {
                            title: '个人设置',
                            name: 'settings',
                            icon: 'icon-settings',
                            path: '/account/settings',
                            component: './account/settings'
                        }
                    ]
                },
                {
                    title: '工具箱',
                    name: 'tool',
                    icon: 'icon-tool-box',
                    path: '/tool',
                    routes: [
                        {
                            title: '图形化编辑器',
                            name: 'graphicalEditor',
                            icon: 'icon-graphical-edit',
                            path: '/tool/graphicalEditor',
                            routes: [
                                {
                                    title: '流程编辑器',
                                    name: 'flow',
                                    icon: 'icon-flow-edit',
                                    path: '/tool/graphicalEditor/flow',
                                    component: './tool/graphicalEditor/flow'
                                },
                                {
                                    title: '脑图编辑器',
                                    name: 'mind',
                                    icon: 'icon-mind-edit',
                                    path: '/tool/graphicalEditor/mind',
                                    component: './tool/graphicalEditor/mind'
                                },
                                {
                                    title: '拓扑编辑器',
                                    name: 'koni',
                                    icon: 'icon-koni-edit',
                                    path: '/tool/graphicalEditor/koni',
                                    component: './tool/graphicalEditor/koni'
                                },
                            ]
                        }
                    ]
                },
            ],
        },
        {
            component: './404',
        }
        ]
    }
]
