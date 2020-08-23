import { Effect, Reducer } from 'umi';
import { pageQuery } from './service';

export interface ModelType {
    namespace: string;
    state: {
        datasource?: any,
        datas?: any
    };
    effects: {
        pageQuery: Effect;
    };
    reducers: {
        SetpageQuery: Reducer;
    };
}

const StaffModel: ModelType = {
    // 命名空间
    namespace: 'staffManagement',
    // state
    state: {
        datasource: undefined,
        datas: ''
    },
    // 数据交互
    effects: {
        *pageQuery({ payload }, { call, put }) {
            // 发起请求并返回数据给予调用者
            const response = yield call(pageQuery, payload);
            yield put({
                type: 'SetpageQuery',
                payload: response,
            });

        },
    },
    // 返回数据
    reducers: {
        SetpageQuery(state, { payload }) {
            return { ...state, datasource: payload.data }
        },
    },
};

export default StaffModel