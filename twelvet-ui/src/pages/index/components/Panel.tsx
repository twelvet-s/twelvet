import { GithubOutlined, HomeOutlined } from '@ant-design/icons'
import { Button, Card, Col, Divider, Row } from 'antd'
import React from 'react'
import styles from './styles.less'

/**
 * 消息面板
 */
const Panel = () => {
    return (
        <Card title="TwelveT">
            <p>
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
            </p>
            <Divider />
            <p>
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
            </p>
            <Divider />
            <h1>TwelveT 微服务</h1>
            
            <Row>
                <Col md={{ span: 16 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                    这是简介
                </Col>

                <Col md={{ span: 8 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                    <h2>技术选型</h2>
                    <Row>
                        <Col md={{ span: 16 }} sm={{ span: 24 }} xs={{ span: 24 }}>
                            <h3>后端技术</h3>
                            <ul>
                                <li>Spring Boot</li>
                                <li>Spring Boot Alibaba</li>
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
                            <a target='_blank' href="https://github.com/twelvet-s/twelvet/">
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