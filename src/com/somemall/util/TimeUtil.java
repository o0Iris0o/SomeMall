package com.somemall.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component
public class TimeUtil {
	public static String FORMAT_FULL = "yyyyMMddHHmmssS";
	public static String FORMAT_FULL_ORDER = "yyyy-MM-dd";
	public String getDateString(){
		SimpleDateFormat df = new SimpleDateFormat(FORMAT_FULL);
	    Calendar calendar = Calendar.getInstance();
	    String dateString = df.format(calendar.getTime());
		return dateString;
	}
	public String getUnixTimestamp(){
		String stamp = String.valueOf(System.currentTimeMillis()/1000L);
		return stamp;
	}
	public String getDateStringFotOrder(){
		SimpleDateFormat df = new SimpleDateFormat(FORMAT_FULL_ORDER);
	    Calendar calendar = Calendar.getInstance();
	    String dateString = df.format(calendar.getTime());
		return dateString;
	}

}