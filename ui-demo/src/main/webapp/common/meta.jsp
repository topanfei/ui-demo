<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<meta name="description" content="with selectable elements and custom icons" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<base href="<%=path%>">
	<!-- basic css -->
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
	<!-- text fonts -->
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/fonts.googleapis.com.css" />
	<!-- ace styles -->
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
	<!--[if lte IE 9]>
		<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
	<![endif]-->
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/ace-skins.min.css" />
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/ace-rtl.min.css" />
	<!--[if lte IE 9]>
		<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/ace-ie.min.css" />
	<![endif]-->
	
	<!-- basic js -->
	<!-- ace settings handler -->
	<script src="uiplugs/ace-admin-1.4.0/assets/js/ace-extra.min.js"></script>
	<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
	<!--[if lte IE 8]>
		<script src="uiplugs/ace-admin-1.4.0/assets/js/html5shiv.min.js"></script>
		<script src="uiplugs/ace-admin-1.4.0/assets/js/respond.min.js"></script>
	<![endif]-->
	
	<!-- 如下原demo都是在每个页面后面显示， ace.min.js必须写在每个页面的后面。不然回到顶部这个控件效果不会随着有无滚动条而显示-->
	<!-- basic scripts -->
	<!--[if !IE]> -->
		<script src="uiplugs/ace-admin-1.4.0/assets/js/jquery-2.1.4.min.js"></script>
	<!-- <![endif]-->
	<!--[if IE]>
		<script src="uiplugs/ace-admin-1.4.0/assets/js/jquery-1.11.3.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='uiplugs/ace-admin-1.4.0/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	<script src="uiplugs/ace-admin-1.4.0/assets/js/bootstrap.min.js"></script>
	
	
	<!-- page plugin -->
	<!-- 日期组件 -->
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/bootstrap-datepicker3.min.css">
	<script src="uiplugs/ace-admin-1.4.0/assets/js/bootstrap-datepicker.min.js"></script>
	<script src="uiplugs/ace-admin-1.4.0/assets/js/moment.min.js"></script>
	<script type="text/javascript" src="uiplugs/ace-admin-1.4.0/locales/bootstrap-datepicker.zh-CN.js"></script>
	<!-- 搜索下拉 -->
	<link rel="stylesheet" href="uiplugs/ace-admin-1.4.0/assets/css/bootstrap-multiselect.min.css">
	<script type="text/javascript" src="uiplugs/ace-admin-1.4.0/assets/js/bootstrap-multiselect.min.js"></script>
	
	
	<!-- ace scripts -->
	<script src="uiplugs/ace-admin-1.4.0/assets/js/ace-elements.min.js"></script>
	<script src="uiplugs/ace-admin-1.4.0/assets/js/ace.min.js"></script>
	
	<!-- layui插件 -->
	<link rel="stylesheet" href="uiplugs/layui/css/layui.css" type="text/css">
	<script type="text/javascript" src="uiplugs/layui/layui.js"></script>
	
	<!-- 自定义的js和css文件 -->
	<link rel="stylesheet" href="uiplugs/custom/css/custom.css" type="text/css">
	<script type="text/javascript" src="uiplugs/custom/js/custom.js"></script>
</head>
</html>