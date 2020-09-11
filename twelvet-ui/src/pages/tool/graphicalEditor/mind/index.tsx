import { Col, Row } from 'antd';
import GGEditor, { Mind } from 'gg-editor';

import React from 'react';
import EditorMinimap from './components/EditorMinimap';
import { MindContextMenu } from './components/EditorContextMenu';
import { MindDetailPanel } from './components/EditorDetailPanel';
import { MindToolbar } from './components/EditorToolbar';
import styles from './index.less';

GGEditor.setTrackable(false);

export default () => (
	<GGEditor className={styles.editor}>
		<Row className={styles.editorHd}>
			<Col span={24}>
				<MindToolbar />
			</Col>
		</Row>
		<Row className={styles.editorBd}>
			<Col sm={{ span: 20 }} xs={{ span: 24 }} className={styles.editorContent}>
				<Mind className={styles.mind} />
			</Col>
			<Col sm={{ span: 4 }} xs={{ span: 24 }} className={styles.editorSidebar}>
				<MindDetailPanel />
				<EditorMinimap />
			</Col>
		</Row>
		<MindContextMenu />
	</GGEditor>
);
