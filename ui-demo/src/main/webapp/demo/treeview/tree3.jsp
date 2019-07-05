<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>树形结构</title>
<base href="<%=path%>">
<link rel="stylesheet" href="<%=path %>uiplugs/customTree/css/bootstrapStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.core.js"></script>
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">自定义树形结构</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<ul id="treeDemo" class="ztree"></ul>
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
	<script src="<%=path %>uiplugs/ace-admin-1.4.0/assets/js/ace.min.js"></script>
	<SCRIPT type="text/javascript">
      
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		callback:{
		    onClick: getNodeInfo
		}
		    
	};

	var zNodes =[
		{ id:1, pId:0, name:"菜单1"},
		{ id:2, pId:1, name:"菜单1-1"},
		{ id:3, pId:1, name:"菜单1-2"},
		{ id:4, pId:2, name:"菜单1-1-1"},
		{ id:5, pId:2, name:"菜单1-1-2"},
		{ id:6, pId:0, name:"菜单2"},
		{ id:7, pId:0, name:"菜单2"},
		{ id:8, pId:0, name:"菜单2"},
		{ id:9, pId:0, name:"菜单2"},
		{ id:10, pId:0, name:"菜单2"},
		{ id:11, pId:0, name:"菜单2"},
		{ id:12, pId:0, name:"菜单2"},
		{ id:13, pId:0, name:"菜单2"},
		{ id:14, pId:0, name:"菜单2"},
		{ id:15, pId:0, name:"菜单2"},
		{ id:16, pId:0, name:"菜单2"},
		{ id:17, pId:0, name:"菜单2"},
		{ id:18, pId:0, name:"菜单2"},
		{ id:19, pId:0, name:"菜单2"}
	];
	

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	
	function getNodeInfo(event,treeId,treeNode){
	    console.log(treeNode);
	    var nodeId = treeNode.id;
	    var nodePId = treeNode.pId;
	    var nodeName = treeNode.name;
	    var nodeLevel = treeNode.level;
	    console.log("被点击节点nodeId=="+nodeId);
	    console.log("被点击节点nodePId=="+nodePId);
	    console.log("被点击节点nodeName=="+nodeName);
	    console.log("被点击节点nodeLevel=="+nodeLevel);
	    
	}
    </SCRIPT>
</body>
</html>