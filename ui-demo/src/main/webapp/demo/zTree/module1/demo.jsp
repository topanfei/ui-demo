<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<base href="<%=path%>">
<link rel="stylesheet" href="uiplugs/customTree/css/bootstrapStyle.css" type="text/css">
<script type="text/javascript" src="uiplugs/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="uiplugs/zTree_v3/js/jquery.ztree.exhide.js"></script>
<script type="text/javascript" src="uiplugs/zTree_v3/demo/js/fuzzysearch.js"></script>
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-sm-12">
							<form action="" class="form-horizontal">
								<div class="widget-box">
									<div class="widget-header">
										<h4 class="widget-title lighter smaller"><i class="fa fa-search">&nbsp;查询条件</i></h4>
										<div class="widget-toolbar">
											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>
										</div>
									</div>
									<div class="widget-body">
										<div class="widget-main padding-8">
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label class="col-sm-1 control-label no-padding-right">节点名称：</label>
														<div class="col-sm-3">
															<input type="text" id="search" class="form-control">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">搜索</h4>
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
	</div>
	
	<script type="text/javascript">
		var setting = {
			/* check: {
				enable: true//checkbox
			},
			view: {
				nameIsHTML: true, //允许name支持html				
				selectedMulti: false
			}, */
			edit:{
			    enable:false
			    ,editNameSelectAll:false
			},
			data:{
			    simpleData:{
					enable:true
			    }
			},
			callback:{
			    onClick: expandTargetNode
			}
		};
		
		var zNodes =[
			{ id:1, pId:0, name:"1-1", open:true},
			{ id:11, pId:1, name:"1-1-1"},
			{ id:12, pId:1, name:"1-1-2"},
			{ id:13, pId:1, name:"1-1-3"},
			{ id:2, pId:0, name:"2-1", open:false},
			{ id:21, pId:2, name:"2-1-1"},
			{ id:22, pId:2, name:"2-1-2"},
			{ id:23, pId:2, name:"2-1-3"},
			{ id:3, pId:0, name:"3-1", open:false },
			{ id:31, pId:3, name:"3-1-1"},
			{ id:32, pId:3, name:"3-1-2"},
			{ id:33, pId:3, name:"3-1-3"}
		];
		
		$(document).ready(function(){
		   $.fn.zTree.init($("#treeDemo"),setting,zNodes);
		   //初始化模糊搜索方法 
		   fuzzySearch('treeDemo','#search',null,false);
		   expandTargetNode(0);
		});
		
		/**
			展开点击的节点信息：默认展开所有节点
		*/
		function expandTargetNode(){
		    var zTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
		    zTreeObj.expandNode();
		}
		
		/**展开指定层级的节点*/
		function expandTargetNode(nodeLevel){
		    var zTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
		    var zTreeParentNodes = zTreeObj.getNodes();//获取所有父节点信息
		    var nodes = zTreeObj.transformToArray(zTreeParentNodes);//获取所有节点信息（包括父节点和子节点）
		    for(var i=0;i<nodes.length;i++){
				var node = nodes[i];
				var level = node.level;
				if(Number(level) <= Number(nodeLevel)){
				    zTreeObj.expandNode(node,true,false,false);
				}
		    }
		    
		}
	</script>
</body>
</html>