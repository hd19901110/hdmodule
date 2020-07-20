<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/module/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <sys:header title="首页" extLibs=""></sys:header>
    <script type="text/javascript">
		$(function(){
			$("#form1").ajaxForm(function(data){  
				alert("提交成功！");   
		});  
		});
		
		
	</script>
	
	<script src="${ctxStatic}/js/jquery.form.js" type="text/javascript"></script>
	
</head>
<body>
<div class="header">
   <div>
    <h3>word,Excel,img,txt转PDF</h3>
    <p>(1)将Office文件转为PDF是开发中常见的一种功能<br>
    jacod.jar
    </p>
    <p>jacod在linux和unix系统上是无法使用,而且要实现转PDF系统必须装Office套件.且默认打开方式必须是Office的套件</p> 
  <div>
  <p>先进性文件上传,在文件上传到服务器后,将文件转换为PDF</p>
    <div>
    <div>
        <input type="file" accept=".xls,.xlsx,.doc,.docx,.jpg,.png,.txt,.pptx" id="crowd_file">
         <button class="ajaxtj" type='submit'>上传</button>
    </div>
    
   </div>
  
  
  
  </div>
  
   
   </div>



</div>
			
</body>
<script type="text/javascript">
$('.ajaxtj').click(function () {
    var crowd_file = $('#crowd_file')[0].files[0];

    var formData = new FormData();

    formData.append("file",crowd_file);

    $.ajax({
        url:ctxPath+'/files/officeToPdf',
        dataType:'text',
        type:'POST',
        async: false,
        data: formData,
        processData : false, // 使数据不做处理
        contentType : false, // 不要设置Content-Type请求头
        success: function(data){
            console.log(data);
                alert('上传成功！');
        },
        error:function(response){
            console.log(response);
        }
    });

})
</script>



</html>
