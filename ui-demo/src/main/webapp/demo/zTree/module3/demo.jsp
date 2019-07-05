<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>动态添加、编辑、删除节点，不可拖拽节点</title>
<base href="<%=path%>">
<link rel="stylesheet" href="<%=path %>uiplugs/customTree/css/bootstrapStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.exedit.js"></script>
<style type="text/css">
   div#rMenu {
    	position:absolute; 
    	visibility:hidden; top:0;
    	background-color: #555;
    	text-align: left;
    	padding: 2px;
    	z-index: 9999999999999999;
    }
    div#rMenu a{
        cursor: pointer;
        list-style: none outside none;
    }
    .list-group-item{
    	position: relative;
    	display: block;
    	padding: 2px 15px;
    	margin-bottom: -1px;
    	background-color: #fff;
    	border: 1px solid #ddd;
    }
    
    
    /* div#rMenu {position:absolute; visibility:hidden; top:0; text-align: left;padding:4px;}
    div#rMenu a{
        padding: 3px 15px 3px 15px;
        background-color:#cad4e6;
        vertical-align:middle;
    } */
</style>

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
									<h4 class="widget-title lighter smaller">节点右击显示操作菜单</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<ul id="treeDemo" class="ztree"></ul>
									</div>
									<!-- 菜单弹出层 -->
									<div id="rMenu">
									    <a href="#" class="list-group-item" onclick="add();return false;">新增</a>
									    <a href="#" class="list-group-item" onclick="alert('删除');return false;">删除</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-primary" onclick="getData();return false;">获取所有节点数据</button>
						</div>
					</div>	
					<div class="space-8"></div>
					<!-- 展示所有节点的数据 -->
					<div class="row">
						<div class="col-sm-12">
							<div id="nodeData">
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>				
	
	<script type="text/javascript">
		var setting = {
			view: {
				selectedMulti: false//设置是否允许同时选择多个节点
			},
			data: {
				simpleData: {
					enable: true//简单的树形数据模型
				}
			},
			callback:{
			    onClick:onClick//用于捕获节点被点击的事件回调函数
			    ,onRightClick: onRightClick //用于捕获 zTree 上鼠标右键点击之后的事件回调函数
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
		});
	
		
		/**获取所所有节点信息*/
		function getData(){
		    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		    var parentNodes = zTree.getNodes();//获取树形的所有父节点信息
		    var nodes = zTree.transformToArray(parentNodes);//获取所有节点的信息（包括子节点）
		    if("length="+nodes.length);
		    var nodeData = new Array();
		    for(var i = 0 ;i<nodes.length;i++){
				var node = nodes[i];
				console.log("节点信息->id："+node.id+";pId："+node.pId+";name："+node.name+";level："+node.level);
		   		nodeData.push("节点信息->id："+node.id+";pId："+node.pId+";name："+node.name+";level："+node.level);
		    }
		    
		    $("#nodeData").html(nodeData.join("<br>"));
		}
		
		/**
			捕获节点被点击的事件回调函数（用于点击节点时，展开和折叠节点）
			参数：
			（1）event：js的事件对象
			（2）treeId：树id
			（3）treeNode：被点击的节点JSON对象
		
		*/
		function onClick(event,treeId,treeNode){
		    var zTree = $.fn.zTree.getZTreeObj(treeId);
		    zTree.expandNode(treeNode);
		}
		
		
		/**用于捕获 zTree 上鼠标右键点击之后的事件回调函数
		   参数：
		   （1）event：js的事件对象
		   （2）treeId：树id
		  （3）treeNode：被点击的节点JSON对象
		*/
		function onRightClick(eventjs,treeId,treeNode){
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			 if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
				 zTree.cancelSelectedNode();
				// showRMenu("root", event.clientX, event.clientY);
		    } else if (treeNode && !treeNode.noR) {//树上的节点
		    	zTree.selectNode(treeNode);
		    	showRMenu("node", event.clientX, event.clientY);
		    }
		}
		
		//显示右键菜单
		function showRMenu(type, x, y) {
		    $("#rMenu ul").show();
		    $("#rMenu").css({"top":y+"px", "left":x+"px", "visibility":"visible"}); //设置右键菜单的位置、可见
		    $("body").bind("mousedown", onBodyMouseDown);
		}
		
		//隐藏右键菜单
		function hideRMenu() {
		    if (rMenu) $("#rMenu").css({"visibility": "hidden"}); //设置右键菜单不可见
		    $("body").unbind("mousedown", onBodyMouseDown);
		}
		
		//鼠标按下事件
		function onBodyMouseDown(event){
		    if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
		    	$("#rMenu").css({"visibility" : "hidden"});
		    }
		}
		
		function add(){
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = zTree.getSelectedNodes();
			for(var i=0;i<nodes.length;i++){
				var node = nodes[i];
				alert("节点信息->id："+node.id+";pId："+node.pId+";name："+node.name+";level："+node.level);
			}
			hideRMenu();
		}
	</script>
	
</body>
</html>