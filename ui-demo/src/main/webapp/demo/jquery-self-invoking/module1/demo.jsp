<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery闭包的使用</title>
<base href="<%=path%>">
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<h4 class="header smaller lighter blue">jQuery闭包的使用</h4>
					<div class="row">
						<div class="col-xs-12">
							<div class="well well-lg">
								<h4 class="blue">闭包的概念：</h4>
								<ul>
									<li>闭包就是js的自调函数，该案例中有一个无参数的闭包方式 和 一个有参数的闭包方式。</li>
									<li>有参数的闭包案例中，jQuery就是传入的实参，而 $ 就是形参</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="space-8"></div>
					<div class="row">
						<div class="col-sm-12">
							<form action="" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-1 control-label no-padding-right" for="name">名称：</label>
									<div class="col-sm-3">
										<input type="text" id="name" class="form-control" value="张三">
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<div id="info">
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
	
	<script type="text/javascript">
		/**无参数的闭包使用*/
		(function(){
		    console.log("无参的闭包使用");
		    $("#info").append("无参的闭包使用<br>");
		})();
	
		/**有参数的闭包使用*/
		(function($){
			console.log("有参的闭包使用");   
			$("#info").append("有参的闭包使用<br>");
		})(jQuery);	
	</script>			
</body>
</html>