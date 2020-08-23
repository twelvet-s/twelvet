import React, { useEffect } from 'react';
import { Tabs } from 'antd';
import LoginContext, { LoginContextProps } from './LoginContext';

/**
 * 菜单切换
 */
const { TabPane } = Tabs;

// 生成唯一ID
const generateId = (() => {
  let i = 0;
  return (prefix = '') => {
    i += 1;
    return `${prefix}${i}`;
  };
})();

type TabPaneProps = Parameters<typeof Tabs.TabPane>[0];

interface LoginTabProps extends TabPaneProps {
  tabUtil: LoginContextProps['tabUtil'];
  active?: boolean;
}

// 返回菜单 
const LoginTab: React.FC<LoginTabProps> = (props) => {
  useEffect(() => {
    const uniqueId = generateId('login-tab-');
    const { tabUtil } = props;
    if (tabUtil) {
      tabUtil.addTab(uniqueId);
    }
  }, []);
  const { children } = props;
  return <TabPane {...props}>{props.active && children}</TabPane>;
};

const WrapContext: React.FC<TabPaneProps> & {
  typeName: string;
} = (props) => (
  <LoginContext.Consumer>
    {(value) => <LoginTab tabUtil={value.tabUtil} {...props} />}
  </LoginContext.Consumer>
);

// 标志位 用来判断是不是自定义组件
WrapContext.typeName = 'LoginTab';

export default WrapContext;