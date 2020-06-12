package com.acts.opencv.common.utils.jeesit;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;




public class ExcelUtil {
	public String filePath = "e:\\专业设置信息表.xls";

	public void newWordBook() {
		HSSFWorkbook wb = new HSSFWorkbook();
		try {
			FileOutputStream fileOut = new FileOutputStream(filePath);
			wb.write(fileOut);
			fileOut.close();
		} catch (FileNotFoundException ex) {
			System.out.println(ex.getMessage());
		} catch (IOException ex) {
			System.out.println(ex.getMessage());
		}
	}

	/**
	 * 创建空白文件
	 */
	public void newSheet() {
		HSSFWorkbook wb = new HSSFWorkbook();
		wb.createSheet("第一页");
		wb.createSheet("第二页");
		try {
			FileOutputStream fileOut = new FileOutputStream(filePath);
			wb.write(fileOut);
			fileOut.close();
		} catch (FileNotFoundException ex) {
			System.out.println(ex.getMessage());
		} catch (IOException ex) {
			System.out.println(ex.getMessage());
		}
	}

	private void saveWorkBook(HSSFWorkbook wb,String file) {
		try {
			FileOutputStream fileOut = new FileOutputStream(file);
			wb.write(fileOut);
			fileOut.close();
		} catch (FileNotFoundException ex) {
			System.out.println(ex.getMessage());
		} catch (IOException ex) {
			System.out.println(ex.getMessage());
		}
	}

	private HSSFWorkbook getWorkBook(String filePath) {
		try {
			FileInputStream fileIn = new FileInputStream(filePath);
			HSSFWorkbook wb = new HSSFWorkbook(fileIn);
			fileIn.close();
			return wb;
		} catch (IOException ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@SuppressWarnings("deprecation")
	private HSSFCell getCell(HSSFSheet sheet, int rowIndex, short columnIndex) {
		HSSFRow row = sheet.getRow(rowIndex);
		if (row == null) {
			row = sheet.createRow(rowIndex);
		}
		HSSFCell cell = row.getCell(columnIndex);
		if (cell == null) {
			cell = row.createCell((short) columnIndex);
		}
		return cell;
	}
	
	public void copyFile(String oldPath, String newPath) { 
		try { 
		int byteread = 0; 
		File oldfile = new File(oldPath); 
		if (oldfile.exists()) { //文件存在时 
		InputStream inStream = new FileInputStream(oldPath); //读入原文件 
		FileOutputStream fs = new FileOutputStream(newPath); 
		byte[] buffer = new byte[1444]; 
		while ( (byteread = inStream.read(buffer)) != -1) { 
		fs.write(buffer, 0, byteread); 
		} 
		inStream.close(); 
		fs.close();
		} 
		} 
		catch (Exception e) { 
		System.out.println("复制单个文件操作出错"); 
		e.printStackTrace(); 

		} 

		} 


	// 下载web应用下的文件
	public void upload(HttpServletRequest request, HttpServletResponse response,String filePath) {
			try {
				File outfile = new File(filePath);
				String filename = outfile.getName();// 获取文件名称
				InputStream fis = new BufferedInputStream(new FileInputStream(
						filePath));
				byte[] buffer = new byte[fis.available()];
				fis.read(buffer); // 读取文件流
				fis.close();
				response.reset(); // 重置结果集
				response.addHeader("Content-Disposition", "attachment;filename="
						+ new String(
								filename.replaceAll(" ", "").getBytes("utf-8"),
								"iso8859-1")); // 返回头 文件名
				response.addHeader("Content-Length", "" + outfile.length()); // 返回头
																				// 文件大小
				response.setContentType("application/octet-stream"); // 设置数据种类
				// 获取返回体输出权
				OutputStream os = new BufferedOutputStream(
						response.getOutputStream());
				os.write(buffer); // 输出文件
				os.flush();
				os.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	public static void main(String[] args) {
		ExcelUtil excel = new ExcelUtil();
		//excel.writeData(excel.filePath);
	}
	

}
