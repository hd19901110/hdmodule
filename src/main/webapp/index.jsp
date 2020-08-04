<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>OPENCV - 学习</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="statics/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="statics/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="statics/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="statics/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="statics/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="statics/css/common.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<a href="javascript:void(0);" class="logo"> 
				<span class="logo-mini">
					<b>OCL</b>
				</span> 
				<span class="logo-lg">
					<b>OpenCV</b>_Learn
				</span>
			</a>
			<nav class="navbar navbar-static-top" role="navigation">
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
			        <span class="sr-only">Toggle navigation</span>
		      	</a>
				<div style="float: left; color: #fff; padding: 15px 10px;">欢迎ADMIN</div>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp"><i class="fa fa-home"></i> &nbsp;首页</a></li>
						<li><a href="javascript:;"><i class="fa fa-lock"></i> &nbsp;修改密码</a></li>
						<li><a href="javascript:;"><i class="fa fa-sign-out"></i> &nbsp;退出系统</a></li>
					</ul>
				</div>
			</nav>
		</header>
  
  		<!-- Left side column. contains the logo and sidebar -->
  		<!-- 导航菜单 -->
 <div style="overflow-y: auto">
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree" >
					<li class="header">导航菜单</li>
					<!-- Optionally, you can add icons to the links -->
					
					<li class="treeview">
			          <a href="#index" class="menu1">
			            <i class="fa fa-question-circle"></i><span>初识OpenCV</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/index/introduce.jsp"><i class="fa fa-circle-o"></i>OpenCV介绍</a></li>
			            <li><a href="#view/index/setting.jsp"><i class="fa fa-circle-o"></i>JAVA集成OpenCV</a></li>
			          </ul>
			        </li>		
					<li class="treeview">
			          <a href="#demo" class="menu1">
			            <i class="fa fa-calendar-o"></i> <span>简单DEMO</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/demo/helloword.jsp"><i class="fa fa-circle-o"></i>Hello Word</a></li>
			            <li><a href="#view/demo/mat.jsp"><i class="fa fa-circle-o"></i>Mat对象</a></li>
			          </ul>
			        </li>
			        
					<li class="treeview">
			          <a href="#base" class="menu1">
			            <i class="fa fa-list"></i> <span>基础功能</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/base/binary.jsp"><i class="fa fa-circle-o"></i>二值化</a></li>
			            <li><a href="#view/base/adaptiveBinary.jsp"><i class="fa fa-circle-o"></i>自适用二值化</a></li>
			            <li><a href="#view/base/zxing.jsp"><i class="fa fa-circle-o"></i>zxing识别二维码</a></li>
			            <li><a href="#view/base/gaussian.jsp"><i class="fa fa-circle-o"></i> 模糊</a></li>
			            <li><a href="#view/base/sharpness.jsp"><i class="fa fa-circle-o"></i> 图像锐化</a></li>
			            <li><a href="#view/base/floodfill.jsp"><i class="fa fa-circle-o"></i> 漫水填充</a></li>
			            <li><a href="#view/base/resize.jsp"><i class="fa fa-circle-o"></i> 缩放</a></li>
			            <li><a href="#view/base/erosion_dilation.jsp"><i class="fa fa-circle-o"></i>腐蚀膨胀</a></li>
			            <li><a href="#view/base/morphologyEx.jsp"><i class="fa fa-circle-o"></i>腐蚀膨胀进阶</a></li>
			            <li><a href="#view/base/canny.jsp"><i class="fa fa-circle-o"></i>边缘检测</a></li>
			            <li><a href="#view/base/houghline.jsp"><i class="fa fa-circle-o"></i>检测直线</a></li>
			            <li><a href="#view/base/houghcircle.jsp"><i class="fa fa-circle-o"></i>检测圆</a></li>
			            <li><a href="#view/base/findcolor.jsp"><i class="fa fa-circle-o"></i>检测颜色</a></li>
			            <li><a href="#view/base/contours.jsp"><i class="fa fa-circle-o"></i>轮廓</a></li>
			            <li><a href="#view/base/findtemplate.jsp"><i class="fa fa-circle-o"></i>模板查找</a></li>
			            <li><a href="#view/base/grayHistogram.jsp"><i class="fa fa-circle-o"></i>灰度直方图</a></li>
			            <li><a href="#view/base/fourPointTransform.jsp"><i class="fa fa-circle-o"></i>4点转换矫正</a></li>
			          </ul>
			        </li>
			        
					<li class="treeview">
			          <a href="#card" class="menu1">
			            <i class="fa fa-picture-o"></i><span>答题卡demo</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/card/recognition.jsp"><i class="fa fa-circle-o"></i>检测填涂</a></li>
			            <li><a href="#view/card/cardPlus.jsp"><i class="fa fa-circle-o"></i>答题卡识别</a></li>
			            <li><a href="#view/card/pagecheck.jsp"><i class="fa fa-circle-o"></i>页码识别</a></li>
			           <!--  <li><a href="#view/card/marktest.jsp"><i class="fa fa-circle-o"></i>定位点优化</a></li> -->
			            <li><a href="#view/card/rectification.jsp"><i class="fa fa-circle-o"></i>图像矫正</a></li>
			            <li><a href="#view/card/realTest.jsp"><i class="fa fa-circle-o"></i>校正真实测试</a></li>
			            <li><a href="#view/card/card2.jsp"><i class="fa fa-circle-o"></i>无定位点答题卡识别</a></li>
			          </ul>
			        </li>
			        
			        <!--导入 导出-->
			        <li class="treeview">
			          <a href="#base" class="menu1">
			            <i class="fa fa-list"></i> <span>文件模块</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/filemodule/fileupload.jsp"><i class="fa fa-circle-o"></i>文件上传</a></li>
			            <li><a href="#view/filemodule/filedownload.jsp"><i class="fa fa-circle-o"></i>文件下载</a></li>
			            <li><a href="#view/filemodule/fileimport.jsp"><i class="fa fa-circle-o"></i>导入excel</a></li>
			            <li><a href="#view/filemodule/fileExport.jsp"><i class="fa fa-circle-o"></i>导出excel</a></li>
			            <li><a href="#view/filemodule/wordExcelImgTxtToPdf.jsp"><i class="fa fa-circle-o"></i>office转pdf</a></li>
			          </ul>
			        </li>
			        <!-- 线程模块 -->
			        <li class="treeview">
			          <a href="#base" class="menu1">
			            <i class="fa fa-list"></i> <span>线程模块</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/thread/javaThreadOne.jsp"><i class="fa fa-circle-o"></i>java多线程入门</a></li>
			            <li><a href="#view/thread/javaThreadTwo.jsp"><i class="fa fa-circle-o"></i>synchronized关键字(1)</a></li>
			            <li><a href="#view/thread/javaThreadThree.jsp"><i class="fa fa-circle-o"></i>synchronized关键字(2)</a></li>
			            <li><a href="#view/thread/javaThreadFour.jsp"><i class="fa fa-circle-o"></i>volatile关键字</a></li>
			            <li><a href="#view/thread/javaThreadFive.jsp"><i class="fa fa-circle-o"></i>等待/通知(wait/notify)机制</a></li>
			            <li><a href="#view/thread/javaThreadSix.jsp"><i class="fa fa-circle-o"></i>Thread之管道输入/输出流</a></li>
			            <li><a href="#view/thread/javaThreadSeven.jsp"><i class="fa fa-circle-o"></i>Lock锁的使用</a></li>
			            <li><a href="#view/thread/javaThreadEight.jsp"><i class="fa fa-circle-o"></i>并发编程中的一些问题</a></li>
			          </ul>
			        </li>
			         <!-- java基础 -->
			          <li class="treeview">
			          <a href="#base" class="menu1">
			            <i class="fa fa-list"></i> <span>java基础</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
			          </a>
			          <ul class="treeview-menu">
			            <li><a href="#view/javaInterviewQuestion/java20200729start.jsp"><i class="fa fa-circle-o"></i>java的一些易混淆点</a></li>
			            <li><a href="#view/thread/javaThreadTwo.jsp"><i class="fa fa-circle-o"></i>synchronized关键字(1)</a></li>
			          </ul>
			        </li>
			         
			         
					
					<li>
						<a href="#view/index/todo.jsp"><i class="fa fa-hand-peace-o"></i><span>持续更新中</span></a>
					</li>
			        
			        
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
</div>
		<!-- 路径导航 -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		    <section class="content-header">
		      <h1 id = "currentpage">介绍</h1>
		      <ol class="breadcrumb">
		        <li><a href="index.jsp"><i class="fa fa-dashboard"></i>首页</a></li>
		        <li id = "pagehead2">首页</li>
		        <li class="active"  id = "pagehead3">介绍</li>
		      </ol>
		    </section>
			<section class="content">
				<iframe scrolling="yes" frameborder="0"
					style="width: 100%; min-height: 200px; overflow: visible; background: #fff;"
					src="main.jsp" id="mainFrame" name="mainFrame"></iframe>
			</section>		
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
	  <footer class="main-footer">
	    <div class="pull-right hidden-xs">
	      <b>Version</b> 1.0.0
	    </div>
	    <strong>Copyright &copy; 2017 <a href="#">ACTS Songer</a>.</strong> All rights reserved.
	  </footer>
</div>
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="statics/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="statics/js/bootstrap.min.js"></script>
<script src="statics/plugins/layer/layer.js"></script>
<!-- AdminLTE App -->
<script src="statics/js/adminlte.min.js"></script>
<script src="statics/js/index.js?t=${version}"></script>
<script src="statics/js/common.js"></script>
<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>