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
							<div class="text-center">
								<button class="btn btn-sm btn-primary" onclick="goSubmit();return false;">
									<i class="fa fa-check marginr5"></i>&nbsp;提交
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
		    $.webUtil.msg("测试信息");
		}
	
	</script>
</body>
</html>