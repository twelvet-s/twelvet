import { Row, Col } from 'antd'
import React from 'react'

/**
 * 操作面板
 */
const Panel = () => {
    return (
        <>
            <Row gutter={[15, 30]}>
                <Col sm={{ span: 12 }} xs={{ span: 24 }} style={{ background: "#fff" }}>
                    <Row>
                        <Col>
                            12
                        </Col>

                        <Col>231231</Col>
                    </Row>
                </Col>

                <Col sm={{ span: 12 }} xs={{ span: 24 }} style={{ background: "#fff" }}>
                    <div>
                        <div></div>
                        <div></div>
                    </div>
                </Col>
            </Row>

            <Row gutter={[15, 30]}>
                <Col sm={{ span: 12 }} xs={{ span: 24 }} style={{ background: "#fff" }}>
                    <div>
                        <div></div>
                        <div></div>
                    </div>
                </Col>

                <Col sm={{ span: 12 }} xs={{ span: 24 }} style={{ background: "#fff" }}>
                    <div>
                        <div></div>
                        <div></div>
                    </div>
                </Col>
            </Row>
        </>
    )
}

export default Panel