<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<h3 class="header smaller lighter blue">文件上传</h3>
					<div class="row">
						<div class="col-sm-12">
							<button type="button" class="layui-btn" id="fileUpload">
								<i class="layui-icon"></i>单文件上传
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	layui.use(['upload'],function(){
		var upload = layui.upload;
		var uploadInst = upload.render({
			elem: '#fileUpload' //容器选择器，也可以是DOM对象
			,accept: 'file' //images：图片；file：所有文件；video：视频；audio：音频
			,exts: '' //允许上传的文件后缀，如 jpg|png|gif
			,size: 4096//最大支持4M。设置最大可允许的大小，单位为kb
			,multiple: false //是否允许多文件上传，默认不允许多文件上传
			,number: 0 //设置同时上传的数量，一般配合multiple参数出现
			,url: 'file/singleUpload' //服务端上传接口
			,data: null //传递的参数
			,before: function(){ //文件提交上传前的回调函数
				console.log("文件上传前...");
			} 
			,done: function(json){ //执行上传请求成功的回调函数
				$.webUtil.alert(JSON.stringify(json));
			} 
			,error: function(){ //执行上传请求异常的回调函数
				console.log("文件上传异常...");
			}
		});
	}); 
</script>

</html>