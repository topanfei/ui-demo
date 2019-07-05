<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/meta.jsp" %>    
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
				<th>字段1</th>
				<th>字段2</th>
				<th>字段3</th>
				<th>字段4</th>
				<th>字段5</th>
				<th>字段6</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>11</td>
				<td>22</td>
				<td>33</td>
				<td>44</td>
				<td>55</td>
				<td>66</td>
			</tr>
			<tr>
				<td>11</td>
				<td>22</td>
				<td>33</td>
				<td>44</td>
				<td>55</td>
				<td>66</td>
			</tr>
			<tr>
				<td>11</td>
				<td>22</td>
				<td>33</td>
				<td>44</td>
				<td>55</td>
				<td>66</td>
			</tr>
			<tr>
				<td>11</td>
				<td>22</td>
				<td>33</td>
				<td>44</td>
				<td>55</td>
				<td>66</td>
			</tr>
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
			每页条数：<select name="pageSize">
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
	
	</script>		
</body>
</html>