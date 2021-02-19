import { ContentWidth } from '@ant-design/pro-layout/lib/defaultSettings';
import { MenuTheme } from 'antd/lib/menu/MenuContext';

type TwelveT = {
    /**
     * @name theme for nav menu
     */
    navTheme: MenuTheme | 'realDark' | undefined;
    /**
     * @name 顶部菜单的颜色，mix 模式下生效
     */
    headerTheme?: MenuTheme;
    /**
     * @name nav menu position: `side` or `top`
     */
    headerHeight?: number;
    /**
     * @name customize header height
     */
    layout: 'side' | 'top' | 'mix';
    /**
     * @name layout of content: `Fluid` or `Fixed`, only works when layout is top
     */
    contentWidth: ContentWidth;
    /**
     * @name sticky header
     */
    fixedHeader: boolean;
    /**
     * @name sticky siderbar
     */
    fixSiderbar: boolean;
    /**
     * @name menu 相关的一些配置
     */
    // menu?: {
    //     locale?: boolean;
    //     defaultOpenAll?: boolean;
    //     loading?: boolean;
    // };
    /**
     * @name Layout 的 title，也会显示在浏览器标签上
     * @description 设置为 false，在 layout 中只展示 pageName，而不是 pageName - title
     */
    title?: string | false;
    /**
     * Your custom iconfont Symbol script Url
     * eg：//at.alicdn.com/t/font_1039637_btcrd5co4w.js
     * 注意：如果需要图标多色，Iconfont 图标项目里要进行批量去色处理
     * Usage: https://github.com/ant-design/ant-design-pro/pull/3517
     */
    iconfontUrl: string;
    /**
     * @name 主色，需要配合 umi 使用
     */
    primaryColor: string;
    /**
     * @name 全局增加滤镜
     */
    colorWeak?: boolean;
    /**
     * @name 切割菜单
     * @description 只在 mix 模式下生效
     */
    splitMenus?: boolean;
};

const proSettings: TwelveT = {
    navTheme: 'dark',
    // 拂晓蓝
    primaryColor: '#1890ff',
    layout: 'side',
    contentWidth: 'Fluid',
    fixedHeader: false,
    fixSiderbar: true,
    colorWeak: false,
    title: 'TwelveT',
    //title: 'TwelveT',
    // menu: {
    //     locale: false,
    // },
    iconfontUrl: '',
};

export type { TwelveT };

export default proSettings;
