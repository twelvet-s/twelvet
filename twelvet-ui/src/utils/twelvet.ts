import TWT from '@/setting'

/**
 * 
 * @param args 日志输出工具
 */
export const log = (...args: any) => {
    if (TWT.isDev) {
        console.log('【TWT】', ...args)
    }
}