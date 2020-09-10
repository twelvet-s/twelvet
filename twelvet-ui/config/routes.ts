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
                    icon: 'home',
                    component: './index',
                },
                {
                    title: '系统管理',
                    name: 'systemManagement',
                    icon: 'icon-setting',
                    path: '/system',
                    routes: [
                        {
                            title: '职员管理',
                            name: 'staffManagement',
                            path: '/system/staff',
                            component: './system/staff'
                        }
                    ]
                },
                {
                    title: '工具箱',
                    name: 'tool',
                    icon: 'icon-toolbox',
                    path: '/tool',
                    routes: [
                        {
                            title: '图形化编辑器',
                            name: 'graphicalEditor',
                            icon: 'icon-setting',
                            path: '/tool/graphicalEditor',
                            routes: [
                                {
                                    title: '脑图编辑器',
                                    name: 'mind',
                                    path: '/tool/graphicalEditor/mind',
                                    component: './tool/graphicalEditor/mind'
                                }
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
