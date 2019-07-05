<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="<%=path%>">
<link rel="stylesheet" href="<%=path %>uiplugs/customTree/css/bootstrapStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path %>uiplugs/zTree_v3/js/jquery.ztree.exedit.js"></script>
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
									<h4 class="widget-title lighter smaller">拖拽菜单，可新增编辑删除操作</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<ul id="treeDemo" class="ztree"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
							<button class="btn btn-primary" onclick="getData();return false;">获取数据</button>
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
	
	<SCRIPT type="text/javascript">
        var setting = {
            view: {
                addHoverDom: addHoverDom,//鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同ztree内部的编辑、删除按钮
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            data: {
                simpleData: {//使用简单数据模型（就是id和pid这种关系）
                    enable: true,
                    idKey: "id",
					pIdKey: "pId",
					rootPId: 0
                }
            },
            edit: {
                enable: true//设置 zTree 是否处于编辑状态
            },
            callback:{
        		beforeDrag:beforeDrag,
        		beforeDrop:beforeDrop,
        		onDrop: onDrop
            }
        };

        var zNodes =[
            {id:1, pId:0, name:"1-1", open:true},
			{id:101, pId:1, name:"1-1-1"},
			{id:102, pId:1, name:"1-1-2"},
			{id:103, pId:1, name:"1-1-3"},
			{id:104, pId:1, name:"1-1-4"},
			{id:2, pId:0, name:"2-1", open:false},
			{id:201, pId:2, name:"2-1-1"},
			{id:202, pId:2, name:"2-1-2"},
			{id:203, pId:2, name:"2-1-3"},
			{id:3, pId:0, name:"3-1", open:false},
			{id:301, pId:3, name:"3-1-1"},
			{id:302, pId:3, name:"3-1-2"},
			{id:303, pId:3, name:"3-1-3"},
			{id:4, pId:0, name:"4-1", open:false},
			{id:401, pId:4, name:"4-1-1"},
			{id:402, pId:4, name:"4-1-2"},
			{id:403, pId:4, name:"4-1-3"}
        ];

        /**初始化树形数据*/
        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

        var newCount = 500;//用于生成新增的指标的标识id值
        /**鼠标移动到ztree节点上，显示信息*/
        function addHoverDom(treeId, treeNode) {
            //获取每个节点的文本对象
            var sObj = $("#" + treeNode.tId + "_span");
            //treeNode.editNameFlag 表示节点是否处于编辑名称状态
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='添加节点' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            
            //点击添加按钮时触发
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                newCount++;
                zTree.addNodes(treeNode, {id:(newCount), pId:treeNode.id, name:"新节点" + newCount});
                return false;
            });
        };
        
        /**鼠标移出ztree节点时触发*/
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };
        
        
        /**
			用于捕获节点被拖拽之前的事件回调函数
			参数：
			treeId：被拖拽的节点所在树的treeId
			treeNodes：要被拖拽的节点数据集合
		*/
		function beforeDrag(treeId,treeNodes){
		    console.log("beforeDrag...");
		    //获取树形所有节点信息
		    var zTree = $.fn.zTree.getZTreeObj(treeId);
		      	var node = zTree.getNodes();//获取树形的所有父节点信息
		        var nodes = zTree.transformToArray(node);//获取所有节点的信息（包括子节点）
		      	for(var i=0;i<nodes.length;i++){
		      	    var node = nodes[i];
		      	    console.log("id="+node.id+";pid="+node.pId+";name="+node.name);
		      	}
		        
		        
		    for (var i=0,l=treeNodes.length; i<l; i++) {
		        if (treeNodes[i].drag === false) {
		            return false;
		        }
		    }
		    return true;
		}
		
		/**
			节点拖拽结束之前的事件回调函数
			参数：
			treeId：树的id
			treeNodes：被移动的节点信息。（类型为节点数组对象）
			targetNodeJson：被拖拽放开的目标节点 。（类型为节点对象）        	
		*/
		function beforeDrop(treeId, treeNodes, targetNode) {
		    console.log("beforeDrop...");
		    //获取树的所有节点信息
		    var zTree = $.fn.zTree.getZTreeObj(treeId);
		      	var node = zTree.getNodes();//获取树形的所有父节点信息
		        var nodes = zTree.transformToArray(node);//获取所有节点的信息（包括子节点）
		      	for(var i=0;i<nodes.length;i++){
		      	    var node = nodes[i];
		      	    console.log("id="+node.id+";pid="+node.pId+";name="+node.name);
		      	}
		    return targetNode ? targetNode.drop !== false : true;
		}
		
		
		/**用于捕获节点拖拽结束的事件回调函数*/
		
		/**
			用于捕获节点拖拽结束的事件回调函数
			参数：
			event：标准的js event对象
			treeId：树的id
			treeNodes：被拖拽的节点JSON数据集合
			targetNodes：拖拽结束的目标节点JSON数据集合
		*/
		function onDrop(event, treeId, treeNodes, targetNode) {
		    console.log("onDrop...");
		    //获取树形所有节点信息
		    var zTree = $.fn.zTree.getZTreeObj(treeId);
		      	var node = zTree.getNodes();//获取树形的所有父节点信息
		        var nodes = zTree.transformToArray(node);//获取所有节点的信息（包括子节点）
		      	for(var i=0;i<nodes.length;i++){
		      	    var node = nodes[i];
		      	    console.log("id="+node.id+";pid="+node.pId+";name="+node.name);
		      	}
		}
		
		
		/**获取数据*/
		function getData(){
		    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		    var node = zTree.getNodes();//获取树形的所有父节点信息
		    var nodes = zTree.transformToArray(node);//获取所有节点的信息（包括子节点）
		    for(var i = 0;i < nodes.length;i++){
				var n = nodes[i];
				console.log("id="+n.id+";name="+n.name+";pId="+n.pId);
		    }
		    
		}
        
    </SCRIPT>
</body>
</html>