<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单拖拽（弹出层添加编辑删除）</title>
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
									<h4 class="widget-title lighter smaller">拖拽菜单，弹出层添加编辑删除</h4>
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
                removeHoverDom: removeHoverDom,//鼠标移出节点时触发
                selectedMulti: false
            },
            data: {
                simpleData: {//使用简单数据模型（就是id和pid这种关系）
                    enable: true/* ,
                    idKey: "id",
					pIdKey: "pId",
					rootPId: 0 */
                }
            },
           /*  async:{
        		enable:true,
        		autoParam:["id"],
        		dataType:"json"
            }, */
            edit: {
                enable: true//设置 zTree 是否处于编辑状态
            },
            callback:{
        		beforeDrag:beforeDrag,//捕获节点拖拽之前的事件回调函数
        		beforeDrop:beforeDrop,//捕获节点拖拽操作结束之前的事件回调函数
        		onDrop: onDrop,//捕获节点拖拽操作结束之后的事件回调函数
        		beforeEditName:beforeEditName,//捕获节点编辑按钮的click事件，并且返回确定是否允许进入编辑名称状态
        		onRename:onRename,//编辑节点名称后的事件回调函数
        		beforeRemove:beforeRemove,//捕获节点删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
        		onRemove:onRemove//捕获删除节点之后的事件回调函数
            }
        };

        var zNodes =[
            {id:1, pId:0, name:"1-1",pName:'', open:true},
			{id:101, pId:1, name:"1-1-1",pName:'1-1'},
			{id:102, pId:1, name:"1-1-2",pName:'1-1'},
			{id:103, pId:1, name:"1-1-3",pName:'1-1'},
			{id:104, pId:1, name:"1-1-4",pName:'1-1'},
			{id:2, pId:0, name:"2-1",pName:'', open:false},
			{id:201, pId:2, name:"2-1-1",pName:'2-1'},
			{id:202, pId:2, name:"2-1-2",pName:'2-1'},
			{id:203, pId:2, name:"2-1-3",pName:'2-1'},
			{id:3, pId:0, name:"3-1",pName:'', open:false},
			{id:301, pId:3, name:"3-1-1",pName:'3-1'},
			{id:302, pId:3, name:"3-1-2",pName:'3-1'},
			{id:303, pId:3, name:"3-1-3",pName:'3-1'},
			{id:4, pId:0, name:"4-1",pName:'', open:false},
			{id:401, pId:4, name:"4-1-1",pName:'4-1'},
			{id:402, pId:4, name:"4-1-2",pName:'4-1'},
			{id:403, pId:4, name:"4-1-3",pName:'4-1'}
        ];

        /**初始化树形数据*/
        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

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
            addNodeObj(treeId,treeNode);
        };
        
        
        /**
        	点击添加节点按钮，触发新增节点操作
        	treeId：树的id
        	treeNode：在该节点上增加子节点
        */
        function addNodeObj(treeId,treeNode){
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
			layer.open({
	       		    title: '添加节点',//弹出层标题
       				type: 2,//弹出层类型：iframe
       				content: 'demo/treeview/tree6-add.jsp',//弹出层嵌套页面
	       			//skin: 'layui-layer-rim', //弹出层加上边框
	       			//area: [window.screen.width / 2 + 'px', window.screen.height / 2 + 'px'], //宽高
	       			area :['520px','250px'],//弹出层宽高
	       			scrollbar:false,//屏蔽滚动条
	       			//closeBtn:1,//关闭按钮
	       			shadeClose:false,//设置点击遮罩层不关闭弹窗
	       			success: function(layero, index){//弹出层弹出后回调
	       			    //获取被点击的节点id和名称
	       		    	var id = treeNode.id;
	       		    	var name = treeNode.name;
	       		    	//给子页面的parentId 和 parentName 输入框赋值
	       		 		$(layero).find("iframe")[0].contentWindow.$("#pId").val(id);
	       		 		$(layero).find("iframe")[0].contentWindow.$("#pName").val(name);
	       		 		
	       		 		//获取子页面的iframe对象
	       		 		var iframe = window['layui-layer-iframe' + index];
	       		 		//获取子页面的保存按钮
	       		 		var saveBtn = iframe.$("#saveBtn");
	       		 		//如果保存按钮存在，当该按钮点击时触发
	       		 		if(saveBtn) saveBtn.bind('click',function(){
	       		 		    //获取父页面的树对象
	       		 			var zTree = $.fn.zTree.getZTreeObj(treeId);
	       		 		    //设置新增节点的id和name值
	       		 			var addNodeId = 700;
	       		 			addNodeId++;
	       		 		 	var name = iframe.$("#name").val();
	       		 		 	//调用zTree提供的添加节点的方法
	       		 			zTree.addNodes(treeNode, {id:addNodeId, pId:treeNode.id, name:name,pName:treeNode.name});
	       		 		 	//关闭弹出层
	       		 		    layer.close(index);
	       		 			return false;
	       		 		});
	       		  	}
	       		});    
				return false;
	   		 });
        }
        
        
        
        
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
		
		
		/**
			用于捕获节点编辑按钮的click事件，并且根据返回值确定是否允许进入名称编辑状态
		*/
		function beforeEditName(treeId,treeNode){
		    console.log("更新节点数据之前的回调函数");
		    layer.open({
	       		title: '编辑节点',//弹出层标题
   				type: 2,//弹出层类型：iframe
   				content: 'demo/treeview/tree6-edit.jsp',//弹出层嵌套页面
       			//skin: 'layui-layer-rim', //弹出层加上边框
       			//area: [window.screen.width / 2 + 'px', window.screen.height / 2 + 'px'], //宽高
       			area :['520px','250px'],//弹出层宽高
       			scrollbar:false,//屏蔽滚动条
       			//closeBtn:1,//关闭按钮
       			shadeClose:false,//设置点击遮罩层不关闭弹窗
       			success: function(layero, index){//弹出层弹出后回调
	       			//获取被点击的节点id和名称
	   		    	var id = treeNode.id;
	   		    	var name = treeNode.name;
	   		    	var pId = treeNode.pId;
	   		    	var pName = treeNode.pName;
	   		    	console.log("id="+id+";name="+name+";pId="+pId+";pName="+pName);
	   		    	//给子页面的指标的id/父id/名称/父节点名称赋值
	   		    	var iframe = $(layero).find("iframe")[0].contentWindow;
	   		    	iframe.$("#id").val(id);
	   		    	iframe.$("#name").val(name);
	   		    	iframe.$("#pId").val(pId);
	   		    	iframe.$("#pName").val(pName);
	   		    	
	   		    	//获取编辑页面保存按钮对象
	   		    	var saveBtn = iframe.$("#saveBtn");
	   		    	if(saveBtn) saveBtn.bind('click',function(){
		   		    	//获取父页面的树对象
	   		 			var zTree = $.fn.zTree.getZTreeObj(treeId);
		   		    	//获取子页面的节点的id、name、父节点id、父节点name
		   		    	var treeNode = new Object();
		   		    	var id = iframe.$("#id").val();
		   		    	var name = iframe.$("#name").val();
		   		    	var pId = iframe.$("#pId").val();
		   		    	var pName = iframe.$("#pName").val();
		   		    	console.log("修改的节点信息：id="+id+";name="+name+";pId="+pId+";pName="+pName);
		   		    	//zTree.updateNode({id:id,name:name,pId:pId,pName:pName});
		   		    	//关闭子页面
		   		    	layer.close(index);
	   		    	});
       			}
		    });
		    return false;
		}
		
		/**
			捕获编辑名称之后的事件回调函数
			参数：
			event：js event对象
			treeId：树的id
			treeNode：修改名称的节点JSON数据对象
		*/
		function onRename(event,treeId,treeNode){
		    console.log("编辑名称触发");
		}
		
		/**
			用于捕获节点删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
			参数：
			treeId：树的id
			treeNode：将要删除的节点json数据对象
		*/
		function beforeRemove(treeId,treeNode){
		    
		}
		
		
		/**
			捕获删除节点后触发的回调函数
			参数：
			event：标准的js event对象
			treeId：树的id
			treeNode：删除的节点json数据对象
		*/
		function onRemove(event,treeId,treeNode){
		    console.log("删除节点触发");
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