<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">
		$(function(){
		});
		
		
	</script>
	
</head>
<body>
<div class="header">
   <div>
    <h3>文件的下载</h3>
    <p>文件下载是我们工作生活中经常会碰到的.下面是几种文件下载的方法
    </p>
  <p>(1.1)js实现点击下载文件</p>
  <div>
      <input type="button" id="dow1" value="下载"/>
  </div>
  
  <div>
  <p>(1.2)使用a标签下载</p>
    <div>
       <a href="${pageContext.request.contextPath}/template/Python清屏.txt" download=""  
   title="下载" >下载</a> 
    </div>
  </div>
  
   
   <div>
   <p>(1.3)使用表单提交下载文件</p>
   
   <input type="button" id="dow2" value="下载"/>
   
   </div>
   
     </div>



</div>
			
</body>
<script type="text/javascript">
$("#dow1").click(function(){
	var link = document.createElement('a');
	link.setAttribute("download", "");
	link.href = ctxPath+"/template/A4.png";
	link.click();
})

$("#dow2").click(function(){
	 var $form = $('<form method="GET"></form>');
	    $form.attr('action', ctxPath+'/files/filedowload');
	    $form.appendTo($('body'));
	    $form.submit();
})





</script>



</html>
