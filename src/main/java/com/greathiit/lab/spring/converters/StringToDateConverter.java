package com.greathiit.lab.spring.converters;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.core.convert.converter.Converter;

//必须实现converters接口
public class StringToDateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String str) {
		// TODO Auto-generated method stub
		Pattern pattern1 = Pattern.compile("\\d{4}[-]\\d{2}[-]\\d{2}");
		Pattern pattern2 = Pattern.compile("\\d{2}[:]\\d{2}[:]\\d{2}");
		Pattern pattern3 = Pattern.compile("\\d{4}[-]\\d{2}[-]\\d{2}[\\s]\\d{2}[:]\\d{2}[:]\\d{2}");
		Matcher matcher1 =pattern1.matcher(str);
		Matcher matcher2 =pattern2.matcher(str);
		Matcher matcher3 =pattern3.matcher(str);
		if(matcher1.matches()){
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-HH-dd");
			try {
				return sdf.parse(str);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(matcher2.matches()){
			SimpleDateFormat sdf= new SimpleDateFormat("HH:mm:ss");
			try {
				return sdf.parse(str);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if(matcher3.matches()){
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-HH-dd HH:mm:ss");
			try {
				return sdf.parse(str);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		/*	int len=str.length();
		SimpleDateFormat sdf=null;
		switch (len) {
		case 10:
			sdf= new SimpleDateFormat("yyyy-HH-dd");
			break;
		case 8:
			sdf= new SimpleDateFormat("HH:mm:ss");
			break;
		case 19:
			sdf= new SimpleDateFormat("yyyy-HH-dd HH:mm:ss");
			break;
		default:
			break;
		}
		try {
			return sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return null;
	}

}
