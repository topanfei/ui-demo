<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: white;
	}
	html{
		overflow-y:hidden; 
	}
</style>
</head>
<body class="no-skin" onload="setIframeHeight();return false;">
	<table id="table" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>id</th>
				<th>名称</th>
				<th>密码</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList }">
				<tr>
					<td>${user.userId }</td>
					<td>${user.userName }</td>
					<td>${user.userPasswd }</td>
					<td>${user.isState }</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>	
	
	<!-- 分页 -->
	<ul class="pager">
		<li class="disabled"><a href="#">首页</a></li>
		<li class="active"><a href="#">上一页</a></li>
		<li><a href="#">下一页</a></li>
		<li><a href="#">尾页</a></li>
		<li>转到&emsp;<input type="text" size="2" maxlength="4" onkeyup="value=value.replace(/[^\d]/g,'')">&emsp;页</li>
		<li><a href="#">跳转</a></li>
		<li>
			每页条数：<select name="pageSize" onchange="changePageSize(this.value);return false;">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
		</li>
	</ul>
	
	<script type="text/javascript">
		function setIframeHeight(){
		    //var height = $("#table",$(document.body)).height();
		    var height = $(document.body).height();
		    console.log("height="+height);
			var dataListFrame = $("#dataListFrame",window.parent.document);
			height = Number(height)+47;//设置iframe高度
			$(dataListFrame).height(height);
		}
	
		
		/**改编每页显示条数*/
		function changePageSize(pageSize){
			var dataListForm = $("#dataListForm",window.parent.document);
			$("input[name='pageSize']",dataListForm).val(pageSize);
			$(dataListForm).iframeSubmit();
		}
		
	</script>		
</body>
</html>