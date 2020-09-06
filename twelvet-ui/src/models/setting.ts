import { Reducer } from 'umi';
import twelvet, { TwelveT } from '../../config/twelvet';

export interface SettingModelType {
    namespace: 'settings';
    state: TwelveT;
    reducers: {
        changeSetting: Reducer<TwelveT>;
    };
}

const updateColorWeak: (colorWeak: boolean) => void = (colorWeak) => {
    const root = document.getElementById('root');
    if (root) {
        root.className = colorWeak ? 'colorWeak' : '';
    }
};

const SettingModel: SettingModelType = {
    namespace: 'settings',
    state: twelvet,
    reducers: {
        changeSetting(state = twelvet, { payload }) {
            const { colorWeak, contentWidth } = payload;

            if (state.contentWidth !== contentWidth && window.dispatchEvent) {
                window.dispatchEvent(new Event('resize'));
            }
            updateColorWeak(!!colorWeak);
            return {
                ...state,
                ...payload,
            };
        },
    },
};
export default SettingModel;
