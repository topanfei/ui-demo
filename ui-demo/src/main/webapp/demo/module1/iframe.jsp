<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>利用iframe布局搜索和列表的页面</title>
</head>
<body class="no-skin">
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
			<c:forEach begin="1" end="20">
				<tr>
					<td>11</td>
					<td>22</td>
					<td>33</td>
					<td>44</td>
					<td>55</td>
					<td>66</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	<div class="row">
		<div class="col-sm-12">
			<button class="btn btn-sm btn-primary" onclick="show();return false;">
				测试msg在父页面上显示
			</button>
		</div>
	</div>		
</body>
<script type="text/javascript">
	function show(){
		top.layer.msg("iframe页面有滚动条时，显示遮罩层需要用top或者parent调用layer.msg()方法，否则遮罩层没显示在屏幕中心");
	}

</script>
</html>