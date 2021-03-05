import { Effect, Reducer } from 'umi';
import { CurrentUser } from './data.d';
import { queryCurrent } from './service';

export interface ModalState {
    currentUser?: Partial<CurrentUser>;
    isLoading?: boolean;
}

export interface ModelType {
    namespace: string;
    state: ModalState;
    effects: {
        fetchCurrent: Effect;
    };
    reducers: {
        saveCurrentUser: Reducer<ModalState>;
    };
}

const Model: ModelType = {
    namespace: 'accountAndsettings',

    state: {
        currentUser: {},
        isLoading: false,
    },

    effects: {
        *fetchCurrent(_, { call, put }) {
            const response = yield call(queryCurrent);
            yield put({
                type: 'saveCurrentUser',
                payload: response.data.user,
            });
        }
    },

    reducers: {
        saveCurrentUser(state, action) {
            return {
                ...state,
                currentUser: action.payload || {},
            };
        }
    },
};

export default Model;
