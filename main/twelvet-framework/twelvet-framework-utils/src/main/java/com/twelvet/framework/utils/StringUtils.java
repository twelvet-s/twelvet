package com.twelvet.framework.utils;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 字符串工具类
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils {

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
     * 、下划线转驼峰命名
     *
     * @param str String
     * @return 处理结果
     */
    public static String toUnderScoreCase(String str) {
        if (str == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        // 前置字符是否大写
        boolean preCharIsUpperCase = true;
        // 当前字符是否大写
        boolean curreCharIsUpperCase = true;
        // 下一字符是否大写
        boolean nexteCharIsUpperCase = true;
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (i > 0) {
                preCharIsUpperCase = Character.isUpperCase(str.charAt(i - 1));
            } else {
                preCharIsUpperCase = false;
            }

            curreCharIsUpperCase = Character.isUpperCase(c);

            if (i < (str.length() - 1)) {
                nexteCharIsUpperCase = Character.isUpperCase(str.charAt(i + 1));
            }

            if (preCharIsUpperCase && curreCharIsUpperCase && !nexteCharIsUpperCase) {
                sb.append(UNDERLINE);
            } else if ((i != 0 && !preCharIsUpperCase) && curreCharIsUpperCase) {
                sb.append(UNDERLINE);
            }
            sb.append(Character.toLowerCase(c));
        }

        return sb.toString();
    }

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

    /**
     * 截取字符串
     *
     * @param str   字符串
     * @param start 开始
     * @param end   结束
     * @return 结果
     */
    public static String substring(final String str, int start, int end) {
        if (str == null) {
            return EMPTY;
        }

        if (end < 0) {
            end = str.length() + end;
        }
        if (start < 0) {
            start = str.length() + start;
        }

        if (end > str.length()) {
            end = str.length();
        }

        if (start > end) {
            return EMPTY;
        }

        if (start < 0) {
            start = 0;
        }
        if (end < 0) {
            end = 0;
        }

        return str.substring(start, end);
    }

}
