package com.acts.opencv.base.filemodule;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acts.opencv.base.entity.User;
import com.acts.opencv.base.service.UserService;
import com.acts.opencv.common.utils.YfUtil;
import com.acts.opencv.common.utils.jeesit.ExcelUtil;

@Controller
@RequestMapping(value = "files")
public class fileController {
	
	HttpServletRequest request;
	@Autowired
	UserService userService;
	
	    private POIFSFileSystem fs;
		private HSSFWorkbook wb;
		private HSSFSheet sheet;
		private HSSFRow row;
	 
	 
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
	 * 对数据库进行测试
	 */
    @RequestMapping("/dataTest")
	@ResponseBody
    public String dataTest() {
		  User user = new User(); 
		  user.setName("张小明");
		  user.setSex("男");
		  user.setAge("18");
		  user.setStature("65");
		  user.setWeight("175");
		  User num= userService.saveAndFlush(user);
		 
    	
    	
    	return num.toString()+"成功";
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
	public String excelExport(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
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
								this.sheet = this.wb.getSheetAt(0);
								this.row = this.sheet.getRow(i);
								List<String> list = new ArrayList<String>(); 
								
								String one = getCellFormatValue(this.row.getCell(0)).trim();
								if ((one != null) && (!"".equals(one))) {
									list.add(one);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第1列不能为空";
									continue;
								}	
								
								String two = getCellFormatValue(this.row.getCell(1)).trim();
								if ((two != null) && (!"".equals(two))) {
									list.add(two);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第2列不能为空";
									continue;
								}
								
								String three = getCellFormatValue(this.row.getCell(2)).trim();
								if ((three != null) && (!"".equals(three))) {
									list.add(three);
								} else {
									errorMsg = errorMsg + "第" + (i + 1) + "行，第3列不能为空";
									continue;
								}
								System.out.println("第" + (i + 1) + "行数据:" + list.toString());
								successNum++;
							}
							
							//执行失败数量
							failureNum = rowNum - successNum - 1;
						    if(!"".equals(errorMsg)) {
						    	return "成功条数："+successNum+"/条！失败条数："+failureNum+"/条！"+errorMsg;
						    }else {
						    	
						        return "成功条数："+successNum+"/条！";
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
