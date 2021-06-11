import React from 'react';
import { DefaultFooter } from '@ant-design/pro-layout';
import { GithubOutlined } from '@ant-design/icons';

/**
 * Footer版权信息
 */
const Footer = () => {
    return (
        <DefaultFooter
            copyright={`${new Date().getFullYear()} TwelveT`}
            links={
                [
                    {
                        key: 'TwelveT',
                        title: 'TwelveT',
                        href: 'https://www.twelvet.cn',
                        blankTarget: true,
                    },
                    {
                        key: 'Github',
                        title: <GithubOutlined />,
                        href: 'https://gitee.com/twelvet/twelvet',
                        blankTarget: true,
                    },
                    {
                        key: '开发文档',
                        title: '开发文档',
                        href: 'https://www.twelvet.cn/docs',
                        blankTarget: true,
                    },
                ]}
        />
    )
}

export default Footer;