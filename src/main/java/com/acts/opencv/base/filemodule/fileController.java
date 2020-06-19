package com.acts.opencv.base.filemodule;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.acts.opencv.common.utils.YfUtil;
import com.acts.opencv.common.utils.jeesit.ExcelUtil;
import com.acts.opencv.entity.User;
import com.acts.opencv.service.UserService;

@Controller
@RequestMapping(value = "files")
public class fileController {
	@Autowired
	HttpServletRequest request;	
	    private POIFSFileSystem fs;
		private HSSFWorkbook wb;
		private HSSFSheet sheet;
		private HSSFRow row;
	@Autowired 
	private UserService userService; 
    /**
     * @return  返回相对路径RelativePath
     */
    public String RelPath() {
        String path = request.getContextPath();
        return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    }

    /**
     * @return  返回服务器目录的真实路径
     */
    public String RealPath() {
        return request.getSession().getServletContext().getRealPath("/");
    }
	
    /**
     * 测试成功了,但是也没有多大的意义
     */
    @RequestMapping("/tests")
	@ResponseBody
    public String tesssss() {
    	User user = new User();
    	user.setAge("12");
    	user.setName("章程");
    	user.setSex("男");
    	user.setStature("65");
    	user.setWeight("175");
    	int num=userService.save(user);
    	return num+".........121212121212";
    }
    
    
    
   
	/**
	 * 
	 * @throws UnsupportedEncodingException 
	 * @annotation 文件上传
	 */
	@RequestMapping("/fileupload")
	@ResponseBody
	public String fileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws UnsupportedEncodingException {
	    //判断文件是否为空
		if(!file.isEmpty()) {
			//文件名称
			String fileName = file.getOriginalFilename();
			File dir = new File(RealPath()+"upload/"+YfUtil.YearMonth()+"/"); //1新建一个文件夹对象
	        if(!dir.exists()) {   //2.检查路径下upload文件夹是否存在,不存在创建路径
	        	dir.mkdirs();
	        }
	        String filePath = RealPath() + "upload/" + YfUtil.YearMonth() + "/" + fileName;
			//限定上传格式
	        // String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
			//if(!suffix.equals("xls")){		
			//	return "仅限上传xls格式文件";
			//}
	        try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	        System.out.println(filePath); 
	        
		}else {
			return "上传文件不能为空";
		}
		    
    return "文件上传成功";
	}
	
	/**
	 * 文件在WEB-INF下的文件下载
	 */
	@RequestMapping(value = "filedowload", method = RequestMethod.GET)
	@ResponseBody
	public String getMODEL(HttpServletRequest request,HttpServletResponse response) {
		try {
			ExcelUtil excel = new ExcelUtil();
			String oldPath = request.getSession().getServletContext()
					.getRealPath("/template/A4.png"); // 文件在项目中的老路径
			System.out.println(oldPath);
			excel.upload(request, response, oldPath);	
		} catch (Exception e) {
			return "文件下载失败！失败信息：" + e.getMessage();
		}
		return "下载成功";
	}
	
	/**
	 * excel文件导入
	 */
	
	@RequestMapping(value = "excelimport", method = RequestMethod.POST)
	@ResponseBody
	public String excelimport(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		   //判断文件是否为空
				if(!file.isEmpty()) {
					//文件名称
					String fileName = file.getOriginalFilename();
					File dir = new File(RealPath()+"upload/"+YfUtil.YearMonth()+"/"); //1新建一个文件夹对象
			        if(!dir.exists()) {   //2.检查路径下upload文件夹是否存在,不存在创建路径
			        	dir.mkdirs();
			        }
			        String filePath = RealPath() + "upload/" + YfUtil.YearMonth() + "/" + fileName;
					//限定上传格式
			        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					if(!suffix.equals("xls")){		
						return "仅限上传xls格式文件";
					}
			        try {
						file.transferTo(new File(filePath));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
			        
			        //读取Excel表格内容
			        InputStream is = null;
			        
			        try {
						is = new FileInputStream(filePath);
						
						try {
							fs = new POIFSFileSystem(is);
							wb = new HSSFWorkbook(fs);
							this.sheet = this.wb.getSheetAt(0);
							int rowNum = this.sheet.getLastRowNum();
							int successNum = 0;
							int failureNum = 0;
							String errorMsg = "";
							//正文内容应该从第2行开始。
							for(int i = 1; i<= rowNum;i++) {
								User user = new User();
								this.sheet = this.wb.getSheetAt(0);
								this.row = this.sheet.getRow(i);
								String name = getCellFormatValue(this.row.getCell(0)).trim();
								if ((name != null) && (!"".equals(name))) {
									user.setName(name);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第1列不能为空";
									continue;
								}	
								
								String sex = getCellFormatValue(this.row.getCell(1)).trim();
								if ((sex != null) && (!"".equals(sex))) {
									user.setSex(sex);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第2列不能为空";
									continue;
								}
								
								String age = getCellFormatValue(this.row.getCell(2)).trim();
								if ((age != null) && (!"".equals(age))) {
									user.setAge(age);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行第3列不能为空;";
									continue;
								}
								String stature = getCellFormatValue(this.row.getCell(3)).trim();
								if ((stature != null) && (!"".equals(stature))) {
									user.setStature(stature);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第4列不能为空";
									continue;
								}
								String weight = getCellFormatValue(this.row.getCell(4)).trim();
								if ((weight != null) && (!"".equals(weight))) {
									user.setWeight(weight);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第5列不能为空";
									continue;
								}
								
								userService.save(user);			
								//System.out.println("第" + (i + 1) + "行数据:" + list.toString());
								successNum++;
							}
							
							//执行失败数量
							failureNum = rowNum - successNum - 1;
						    if(!"".equals(errorMsg)) {
						    	return "成功条数："+successNum+"/条！失败条数："+failureNum+"/条！"+errorMsg;
						    }else {
						    	
						        return "导入成功;成功条数："+successNum+"/条！";
						    }	
							
						} catch (IOException e) {

							e.printStackTrace();
						}

					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
 
				}else {
					return "上传文件不能为空";
				}
		return "文件导入异常";
	}
	
	/**
	 * 文件导出(哈哈哈)
	 */
	@RequestMapping("fileExport")
	public void getExcel(String xn, String xq, String zc, String nj, HttpServletRequest request, HttpServletResponse response) {
		//https://blog.csdn.net/jinchunzhao123/article/details/82744582
		
		
		if(xn.equals("")||xn==null){
			xn="2020";
		}
		if(xq.equals("")||xq==null){
			xq="一";
		}
		if(zc.equals("")||zc==null){
			zc="1";
		}
		if(nj.equals("")||nj==null){
			nj="2020";
		}
		//里面的数据
		List<User> userList =new ArrayList<User>();
	
		
		/* 开始制表 */
		HSSFWorkbook wb = new HSSFWorkbook();
		
		/* 定义样式 */
		HSSFCellStyle style1 = wb.createCellStyle();
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		Font font1 = wb.createFont();
        font1.setColor((short) 12);
        font1.setFontHeightInPoints((short) 20);
        font1.setFontName("宋体");
        style1.setFont(font1);
        HSSFCellStyle style2 = wb.createCellStyle();
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        Font font2 = wb.createFont();
        font2.setFontHeightInPoints((short) 11);
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        style2.setFont(font2);
        HSSFCellStyle style3 = wb.createCellStyle();
        style3.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style3.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        Font font3 = wb.createFont();
        font3.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        style3.setFont(font3);
        HSSFCellStyle styleCon = wb.createCellStyle();
        styleCon.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        styleCon.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);        
		//workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("第" + zc + "周教学日志周管理");
		//在sheet中添加表头第0行,,注意老版本poi对Excel的行数列数有限制
        // 第一行
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell_0 = row.createCell(0);
		cell_0.setCellValue("第" + zc + "周教学日志周管理");
		//定义表格样式
		cell_0.setCellStyle(style1);
		// 第二行
		HSSFRow row1 = sheet.createRow(1);
		HSSFCell cell_21 = row1.createCell(0);
		cell_21.setCellValue("学年");
		cell_21.setCellStyle(style2);
		HSSFCell cell_22 = row1.createCell(1);
		cell_22.setCellValue(xn);
		cell_22.setCellStyle(style2);
		HSSFCell cell_23 = row1.createCell(3);
		cell_23.setCellValue("学期");
		cell_23.setCellStyle(style2);
		HSSFCell cell_24 = row1.createCell(4);
		cell_24.setCellValue(xq);
		cell_24.setCellStyle(style2);
		HSSFCell cell_25 = row1.createCell(6);
		cell_25.setCellValue("周次");
		cell_25.setCellStyle(style2);
		HSSFCell cell_26 = row1.createCell(7);
		cell_26.setCellValue(zc);
		cell_26.setCellStyle(style2);
		HSSFCell cell_27 = row1.createCell(8);
		cell_27.setCellValue("年级");
		cell_27.setCellStyle(style2);
		HSSFCell cell_28 = row1.createCell(9);
		cell_28.setCellValue(nj);
		cell_28.setCellStyle(style2);
//		HSSFCell cell_29 = row1.createCell(11);
//		cell_29.setCellValue("班级名称");
//		cell_29.setCellStyle(style2);
//		HSSFCell cell_210 = row1.createCell(12);
//		cell_210.setCellValue(bjmc);
//		cell_210.setCellStyle(style2);
		// 第三行
		HSSFRow row3 = sheet.createRow(2);
		HSSFCell cell_31 = row3.createCell(0);
		cell_31.setCellValue("序号");
		cell_31.setCellStyle(style3);
		HSSFCell cell_32 = row3.createCell(1);
		cell_32.setCellValue("工号");
		cell_32.setCellStyle(style3);
		HSSFCell cell_33 = row3.createCell(2);
		cell_33.setCellValue("教师姓名");
		cell_33.setCellStyle(style3);
		HSSFCell cell_333 = row3.createCell(3);
		cell_333.setCellValue("班级名称");
		cell_333.setCellStyle(style3);
		sheet.setColumnWidth(3, 3500);
		HSSFCell cell_34 = row3.createCell(4);
		cell_34.setCellValue("周代课节数");
		cell_34.setCellStyle(style3);
		sheet.setColumnWidth(4, 3000);
		HSSFCell cell_35 = row3.createCell(5);
		cell_35.setCellValue("教师上课出勤情况");
		cell_35.setCellStyle(style3);
		HSSFCell cell_36 = row3.createCell(11);
		cell_36.setCellValue("学生上课出勤情况");
		cell_36.setCellStyle(style3);
		// 第四行
		HSSFRow row4 = sheet.createRow(3);
		HSSFCell cell_46 = row4.createCell(5);
		cell_46.setCellValue("实到");
		cell_46.setCellStyle(style3);
		HSSFCell cell_47 = row4.createCell(6);
		cell_47.setCellValue("病假");
		cell_47.setCellStyle(style3);
		HSSFCell cell_48 = row4.createCell(7);
		cell_48.setCellValue("迟到");
		cell_48.setCellStyle(style3);
		HSSFCell cell_49 = row4.createCell(8);
		cell_49.setCellValue("旷课");
		cell_49.setCellStyle(style3);
		HSSFCell cell_410 = row4.createCell(9);
		cell_410.setCellValue("事假");
		cell_410.setCellStyle(style3);
		HSSFCell cell_411 = row4.createCell(10);
		cell_411.setCellValue("公假");
		cell_411.setCellStyle(style3);
		HSSFCell cell_412 = row4.createCell(11);
		cell_412.setCellValue("实有人数");
		cell_412.setCellStyle(style3);
		HSSFCell cell_413 = row4.createCell(12);
		cell_413.setCellValue("实到人数");
		cell_413.setCellStyle(style3);
		HSSFCell cell_414 = row4.createCell(13);
		cell_414.setCellValue("迟到人数");
		cell_414.setCellStyle(style3);
		HSSFCell cell_415 = row4.createCell(14);
		cell_415.setCellValue("缺课人数");
		cell_415.setCellStyle(style3);
		
		/* 合并 */
        CellRangeAddress region0 = new CellRangeAddress(0, 0, 0, 14);
        sheet.addMergedRegion(region0);
        CellRangeAddress region11 = new CellRangeAddress(1, 1, 1, 2);
        sheet.addMergedRegion(region11);
        CellRangeAddress region12 = new CellRangeAddress(1, 1, 4, 5);
        sheet.addMergedRegion(region12);
        CellRangeAddress region14 = new CellRangeAddress(1, 1, 9, 10);
        sheet.addMergedRegion(region14);
        CellRangeAddress region30 = new CellRangeAddress(2, 3, 0, 0);
        sheet.addMergedRegion(region30);
        CellRangeAddress region31 = new CellRangeAddress(2, 3, 1, 1);
        sheet.addMergedRegion(region31);
        CellRangeAddress region32 = new CellRangeAddress(2, 3, 2, 2);
        sheet.addMergedRegion(region32);
        CellRangeAddress region33 = new CellRangeAddress(2, 3, 3, 3);
        sheet.addMergedRegion(region33);
        CellRangeAddress region34 = new CellRangeAddress(2, 3, 4, 4);
        sheet.addMergedRegion(region34);
        CellRangeAddress region35 = new CellRangeAddress(2, 2, 5, 10);
        sheet.addMergedRegion(region35);
        CellRangeAddress region36 = new CellRangeAddress(2, 2, 11, 14);
        sheet.addMergedRegion(region36);
		
        /* 内容 */
        for (int i = 0; i < userList.size(); i++) {
			// 从第四行开始 + i
    		HSSFRow rowChange = sheet.createRow(4 + i);
    		HSSFCell cellChange0 = rowChange.createCell(0);
    		cellChange0.setCellValue(i + 1);
    		cellChange0.setCellStyle(styleCon);
    		HSSFCell cellChange1 = rowChange.createCell(1);
    		cellChange1.setCellValue(userList.get(i).getName());
    		cellChange1.setCellStyle(styleCon);
    		HSSFCell cellChange2 = rowChange.createCell(2);
    		cellChange2.setCellValue(userList.get(i).getSex());
    		cellChange2.setCellStyle(styleCon);
    		HSSFCell cellChange3 = rowChange.createCell(3);
    		cellChange3.setCellValue(userList.get(i).getAge());
    		cellChange3.setCellStyle(styleCon);
    		HSSFCell cellChange4 = rowChange.createCell(4);
    		cellChange4.setCellStyle(styleCon);
    		HSSFCell cellChange5 = rowChange.createCell(5);
    		cellChange5.setCellStyle(styleCon);
    		HSSFCell cellChange6 = rowChange.createCell(6);
    		cellChange6.setCellStyle(styleCon);
    		HSSFCell cellChange7 = rowChange.createCell(7);
    		cellChange7.setCellStyle(styleCon);
    		HSSFCell cellChange8 = rowChange.createCell(8);
    		cellChange8.setCellStyle(styleCon);
    		HSSFCell cellChange9 = rowChange.createCell(9);
    		cellChange9.setCellStyle(styleCon);
    		HSSFCell cellChange10 = rowChange.createCell(10);
    		cellChange10.setCellStyle(styleCon);
    		HSSFCell cellChange11 = rowChange.createCell(11);
    		cellChange11.setCellValue(String.valueOf(userList.get(i).getStature()));
    		cellChange11.setCellStyle(styleCon);
    		HSSFCell cellChange12 = rowChange.createCell(12);
    		cellChange12.setCellStyle(styleCon);
    		HSSFCell cellChange13 = rowChange.createCell(13);
    		cellChange13.setCellStyle(styleCon);
    		HSSFCell cellChange14 = rowChange.createCell(14);
    		cellChange14.setCellStyle(styleCon);
		}
		// 文件保存路径
        String filePath = request.getSession().getServletContext().getRealPath("/template/第"+ zc +"周教学日志周管理.xls"); 
        try {
			FileOutputStream fos = new FileOutputStream(filePath);
			wb.write(fos);
		    fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    // 下载
	    try {
			File outfile = new File(filePath);
			String filename = outfile.getName();
			InputStream fis = new BufferedInputStream(new FileInputStream(filePath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			response.reset();
			response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.replaceAll(" ", "").getBytes("utf-8"), "iso8859-1"));
			response.addHeader("Content-Length", "" + outfile.length());
			response.setContentType("application/octet-stream");
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			os.write(buffer);
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	/**
	 * 根据HSSFCell类型设置数据
	 * 
	 * @param cell
	 * @return
	 */
	private String getCellFormatValue(HSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式
					// 方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();
					// 方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					cellvalue = sdf.format(date);
				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case HSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
				// 默认的Cell值
			default:
				cellvalue = "";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}	
	
	
	
	
	
}
