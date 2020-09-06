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
                    path: '/index',
                    name: 'home',
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
                            path: '/staff',
                            name: 'staffManagement',
                            component: './system/staff'
                        }
                    ]
                },
                {
                    component: './404',
                },
            ],
        },
        {
            component: './404',
        }
        ]
    }
]
