package com.acts.opencv.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
/*import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;*/
/**
 * 所有方法都测试过了能用
 * @author yf
 * @date 2020年17月1日  16:05:35
 *
 */
public class OfficeToPdfTools {

	private static final int wdFormatPDF = 17;
	private static final int xlsFormatPDF = 0;
	private static final int pptFormatPDF = 32;
	private static final int msoTrue = -1;
	private static final int msofalse = 0;
	private static final String FONT = "C:\\font\\simhei.ttf";
/**
 * 如果txt转PDf出现问题,可以将txt文件,和doc文件共用一个方法
 * txt文件但单独方法转成PDF后,会去除原txt文件中的空行,而doc的方法不会.
 * @param inputFile
 * @param pdfFile
 * @return
 */
	public static boolean convert2PDF(String inputFile, String pdfFile) {
		String suffix = getFileSufix(inputFile);
		File file = new File(inputFile);
		if (!file.exists()) {
			System.out.println("文件不存在！");
			return false;
		}
		if (suffix.equals("pdf")) {
			//这里自己处理下
			System.out.println("PDF not need to convert!");
			return false;
			
		}
		if (suffix.equals("doc") || suffix.equals("docx")) {
			return word2PDF(inputFile, pdfFile);
		} else if (suffix.equals("ppt") || suffix.equals("pptx")) {
			return ppt2pdf(inputFile, pdfFile);
		}else if (suffix.equals("xls") || suffix.equals("xlsx")) {
			return excel2Pdf(inputFile, pdfFile);
		} else if (suffix.equals("jpg") || suffix.equals("png") || suffix.equals("jpeg")) {
			return img2PDF(inputFile, pdfFile);
		} else if (suffix.equals("txt")) {
			return txt2PDF(inputFile, pdfFile);
		} else {
			System.out.println("文件格式不支持转换!");
			return false;
		}
	}

	private static String getFileSufix(String fileName) {
		int splitIndex = fileName.lastIndexOf(".");
		return fileName.substring(splitIndex + 1);
	}

	private static boolean word2PDF(String inputFile, String pdfFile) {
		try {
			//ComThread.InitSTA();使用这个就可以关闭,但是这个适用单线程,多线程的话可能会出问题的.
			ComThread.InitSTA(true);
			
			ActiveXComponent app = new ActiveXComponent("Word.Application");
			app.setProperty("Visible", false);
			Dispatch docs = app.getProperty("Documents").toDispatch();
			Dispatch doc = Dispatch.call(docs, "Open", inputFile, false, true).toDispatch();
			File tofile = new File(pdfFile);
			if (tofile.exists()) {
				tofile.delete();
			}
			Dispatch.call(doc, "ExportAsFixedFormat", pdfFile, wdFormatPDF);
			Dispatch.call(doc, "Close", false);
			app.invoke("Quit", 0);
			//ComThread.Release(); 
			/*app.invoke("Quit");*/
			System.out.println("word转换PDF文件成功");
			return true;
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("word转换PDF文件失败");
			return false;
		}finally{
			ComThread.Release();
		}

	}
   /**
    * 这个Excel转PDF方法已经过时了.
    * @param inputFile
    * @param pdfFile
    * @return
    */
	@SuppressWarnings("unused")
	private static boolean excel2PDFOut(String inputFile, String pdfFile) {
		try {
			ComThread.InitSTA(true);
			ActiveXComponent app = new ActiveXComponent("Excel.Application");
			app.setProperty("Visible", false);
			Dispatch excels = app.getProperty("Workbooks").toDispatch();
			Dispatch excel = Dispatch.call(excels, "Open", inputFile, false, true).toDispatch();
			File tofile = new File(pdfFile);
			if (tofile.exists()) {
				tofile.delete();
			}
			Dispatch.call(excel, "ExportAsFixedFormat", xlsFormatPDF, pdfFile);
			Dispatch.call(excel, "Close", false);
			//ComThread.Release(); 
			app.invoke("Quit", 0);
			System.out.println("excel转换PDF文件成功");
			return true;
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("excel转换PDF文件失败");
			return false;
		}finally {
			ComThread.Release(); 
		}

	}

	private static boolean ppt2PDF(String inputFile, String pdfFile) {
		try {
			ComThread.InitSTA(true);
			ActiveXComponent app = new ActiveXComponent("PowerPoint.Application");
			Dispatch ppts = app.getProperty("Presentations").toDispatch();
			Dispatch ppt = Dispatch.call(ppts, "Open", inputFile, true, // ReadOnly
					true, // Untitled指定文件是否有标题
					false// WithWindow指定文件是否可见
			).toDispatch();
			File tofile = new File(pdfFile);
			if (tofile.exists()) {
				tofile.delete();
			}
			Dispatch.call(ppt, "SaveAs", pdfFile, pptFormatPDF);
			Dispatch.call(ppt, "Close");
			ComThread.Release();
			app.invoke("Quit", 0);
			/*,new Variant[]{}*/
			System.out.println("ppt转换PDF文件成功");
			return true;
		} catch (Exception e) {
			System.out.println("ppt转换PDF文件失败"+e);
			ComThread.Release();
			return false;
		}
	}

	public static boolean img2PDF(String inputFile, String pdfFile) {
		ComThread.InitSTA(true);
		Document document = new Document();
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(pdfFile);
			PdfWriter.getInstance(document, fos);
			// 设置文档的大小
			document.setPageSize(PageSize.A4);
			// 打开文档
			document.open();
			// 写入一段文字
			// document.add(new Paragraph("JUST TEST ..."));
			// 读取一个图片
			Image image = Image.getInstance(inputFile);
			float imageHeight = image.getScaledHeight();
			float imageWidth = image.getScaledWidth();
			int i = 0;
			while (imageHeight > 500 || imageWidth > 500) {
				image.scalePercent(100 - i);
				i++;
				imageHeight = image.getScaledHeight();
				imageWidth = image.getScaledWidth();
			}

			image.setAlignment(Image.ALIGN_CENTER);
			// //设置图片的绝对位置
			// image.setAbsolutePosition(0, 0);
			// image.scaleAbsolute(500, 400);
			// 插入一个图片
			document.add(image);
			document.close();
			fos.flush();
			fos.close();
			System.out.println("图片转换PDF文件成功");
			return true;
		} catch (Exception e) {
			System.out.println("图片转换PDF文件失败");
			return false;
		}finally {
			ComThread.Release();	
		}
		
		
	}

	public static boolean txt2PDF(String inputFile, String pdfFile) {
		Document document=null;
		try {
		    document = new Document();
	        OutputStream os = new FileOutputStream(new File(pdfFile));
	        PdfWriter.getInstance(document, os);
	        document.open();
	        //方法一：使用Windows系统字体(TrueType)
	        BaseFont baseFont = BaseFont.createFont(FONT, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
	        Font font = new Font(baseFont);
	        InputStreamReader isr = new InputStreamReader(new FileInputStream(new File(inputFile)), "GBK");
	        BufferedReader bufferedReader = new BufferedReader(isr);
	       String str = "";
	        while ((str = bufferedReader.readLine()) != null) {
	            document.add(new Paragraph(str, font));
	        }
	        bufferedReader.close();
	        document.close();
		} catch (Exception e) {
			System.out.println("txt转换PDF文件失败");
			return false;
		}
		System.out.println("txt转换PDF文件成功");
		return true;
	}

	/**
	 * 下面是新加的方法
	 */
	
	private static final Integer WORD_TO_PDF_OPERAND = 17;
    private static final Integer PPT_TO_PDF_OPERAND = 32;
    private static final Integer EXCEL_TO_PDF_OPERAND = 0;

	/**
	 * 测试效果比较好,但是当excel 的行过长时,便会将多出来的放到下一页
	 * 所以,excel转PDF最好的是限定行的长度.
	 * @param inFilePath
	 * @param outFilePath
	 * @return
	 */
	private static boolean excel2Pdf(String inFilePath, String outFilePath) {
	        ActiveXComponent ax = null;
	        Dispatch excel = null;
	        try {
	            ComThread.InitSTA();
	            ax = new ActiveXComponent("Excel.Application");
	            ax.setProperty("Visible", new Variant(false));
	            ax.setProperty("AutomationSecurity", new Variant(3)); // 禁用宏
	      
	            Dispatch excels = ax.getProperty("Workbooks").toDispatch();

	            Object[] obj = new Object[]{ 
	                    inFilePath, 
	                    new Variant(false),
	                    new Variant(false) 
	             };
	            excel = Dispatch.invoke(excels, "Open", Dispatch.Method, obj, new int[9]).toDispatch();
	            //将excel表格 设置成A3的大小
	            Dispatch sheets = Dispatch.call(excel, "Worksheets").toDispatch();  
	            Dispatch sheet = Dispatch.call(sheets, "Item", new Integer(1)).toDispatch();  
	            Dispatch pageSetup = Dispatch.call(sheet, "PageSetup").toDispatch();
	            Dispatch.put(pageSetup, "PaperSize", new Integer(8));//A3是8，A4是9，A5是11等等
	            
	            // 转换格式
	            Object[] obj2 = new Object[]{ 
	                    new Variant(0), // PDF格式=0
	                    outFilePath, 
	                    new Variant(EXCEL_TO_PDF_OPERAND)  //0=标准 (生成的PDF图片不会变模糊) ; 1=最小文件
	            };
	            Dispatch.invoke(excel, "ExportAsFixedFormat", Dispatch.Method,obj2, new int[1]);

	        } catch (Exception es) {
	            es.printStackTrace();
	            return false;
	        } finally {
	            if (excel != null) {
	                Dispatch.call(excel, "Close", new Variant(false));
	            }
	            if (ax != null) {
	                ax.invoke("Quit", new Variant[] {});
	                ax = null;
	            }
	            ComThread.Release();
	        }
	        return true;

	    }
    private void doc2pdf(String srcFilePath, String pdfFilePath) throws Exception {  
        ActiveXComponent app = null;  
        Dispatch doc = null;  
        try {  
            ComThread.InitSTA();  
            app = new ActiveXComponent("Word.Application");  
            app.setProperty("Visible", false);  
            Dispatch docs = app.getProperty("Documents").toDispatch(); 
            Object[] obj = new Object[]{
                    srcFilePath, 
                    new Variant(false),  
                    new Variant(false),//是否只读  
                    new Variant(false),   
                    new Variant("pwd")
            };
            doc = Dispatch.invoke(docs, "Open", Dispatch.Method, obj, new int[1]).toDispatch();  
//          Dispatch.put(doc, "Compatibility", false);  //兼容性检查,为特定值false不正确  
            Dispatch.put(doc, "RemovePersonalInformation", false);  
            Dispatch.call(doc, "ExportAsFixedFormat", pdfFilePath, WORD_TO_PDF_OPERAND); // word保存为pdf格式宏，值为17  
  
        }catch (Exception e) {  
            e.printStackTrace();
            throw e;
        } finally {  
            if (doc != null) {  
                Dispatch.call(doc, "Close", false);  
            }  
            if (app != null) {  
                app.invoke("Quit", 0);  
            }  
            ComThread.Release();  
        }  
    }  
    
    private static boolean ppt2pdf(String srcFilePath, String pdfFilePath){
    	ActiveXComponent app = null;
        Dispatch ppt = null;
        try {
            ComThread.InitSTA();
            app = new ActiveXComponent("PowerPoint.Application");
            Dispatch ppts = app.getProperty("Presentations").toDispatch();

            /*
             * call 
             * param 4: ReadOnly
             * param 5: Untitled指定文件是否有标题
             * param 6: WithWindow指定文件是否可见
             * */
            ppt = Dispatch.call(ppts, "Open", srcFilePath, true,true, false).toDispatch();
            Dispatch.call(ppt, "SaveAs", pdfFilePath, PPT_TO_PDF_OPERAND); // ppSaveAsPDF为特定值32

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ppt != null) {
                Dispatch.call(ppt, "Close");
            }
            if (app != null) {
                app.invoke("Quit");
            }
            ComThread.Release();
        }
        
        return true;
    }

	
	public static void main(String[] args) {
		try {
			//url解码方式
			String s = URLDecoder.decode("a/s/%E5%8F%B6%E5%9C%A3%E9%99%B6%E9%A1%B5%E9%9D%A2%E6%93%8D%E4%BD%9C%E6%89%8B%E5%86%8C(1).doc","UTF-8");
		System.out.println(s);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*try {
			OfficeToPdfTools.excel2Pdf("D:\\aa1\\单词测试文件.xls", "D:\\aa1\\单词测试文件.pdf");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		 //OfficeToPdfTools.convert2PDF("D:\\aa1\\123321.pptx", "D:\\aa1\\123321.pdf");
		 //OfficeToPdfTools.convert2PDF("D:\\aa1\\单词测试文件2.xls", "D:\\aa1\\单词测试文件.pdf");
		// OfficeToPdfTools.convert2PDF("D:\\aa1\\临时任务.docx", "D:\\aa1\\临时任务.pdf");
       // OfficeToPdfTools.convert2PDF("D:\\aa1\\0.jpg", "D:\\aa1\\0.pdf");
	
	    //OfficeToPdfTools.convert2PDF("D:\\aa1\\黄丹的单词1.txt", "D:\\aa1\\黄丹的单词.pdf");
	
	}
}