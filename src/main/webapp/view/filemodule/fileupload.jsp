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
    <h3>文件的上传</h3>
    <p>(1)在实现文件上传和下载之前我们需要做一些准备工作,在maven下载文件上传下载的两个组件.<br>
    commons-fileupload.jar和  commons-io.jar
    </p>
    <p>(2)需要在配置文件中添加文件上传配置(限制上传文件最大为10M,可以自定义)</p>
    <p>
      &lt;bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"&gt;<br>  
		&lt;property name="maxUploadSize" value="10485760" /&gt; <br>
	 &lt;/bean&gt;
    </p>
  <p>(3.1)下面使用的form表单做提交</p>
  <div>
      <form id="from1" action='${pageContext.request.contextPath}/files/fileupload' method='post' enctype='multipart/form-data'>
	     <input type='file' name='file'>
	     <button type='submit'>上传</button>
      </form>
   
  </div>
  
  <div>
  <p>(3.2)使用ajax做提交</p>
  
  
    <div>
    <div>
        <input type="file" accept=".xlsx" id="crowd_file">
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
        url:ctxPath+'/files/fileupload',
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
