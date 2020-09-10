export default [
    // 登录
    {
        name: 'login',
        path: '/login',
        component: '../layouts/Login',
        routes: [
            {
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
                    path: '/',
                    redirect: '/index',
                },
                // 首页
                {
                    authority: ['admin', 'user'],
                    name: 'home',
                    path: '/index',
                    icon: 'HomeOutlined',
                    component: './index',
                },
                // 系统管理
                {
                    name: 'systemManagement',
                    icon: 'setting',
                    routes: [
                        // 职员管理
                        {
                            name: 'staffManagement',
                            path: '/staff',
                            component: './system/staff'
                        }
                    ]
                },
                // 工具
                {
                    name: 'tool',
                    icon: 'tool',
                    routes: [
                        // 图形化编辑器
                        {
                            name: 'graphicalEditor',
                            icon: 'setting',
                            path: '/tool/graphicalEditor',
                            routes: [
                                {
                                    // 脑图
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
