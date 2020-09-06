package com.twelvet.framework.utils;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: twelvet工具类
 */
public class TWTUtils {

    /**
     * * 判断一个Collection是否非空，包含List，Set，Queue
     *
     * @param coll 要判断的Collection
     * @return true：非空 false：空
     */
    /*public static boolean isEmpty(Collection<?> coll)
    {
        return !isEmpty(coll);
    }*/

    /**
     * 判断一个对象是否为空
     *
     * @param object Object
     * @return true：为空 false：非空
     */
    public static boolean isEmpty(Object object)
    {
        return object == null;
    }

    public static boolean isNotEmpty(Object object){
        return !isEmpty(object);
    }

}
