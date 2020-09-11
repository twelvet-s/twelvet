import { Col, Row } from 'antd';
import GGEditor, { Koni } from 'gg-editor';


import React from 'react';
import EditorMinimap from './components/EditorMinimap';
import { KoniContextMenu } from './components/EditorContextMenu';
import { KoniDetailPanel } from './components/EditorDetailPanel';
import { KoniItemPanel } from './components/EditorItemPanel';
import { KoniToolbar } from './components/EditorToolbar';
import styles from './index.less';

GGEditor.setTrackable(false);

export default () => (
	<GGEditor className={styles.editor}>
		<Row className={styles.editorHd}>
			<Col span={24}>
				<KoniToolbar />
			</Col>
		</Row>
		<Row className={styles.editorBd}>
			<Col sm={{ span: 2 }} xs={{ span: 24 }} className={styles.editorSidebar}>
				<KoniItemPanel />
			</Col>
			<Col sm={{ span: 16 }} xs={{ span: 24 }} className={styles.editorContent}>
				<Koni className={styles.koni} />
			</Col>
			<Col sm={{ span: 6 }} xs={{ span: 24 }} className={styles.editorSidebar}>
				<KoniDetailPanel />
				<EditorMinimap />
			</Col>
		</Row>
		<KoniContextMenu />
	</GGEditor>
);
