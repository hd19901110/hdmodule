<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">

	</script>
</head>
<body>
<div class="header">
   <div>
    <h3>文件导入</h3>
    <p>Excel文件导入是非常常见的一种功能.在实际生活中用处的有很多地方都需要用到
    </p>
  <p>(1.1)使用input</p>
  <div>
    <a href="${pageContext.request.contextPath}/template/testimport.xls" download=""  
   title="导入模板下载" >导入模板下载</a> 
      <input type="file" id="import1" accept=".xls,.xlsx"/>
  </div>
     </div>



</div>
			
</body>
<script type="text/javascript">
$("#import1").change(function(){
	var loading = null;
	var formData = new FormData();
	formData.append('file',$("#import1")[0].files[0]);
	$.ajax({
		url: ctxPath+'/files/excelimport',
		 dataType:'text',
		type: 'post',
		async: false,
		data: formData,
		// 告诉jQuery不要去处理发送的数据
		processData: false,
		contentType : false, 
		success: function(data){
			console.log(data)
		   alert(data)
			$("#import1").val('');
		}
	})
	
	
	
})




</script>



</html>
