<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>表格合并单元格</title>
<base href="<%=path%>">
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<h4 class="header smaller lighter blue">表格单元格合并</h4>
							<table id="table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>序号</th>
										<th>类型</th>
										<th>名称</th>
										<th>价格</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>书籍</td>
										<td>三国演义</td>
										<td>80</td>
									</tr>
									<tr>
										<td>2</td>
										<td>书籍</td>
										<td>射雕英雄传</td>
										<td>60</td>
									</tr>
									<tr>
										<td>3</td>
										<td>书籍</td>
										<td>骆驼祥子</td>
										<td>50</td>
									</tr>
									<tr>
										<td>4</td>
										<td>电子产品</td>
										<td>airpods</td>
										<td>1300</td>
									</tr>
									<tr>
										<td>5</td>
										<td>电子产品</td>
										<td>iphone xr</td>
										<td>6300</td>
									</tr>
								</tbody>
							</table>	
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<script type="text/javascript">
		$(function(){
			//合并指标信息table的第一列的单元格
			!function($){
				$.fn.rowspan=function(options){
					var defaults = {}  
					var options = $.extend(defaults, options);  
					this.each(function () {  
					    //:nth-child(n) 选择器匹配属于其父元素的第 N 个子元素，不论元素的类型
						var tds=$(this).find("tbody td:nth-child("+options.td+")");  
						var current_td=tds.eq(0);  
						var k=1;  
						tds.each(function(index, element) {
							if($(this).text()==current_td.text()&&index!=0){
								k++;  
								$(this).remove();  
								current_td.attr("rowspan",k);  
								current_td.css("vertical-align","middle");  
							}else{  
								current_td=$(this);  
								k=1;  
							}  
						});  
				  
					})  
				}  
			}( window.jQuery );  
				
			$("#table").rowspan({td:2}); 
		});
		
		
	</script>				
</body>
</html>