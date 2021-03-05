import { MenuDataItem, getMenuData, getPageTitle } from '@ant-design/pro-layout'
import { Helmet, HelmetProvider } from 'react-helmet-async'
import { Link, SelectLang, useIntl, ConnectProps, connect } from 'umi'
import React from 'react'
import { ConnectState } from '@/models/connect'
import Footer from '@/components/TwelveT/Footer'
import logo from '@/assets/logo.png'
import styles from './Login.less'

export interface UserLayoutProps extends Partial<ConnectProps> {
    breadcrumbNameMap: {
        [path: string]: MenuDataItem
    }
}

const Layout: React.FC<UserLayoutProps> = (props) => {
    const {
        route = {
            routes: [],
        },
    } = props
    const { routes = [] } = route
    const {
        children,
        location = {
            pathname: '',
        },
    } = props
    const { formatMessage } = useIntl()
    const { breadcrumb } = getMenuData(routes)
    const title = getPageTitle({
        pathname: location.pathname,
        formatMessage,
        breadcrumb,
        ...props,
    })
    return (
        <HelmetProvider>
            <Helmet>
                <title>{title}</title>
                <meta name="description" content={title} />
            </Helmet>

            <div className={styles.container}>
                <div className={styles.lang}>
                    <SelectLang />
                </div>
                <div className={styles.content}>
                    <div className={styles.top}>
                        <div className={styles.header}>
                            <Link to="/">
                                <img alt="logo" className={styles.logo} src={logo} />
                                <span className={styles.title}>TwelveT 微服务</span>
                            </Link>
                        </div>
                        <div className={styles.desc}>愚者愚成 智者败智</div>
                    </div>
                    {children}
                </div>
                <Footer />
            </div>
        </HelmetProvider>
    )
}

export default connect(({ settings }: ConnectState) => ({ ...settings }))(Layout)
