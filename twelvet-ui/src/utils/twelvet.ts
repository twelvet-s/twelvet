import TWT from '@/setting'

/**
 * 系统日志输出
 */
export const system = {
    log: (...args: any) => {
        if (TWT.isDev) {
            console.log('【TWT】Log:', ...args)
        }
    },
    table: (...args: [any]) => {
        if (TWT.isDev) {
            console.table('【TWT】Table:', ...args)
        }
    },
    error: (...args: any) => {
        if (TWT.isDev) {
            console.error('【TWT】Error:', ...args)
        }
    },
    trace: (...args: any) => {
        if (TWT.isDev) {
            console.trace('【TWT】Trace:', ...args)
        }
    }
}