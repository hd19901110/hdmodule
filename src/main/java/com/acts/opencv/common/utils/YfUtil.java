package com.acts.opencv.common.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.lang3.time.DurationFormatUtils;

import com.alibaba.druid.sql.visitor.functions.Substring;

public class YfUtil {
	private static String[] NUMBER1 = { "零", "一", "二", "三", "四", "五", "六", "七", "八", "九" };
	private static String[] NUMBER2 = { "零", "十", "百", "千", "万", "亿" };
	public static final char[] charas = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * 获取当前时间
	 */
	public static String timeNow() {

		// 得到long类型当前时间
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date).toString();
	}

	public static String zhunKaoZhengHao() {
		// 得到long类型当前时间
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");

		return dateFormat.format(date).toString();

	}
	
	
	
	
	
	/**
	 * 年月
	 * yyyyMM
	 */
	public static String YearMonth() {
		// 得到long类型当前时间
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");

		return dateFormat.format(date).toString();

	}
	/**
	 *年 
	 */
	
	public static String Year() {
		// 得到long类型当前时间
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
        
		return dateFormat.format(date).toString();

	}
	
	/**
	 * 输入类型返回String
	 */
	public static String datecustom(String custom) {
		// 得到long类型当前时间
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat(custom);
        
		return dateFormat.format(date).toString();

	}
	

	/**
	 * 生成取随即数
	 * 
	 * @param Integer
	 *            num
	 * @return String
	 */

	public static String getRandomString(Integer num) {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < num; i++) {
			buffer.append(charas[random.nextInt(charas.length)]);
		}
		return buffer.toString();
	}

	/**
	 * 生成商户订单号
	 */
	public static String shddNumber() {
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return dateFormat.format(date).toString() + getRandomString(3);

	}

	/**
	 * 将阿拉伯数字转换成大写形式
	 * 
	 * @param integer
	 * @return String
	 */
	public static String getNumberStr(int num) {
		if (num < 0) {
			return "";
		}
		if (num == 0) {
			return NUMBER1[0];
		}
		if (num == 1) {
			return "首";
		}
		if (num > 10 && num < 20) {

			String result = "";
			switch (num) {
			case 11:
				result = "十一";
				break;
			case 12:
				result = "十二";
				break;
			case 13:
				result = "十三";
				break;
			case 14:
				result = "十四";
				break;
			case 15:
				result = "十五";
				break;
			case 16:
				result = "十六";
				break;
			case 17:
				result = "十七";
				break;
			case 18:
				result = "十八";
				break;
			case 19:
				result = "十九";
				break;
			default:
				break;
			}
			return result;
		}
		int split = 10000;
		int y = num / (split * split);
		int w = (num / split) % split;
		int g = num % split;
		StringBuffer sb = new StringBuffer();
		// 亿
		if (y > 0) {
			sb.append(getNumberStr1000(y));
			sb.append(NUMBER2[5]);
		}
		// 万
		if (w > 999) {
			sb.append(getNumberStr1000(w));
			sb.append(NUMBER2[4]);
		} else {
			if (w > 0) {
				if (y != 0) {
					sb.append(NUMBER2[0]);
				}
				sb.append(getNumberStr1000(w));
				sb.append(NUMBER2[4]);
			}
		}
		// 万以下
		if (g > 0) {
			if (w != 0) {
				if (g > 999) {
					sb.append(getNumberStr1000(g));
				} else {
					sb.append(NUMBER2[0]);
					sb.append(getNumberStr1000(g));
				}

			} else {
				if (y != 0) {
					sb.append(NUMBER2[0]);
				}
				sb.append(getNumberStr1000(g));
			}
		}
		return sb.toString();
	}

	/**
	 * @param num
	 * @return
	 * @Author:lulei
	 * @Description:对万以下的数字进行大小写转化
	 */
	private static String getNumberStr1000(int num) {
		if (num > 9999 || num < 0) {
			return "";
		}
		int q = num / 1000;
		int b = (num / 100) % 10;
		int s = (num / 10) % 10;
		int g = num % 10;
		StringBuffer sb = new StringBuffer();
		// 千
		if (q > 0) {
			sb.append(NUMBER1[q]);
			sb.append(NUMBER2[3]);
		}
		// 百
		if (b > 0) {
			sb.append(NUMBER1[b]);
			sb.append(NUMBER2[2]);
		} else {
			if (q != 0) {
				sb.append(NUMBER2[0]);
			}
		}
		// 十
		if (s > 0) {
			sb.append(NUMBER1[s]);
			sb.append(NUMBER2[1]);
		} else {
			if (b != 0) {
				sb.append(NUMBER2[0]);
			}
		}
		// 个
		if (g > 0) {
			sb.append(NUMBER1[g]);
		}
		return sb.toString();
	}

	/**
	 * 获取字符串中汉字的个数(不包含标点符号)
	 */

	public static Integer stringInHanZiNumber(String str) {
		Integer count = 0;

		// 注释的方法,会将汉字的标点符号算到里面
		/*
		 * char[] c = str.toCharArray(); for(int i = 0; i < c.length; i ++) {
		 * String len = Integer.toBinaryString(c[i]); if(len.length() > 8) count
		 * ++; }
		 */

		String regEx = "[\\u4e00-\\u9fa5]";
		String term = str.replaceAll(regEx, "aa");
		count = term.length() - str.length();
		return count;
	}
	
	/**
	 * 将string 转为 data格式
	 * @param args
	 */
	public static  Date stringToDate(String str,String format){
		Date date=null;
		try {
			date = new SimpleDateFormat(format).parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;	
	}
	/**
	 * 2019-03-21 - 2019-03-30
	 * 将其进行处理
	 * 2019-03-21 00:00:00
	 * 2019-03-30 23:59:59
	 * @param args
	 */
	public static String[] stringToArrayTime(String str){
		String[] array=new String[2];
		//2019-03-21 - 2019-03-30
		try {
			array[0]=str.substring(0,10);
			array[1]=str.substring(13);
			array[0]=array[0]+" 00:00:00";
			array[1] =array[1]+" 23:59:59";
			
		} catch (Exception e) {
		
		}finally {
			return array;	
		}
		
	
	}
	
	 /**
     * 判断对象是否为空，且对象的所有属性都为空
     * ps: boolean类型会有默认值false 判断结果不会为null 会影响判断结果
     *     序列化的默认值也会影响判断结果
     * @param object
     * @return
     */
    public static  boolean objCheckIsNull(Object object){
        Class clazz = (Class)object.getClass(); // 得到类对象
        Field fields[] = clazz.getDeclaredFields(); // 得到所有属性
        boolean flag = true; //定义返回结果，默认为true
        for(Field field : fields){
            field.setAccessible(true);
            Object fieldValue = null;
            try {
                fieldValue = field.get(object); //得到属性值
                Type fieldType =field.getGenericType();//得到属性类型
                String fieldName = field.getName(); // 得到属性名
                //System.out.println("属性类型："+fieldType+",属性名："+fieldName+",属性值："+fieldValue);
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            if(fieldValue != null){  //只要有一个属性值不为null 就返回false 表示对象不为null
                flag = false;
                break;
            }
        }
        return flag;
    }
    
	
    public static long pare(String time){
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		long s=0;
		try {
			s=sim.parse(time).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

    /**
     * 获取两个时间的间隔(年 月)
     * @param args
     */
public  static String TwotimeYear(Date times){
	String str = "";
	// 转换提日期输出格式
	Date date2 = new Date();
	// 转换提日期输出格式
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	String endtime= dateFormat.format(date2).toString();
	
	long timelong = times.getTime();
     String starttime = dateFormat.format( Long.valueOf(timelong));
	
	
	
	//String starttime= dateFormat.format(times).toString();
	
	 String time2= DurationFormatUtils.formatPeriod(new Date(starttime).getTime(), new Date(endtime).getTime(), "y,M");
	 Integer index = time2.indexOf(",");
	String years = time2.substring(0, index);
	String mouth = time2.substring(index + 1);
	
	str=years+"年"+mouth+"个月";

	
	return str;
	
	
}    
    
    
    
    
	
	public static void main(String[] args) {
		/*Date date2 = new Date(pare("2019-6-1 22:22:22"));
		
		System.out.println( TwotimeYear(date2));*/

		String str= YearMonth();
	String str1= str.substring(0,4);
	String str2 =str.substring(4);
	System.out.println(str1+"...."+str2);	
	}
	
	/**
	 * 
	 */
	public static String jddwjm() {
		long l = System.currentTimeMillis();
		// new日期对象
		Date date = new Date(l);
		// 转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("ddHHmmssSSS");
		return dateFormat.format(date).toString() + getRandomString(3);

	}
	
	
	
	
	
	
	
}