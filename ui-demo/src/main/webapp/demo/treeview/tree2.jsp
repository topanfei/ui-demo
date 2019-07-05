<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>树形结构</title>
<base href="<%=path%>">
<link href="<%=path %>uiplugs/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-8">
							<div class="widget-box widget-color-blue2">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">树形结构（利用ligerui插件）</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<ul id="tree1"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 回到顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	
	<!-- 重新引用一下该js，不然回到顶部图标不会随着是否有滚动条而自动显示或隐藏 -->
	<script src="<%=path %>uiplugs/ace-admin-1.4/assets/js/ace.min.js"></script>
	<script src="<%=path %>uiplugs/ligerUI/js/ligerui.min.js" type="text/javascript"></script> 
	<script type="text/javascript">
		$(function(){
		    var indexdata = [
				{ id: 1, pid: 0, text: '菜单1' },
				{ id: 2, pid: 1, text: '菜单1-1' },
				{ id: 3, pid: 0, text: '菜单2' },
				{ id: 4, pid: 3, text: '菜单2-1' },
				{ id: 5, pid: 4, text: '菜单2-1-1' },
				{ id: 6, pid: 5, text: '菜单2-1-1-1' },
				{ id: 7, pid: 0, text: '菜单3' }
		    ];
		    $("#tree1").ligerTree({
				data : indexdata,
				idFieldName :'id',
				parentIDFieldName :'pid',
				isExpand: false,
				checkbox:false,
				slide: false,
				//nodeWidth: 300,
				iconFieldName:"icon"
			}); 
		});
	
		
	</script>
	
</body>
</html>