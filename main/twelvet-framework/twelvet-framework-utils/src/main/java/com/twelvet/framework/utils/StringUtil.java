package com.twelvet.framework.utils;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 字符串工具类
 */
public class StringUtil {

    /**
     * 空格字符串
     */
    public static final String SPACE = " ";

    /**
     * 空字符串
     */
    public static final String EMPTY = "";

    /**
     * 下划线字符串
     */
    public static final String UNDERLINE = "_";

    /**
     * 下划线转驼峰命名(此方法会自动去除所下划线)
     *
     * @param str String
     * @return String
     */
    public static String convertToCamelCase(String str) {
        if (isEmpty(str)) {
            return str;
        }
        // 默认初始化长度为16，小数据量意义不大
        StringBuilder result = new StringBuilder();
        // 原则上不允许出现空格
        String[] ss = str.split(UNDERLINE);

        for (String s : ss) {

            if (!str.contains(UNDERLINE)) {
                result.append(s);
                continue;
            }

            // 进行驼峰转换
            if (result.length() != 0) {
                result.append(s.substring(0, 1).toUpperCase());
                result.append(s.substring(1).toLowerCase());
            } else {
                // 首字母不转换
                result.append(s.toLowerCase());
            }
        }

        return result.toString();
    }

    /**
     * 驼峰命名转为下划线命名
     *
     * @param str String
     * @return String
     */
    public static String convertToUnderline(String str) {
        if (isEmpty(str)) {
            return str;
        }

        // 默认初始化长度为16，小数据量意义不大
        StringBuilder result = new StringBuilder();
        char[] currentChar = str.toCharArray();

        for (char c : currentChar) {
            if (Character.isUpperCase(c)) {
                result.append(UNDERLINE).append(Character.toLowerCase(c));
            } else {
                result.append(c);
            }
        }

        return result.toString();
    }

    /**
     * * 判断字符串是否为空
     *
     * @param str String
     * @return true：空 false：非空
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

}
