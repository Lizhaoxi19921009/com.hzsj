package com.utils;

import java.lang.reflect.Type;

import com.google.gson.Gson;

/**
 * json ��������
 * 
 * @author menglei
 * @version 1.0
 */
public final class GsonUtil {

	private GsonUtil() {

	}

	/**
	 * ObjectתJSON����
	 * 
	 * @param obj
	 * @return
	 */
	public static String toJson(Object object) {
		String json = null;
		if (object != null) {
			Gson gson = new Gson();
			json = gson.toJson(object);
		}
		return json;
	}

	/**
	 * �ַ���תjava����
	 * 
	 * @param str
	 * @param clazz
	 * @return
	 */
	public static <T> T fromJson(String json, Class<T> clazz) {
		T t = null;
		if (json != null) {
			Gson gson = new Gson();
			t = gson.fromJson(json, clazz);
		}
		return t;
	}

	/**
	 * �ַ���תjava����
	 * @param json
	 * @param type
	 * @return
	 */
	public static <T> T fromJson(String json, Type type) {
		T t = null;
		if (json != null) {
			Gson gson = new Gson();
			t = gson.fromJson(json, type);
		}
		return t;
	}
}
