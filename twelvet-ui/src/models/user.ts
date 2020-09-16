import { Effect, Reducer } from 'umi'

import { queryCurrent, query as queryUsers, currentUser } from '@/services/user'

export interface CurrentUser {
    username?: string
    avatar?: string
}

export interface UserModelState {
    currentUser?: CurrentUser
}

export interface UserModelType {
    namespace: 'user'
    state: UserModelState
    effects: {
        fetch: Effect
        fetchCurrent: Effect
        currentUser: Effect
    }
    reducers: {
        setCurrentUser: Reducer<UserModelState>
        saveCurrentUser: Reducer<UserModelState>
        changeNotifyCount: Reducer<UserModelState>
    }
}

const UserModel: UserModelType = {
    namespace: 'user',

    state: {
        currentUser: {},
    },

    effects: {
        /**
         * 
         * @param _ 获取当前登录用户的信息
         * @param param1 
         */
        *currentUser(_, { call, put }) {
            //const res = yield call(currentUser)
            yield put({
                type: 'setCurrentUser',
                //payload: res.data,
            })
        },



        *fetch(_, { call, put }) {
            const response = yield call(queryUsers)
            yield put({
                type: 'save',
                payload: response,
            })
        },
        *fetchCurrent(_, { call, put }) {
            const response = yield call(queryCurrent)
            yield put({
                type: 'saveCurrentUser',
                payload: response,
            })
        },
    },

    reducers: {
        /**
         * 设置当前用户信息
         * @param state 
         * @param action 
         */
        setCurrentUser(state, action) {
            return {
                ...state,
                currentUser: {
                    username: 'admin',
                    avatar: '/update'
                }
            }
        },

        saveCurrentUser(state, action) {
            return {
                ...state,
            }
        },
        changeNotifyCount(
            state = {
                currentUser: {},
            },
            action,
        ) {
            return {
                ...state,
                currentUser: {
                    ...state.currentUser,
                    notifyCount: action.payload.totalCount,
                    unreadCount: action.payload.unreadCount,
                },
            }
        },
    },
}

export default UserModel
