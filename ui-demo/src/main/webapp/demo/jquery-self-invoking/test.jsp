<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="<%=path%>">
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-sm-12">
							<form class="form-horizontal" action="" method="post" name="form">
								<label class="col-sm-2 control-label no-padding-right">文件上传</label>
								<div class="col-sm-5">
									<button type="button" class="layui-btn" id="fileUpload" name="upload">
										<i class="layui-icon"></i>上传文件
									</button>
								</div>
							</form>
						
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<div class="text-center">
								<button class="btn btn-sm btn-primary" onclick="goSubmit();return false;">
									<i class="fa fa-check marginr5"></i>&nbsp;提交
								</button>
								<button class="btn btn-sm btn-primary">
									<i class="fa fa-refresh marginr5"></i>&nbsp;重置
								</button>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>		
	</div>
	
	<script type="text/javascript">
		function goSubmit(){
		    var opts = {
			    url:'FormSerlvet'
			    ,submitCheck: submitCheckFunc
		    
		    }
		    $.util.submit(opts);
		}	
		
		function submitCheckFunc(){
		    return true;
		}
		
		
		(function($){
		    $.util = {
			    closeWindow: function(index){//关闭弹窗
				    layer.close(index);
				},
				uploadFile: function(url,opts){
				    var defaults = {
						elem: '' //容器选择器，也可以是DOM对象
						,accept: 'file' //images：图片；file：所有文件；video：视频；audio：音频
						,size: 4096//最大支持4M。设置最大可允许的大小，单位为kb
						,multiple: false //是否允许多文件上传，默认不允许多文件上传
						,url: url //服务端上传接口
						,before: null //文件提交上传前的回调
						,done: null //执行上传请求成功的回调函数
						,error: null //执行上传请求异常的回调函数
				    };
				    
				    opts = $.extend(defaults,opts);
				    layui.use(['upload'],function(){
						var upload = layui.upload;
						var uploadInst = upload.render(opts);
				    });
				}
		    };
		})(jQuery);
	</script>
	
</body>
</html>