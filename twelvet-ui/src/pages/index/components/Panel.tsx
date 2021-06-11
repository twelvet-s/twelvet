import { GithubOutlined, HomeOutlined } from '@ant-design/icons'
import { Button, Card, Col, Divider, Row, Tag } from 'antd'
import React from 'react'
import styles from './styles.less'

/**
 * 消息面板
 */
const Panel = () => {
    return (
        <Card title="公告">
            <div>
                领取阿里云通用云产品1888优惠券：
                ☛☛
                <a href="https://promotion.aliyun.com/ntms/yunparter/invite.html?userCode=jcjwnfv3" target='_blank'>
                    阿里云推广大使
                </a>
                <Divider type='vertical' />
                <a href="https://www.aliyun.com/1111/new?userCode=jcjwnfv3" target='_blank'>
                    服务器秒杀
                </a>
                ☚☚
            </div>
            <Divider />
            <div>
                腾讯云服务器秒杀区：
                ☛☛
                <a href="https://curl.qcloud.com/cAvXfLWI" target='_blank'>
                    新用户优惠券
                </a>
                <Divider type='vertical' />
                <a href="https://curl.qcloud.com/VrLWYkZI" target='_blank'>
                    服务器秒杀
                </a>
                ☚☚
            </div>
            <Divider />
            <h1>
                TwelveT 微服务
                <Divider type="vertical" />
                <a target='_blank' href="https://gitee.com/twelvet/twelvet/">
                    <Tag icon={<GithubOutlined />} color='success'>
                        免费开源 
                    </Tag>
                </a>
            </h1>

            <Row gutter={[15, 30]}>
                <Col md={{ span: 16 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                    <p> 一套以微服务架构的脚手架,使用Spring Boot Alibaba系列进行架构,学习并了解它将能快速掌握微服务核心基础。</p>
                    <p>此项目是为了减少业务代码的重复轮子,它具有一个系统该有的通用性核心业务代码,无论是微服务还是单体,都是通用的业务</p>
                    <p>但更多的,是为了学习微服务的理念以及开发</p>
                    <p>您可以使用它进行网站管理后台，网站会员中心，CMS，CRM，OA等待系统的开发,当然,不仅仅是一些小系统,我们可以生产更多的服务模块,不断完善项目！！！</p>
                    <p>微服务显然是一个庞然大物,本项目目前说仅一人在维护开发,精力十分有限。所以并不能保证绝对的功能性，但，也希望通过日后的维护不断地完善出来！！！</p>
                </Col>

                <Col md={{ span: 8 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                    <h2>技术选型</h2>
                    <Row>
                        <Col md={{ span: 16 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                            <h3>后端技术</h3>
                            <ul>
                                <li>Spring Boot</li>
                                <li>Spring Cloud Alibaba</li>
                                <li>Nacos</li>
                                <li>Fast DFS</li>
                                <li>...</li>
                            </ul>
                        </Col>

                        <Col md={{ span: 8 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                            <h3>前端技术</h3>
                            <ul>
                                <li>React</li>
                                <li>Umi</li>
                                <li>Antd</li>
                                <li>Axios</li>
                                <li>...</li>
                            </ul>
                        </Col>
                    </Row>

                    <Row>
                        <Col className={styles.topSpace} xxl={{ span: 12 }} xl={{ span: 24 }} xs={{ span: 24 }}>
                            <a target='_blank' href="https://gitee.com/twelvet/twelvet/">
                                <Button type='primary'>
                                    <GithubOutlined />
                                    GitHub
                                </Button>
                            </a>
                        </Col>
                        <Col className={styles.topSpace} xxl={{ span: 12 }} xl={{ span: 24 }} xs={{ span: 24 }}>
                            <a target='_blank' href="https://www.twelvet.cn/">
                                <Button type='default'>
                                    <HomeOutlined />
                                    官方网站
                                </Button>
                            </a>
                        </Col>
                    </Row>
                </Col>
            </Row>
        </Card >
    )
}

export default Panel