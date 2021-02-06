import { Button, Result } from 'antd'
import React from 'react'
import { history } from 'umi'

const NoFoundPage: React.FC<{}> = () => {
	return (
		<Result
			status="404"
			title="404"
			subTitle="Sorry, the page you visited does not exist."
			extra={
				[
					<Button type="primary" onClick={() => history.goBack()}>
						返回上一页
					</Button>,
					<Button type="primary" onClick={() => history.push('/')}>
						Back Home
					</Button>
				]
			}
		/>
	)
}

// 修复umi bug兼容404
NoFoundPage.path = undefined

export default NoFoundPage
