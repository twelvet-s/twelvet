import { createContext } from 'react';

export interface LoginContextProps {
  tabUtil?: {
    addTab: (id: string) => void;
    removeTab: (id: string) => void;
  };
  updateActive?: (activeItem: { [key: string]: string } | string) => void;
}
/**
 * 使用Context共享全局数据
 */
const LoginContext: React.Context<LoginContextProps> = createContext({});

export default LoginContext;