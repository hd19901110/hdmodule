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
    <p>将数据库中的数据导出成Excel文件,是非常常见的一种功能.在实际生活中用处的有很多地方都需要用到
    </p>
  <p>(1.1)使用input</p>
  <div>
    <input type="button" value="导出" id="but">
  </div>
     </div>



</div>
			
</body>
<script type="text/javascript">
$("#but").click(function(){
      window.location.href=ctxPath+"/files/fileExport"
	
})




</script>



</html>
