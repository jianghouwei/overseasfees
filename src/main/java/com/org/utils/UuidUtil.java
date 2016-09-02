package com.org.utils;

import java.util.UUID;

public class UuidUtil {
	
	/** 随机数长度设置 */
	public static final Integer CODE_LENTH = 4;
	

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}
	
	/**
	 * 
	 * 获取应用编号
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	public static String getAppCode(){
		return "A"+getRamCode();
	}
	
	
	
	/**
	 * 
	 * 获取计费编号
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	public static String getPriceCode(){
		return "P"+getRamCode();
	}
	
	/**
	 * 
	 *  获取时间戳 + 1位随机数
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	public static  String getRamCode(){
		return String.valueOf(System.currentTimeMillis())+ String.valueOf(getRandomCode(1));
		
	}
	

	/**
	 * 获取指定长度随机数
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	public static String getRandomCode(int leg) {
		int rcode = (int) ((Math.random() * 9 + 1) * Math.pow(10, leg - 1));
		return String.valueOf(rcode);
	}
	
	
	
	public static void main(String[] args) {
		System.out.println(System.currentTimeMillis());
		System.out.println(getAppCode());
		System.out.println(getPriceCode());
	}
}

