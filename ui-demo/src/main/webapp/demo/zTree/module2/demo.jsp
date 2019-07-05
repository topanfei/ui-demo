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
									<h4 class="widget-title lighter smaller">动态添加、编辑、删除节点，不可拖拽节点</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										<ul id="treeDemo" class="ztree"></ul>
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
					<div class="space-8"></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="well well-lg">
								<h4 class="blue">使用到的zTree的知识点：</h4>
								<ul>
									<li>setting.view.selectedMulti:false  阻止按ctrl多选节点</li>
									<li>setting.view.addHoverDom：鼠标移动到节点上，显示用户自定义控件（案例中增加了添加节点按钮），同时默认显示zTree自带的编辑和删除按钮</li>
									<li>setting.view.removeHoverDom：鼠标移出节点后，隐藏自定义控件（案例中的添加按钮），同时隐藏zTree自带的编辑和删除按钮</li>
									<li>setting.edit.enable:true 设置可编辑树形</li>
									<li>setting.edit.showRenameBtn:true 设置显示编辑按钮，只有enbale值为true，则会默认显示编辑按钮</li>
									<li>setting.edit.renameTitle 设置编辑按钮的提示语信息</li>
									<li>setting.edit.showRemoveBtn:true 设置显示删除按钮，只有enbale值为true，则会默认显示删除按钮</li>
									<li>setting.edit.removeTitle 设置删除按钮的提示语信息</li>
									<li>setting.edit.drag.isMove:false 不允许树形节点移动，配合isCopy:false,则不可拖拽节点</li>
									<li>setting.edit.drag.isCopy:false 不允许拷贝树形节点，配合isMove:false,则不可拖拽节点</li>
									<li>setting.data.simpleData.enable：true 设置树形结构为简单数据模型，即 id、pId、name的json数据风格</li>
									<li>setting.callback.onClick 用于捕获节点被点击的事件回调函数，案例中用于展开折叠节点</li>
									<li>setting.callback.beforeEditName 用于捕获节点编辑的click事件，并且该事件方法返回值为true时，才会执行beforeRename事件回调。案例中用于编辑节点名称操作</li>
									<li>setting.callback.beforeRename 用于捕获节点编辑结束之后，更新节点数据之前的回调函数。只有beforeEditName事件方法返回true时，才会执行该事件的回调方法。案例中只是演示该方法的执行顺序</li>
									<li>setting.callback.onRename 用于捕获节点编辑名称结束之后的事件回调函数，只有beforeRename事件方法返回true时，才会执行该事件的回调方法。案例中只是演示该方法的执行顺序</li>
									<li>setting.callback.beforeRemove 用于捕获节点被删除之前的事件回调函数,案例中用于判断是否删除节点的前置操作。</li>
									<li>setting.callback.onRemove 用于捕获删除节点之后的事件回调函数。只有beforeRemove事件方法返回true时，才会执行该事件的毁掉方法。案例中只是演示该方法的执行顺序</li>
								</ul>
								<hr>
								<h4 class="blue">使用到的layui的弹出层知识点：</h4>
								<ul>
									<li>open的弹出层使用，特别是在父页面给子页面传参时，如何获取子页面的。代码为：iframe对象var iframe = window['layui-layer-iframe' + index]; </li>
									 
								</ul>
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
				,addHoverDom: addHoverDom//鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同ztree内部的编辑、删除按钮
		        ,removeHoverDom: removeHoverDom//鼠标移出节点后触发的事件回调
			},
			edit: {
                enable: true//设置 zTree 是否处于编辑状态
                ,showRenameBtn:true//设置是否显示编辑名称按钮
                ,renameTitle:'编辑'//编辑名称标题提示语
                ,showRemoveBtn:true//设置是否显示删除按钮
                ,removeTitle:'删除'//删除按钮的标题提示语
                ,drag:{
                    //设置不允许拖拽，如果使用了edit的enable，不设置isMove和isCopy则默认是可以拖拽的
                    isMove:false
                    ,isCopy:false 
                }
		    },
			data: {
				simpleData: {
					enable: true//简单的树形数据模型
				}
			},
			callback:{
			    onClick:onClick//用于捕获节点被点击的事件回调函数
			    ,beforeEditName:beforeEditName//用于捕获节点编辑的click事件，并且根据返回值是否允许进入名称编辑状态
			    ,beforeRename:beforeRename//用于捕获节点编辑结束之后，更新节点数据之前的回调函数
			    ,onRename:onRename//用于捕获节点编辑名称结束之后的事件回调函数
			    ,beforeRemove:beforeRemove//用于捕获节点被删除之前的事件回调函数
			    ,onRemove:onRemove//用于捕获删除节点之后的事件回调函数
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
			用于当鼠标移动到节点上，增加自定义控件（添加按钮），同时 显示隐藏状态同ztree内部的编辑、删除按钮
			参数：
			（1）treeId：树id
			（2）treeNode：需要显示自定义控件的节点
		*/
		function addHoverDom(treeId,treeNode){
			//获取每个节点的文本对象（treeNode.tId是zTree的内部生成规则，此处的值为：treeDemo_2）
            var treeNodeTextSpanObj = $("#" + treeNode.tId + "_span");
            //如果某节点上的添加按钮已存在，则返回
            if ($("#addBtn_"+treeNode.tId).length>0) return;
            //给节点的文本后面拼接添加按钮
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='添加'  onfocus='this.blur();'></span>";
            treeNodeTextSpanObj.after(addStr);
            
            //调用添加节点的方法
            addClick(treeId,treeNode);
            
            
            //return false;
		}
		
		/**
			节点上添加按钮绑定点击事件，用于添加节点
			参数：
			（1）treeId：树id
			（2）treeNode：点击的节点
		*/
		
		function addClick(treeId,treeNode){
		    //树对象
		    var treeObj = $.fn.zTree.getZTreeObj(treeId);
			//如果某节点上的添加按钮存在，则给添加按钮上绑定点击事件
           	var addBtn = $("#addBtn_"+treeNode.tId);
           	if(addBtn) addBtn.bind('click',function(){
				layer.open({
				    title:'添加节点'//弹出层标题
				    ,type: 2 //弹出层类型：iframe
	       			,content: 'demo/zTree/module2/demo-add.jsp'//弹出层嵌套页面
				    //,skin: 'layui-layer-rim'//弹出层加上边框
		       		//,area: [window.screen.width / 2 + 'px', window.screen.height / 2 + 'px'] //宽高
		       		,area :['520px','250px'] //弹出层宽高
		       		,scrollbar:false //屏蔽滚动条
		       		,shadeClose:false //设置点击遮罩层不关闭弹窗
		       		,success: function(layero, index){//弹出层弹出后回调
		       			var id = treeNode.id;
	       				var name = treeNode.name;
		       		    /* var pId = treeNode.pId;
		       			var pName = treeObj.getNodeByParam("id", pId, null).name; 
		       			console.log("id="+id+";name="+name+";pId="+pId+";pName="+pName);*/
		       			//获取子页面iFrame的对象，并且为子页面的pName字段赋值
		       			var iframe = window['layui-layer-iframe' + index];
		       		    iframe.$("#pName").val(name);
		       			
		       			//获取子页面的保存按钮
	       		 		var saveBtn = iframe.$("#saveBtn");
	       		 		//如果保存按钮存在，当该按钮点击时触发
	       		 		if(saveBtn) saveBtn.bind('click',function(){
	       		 		    var addNodeName = iframe.$("#name").val();//新增节点的名称
	       		 		    var pId = id;
	       		 		    var id = generateNodeIdVal();
	       		 		    var newNodeObj = {id:id,pId:pId,name:addNodeName};
	       		 			//调用zTree提供的添加节点的方法
	       		 			treeObj.addNodes(treeNode, newNodeObj);
	       		 		 	//关闭弹出层
	       		 		    layer.close(index);
	       		 		});
		       		}
				});
				return false;
           	});
		}
		
		/**
			用于生成新增节点的id值
		*/
		var initNewNodeIdVal = 700;//用于新增节点id的值
		function generateNodeIdVal(){
		    initNewNodeIdVal++;
		    return initNewNodeIdVal;
		}
		
		
		/**
			用于鼠标移出节点时，隐藏自定义的控件，同时隐藏zTree内部的编辑、删除按钮
			参数：
			（1）treeId：树id
			（2）treeNode：需要隐藏自定义控件的节点JSON数据对象
		*/
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
        };
		
		
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
		
		/**
			用于捕获节点编辑按钮的click事件，并且根据返回值确定是否允许进入编辑名称状态
			如果返回false，无法进入beforeRename方法；返回true，则可以进入
			参数：
			（1）treeId：树id
			（2）将要进入编辑状态的节点JSON对象
		*/
		function beforeEditName(treeId,treeNode){
		    //打开输入层
		    layer.prompt(
			    {
					title:'编辑节点名称'
			    },
			    function(value,index,elem){
				//更新编辑节点的名称信息
				var zTree = $.fn.zTree.getZTreeObj(treeId);
				treeNode.name = value;
				zTree.updateNode(treeNode);
				//关闭弹出层
				layer.close(index);
		    });
		    return false;
		}
		
		
		/**
			用于捕获节点编辑名称结束之后，更新节点名称数据之前的事件回调函数
			返回false，则无法进入onRename方法；返回true，则可以进入
			参数：
			（1）treeId：树的id
			（2）treeNode：将要更改名称的节点JSON数据对象
			（3）newName：修改后的新名称
			（4）isCancel：是否取消操作
		*/
		function beforeRename(treeId,treeNode,newName,isCancel){
		    console.log("编辑节点名称之前");
		    return false;
		}
		
		/**
			用于捕获节点编辑名称结束之后的事件回调函数
		*/
		function onRename(event,treeId,treeNode){
		    console.log("编辑节点名称之后的回调函数");
		}
		
		
		/**
			用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
			返回false，无法进入onRemove方法；返回true，则可以进入
			参数：
			（1）treeId：树id
			（2）treeNode：将要删除的节点JSON数据对象
		*/
		function beforeRemove(treeId,treeNode){
		    var tips = "您确定要删除吗？";
		    if(treeNode.isParent){//返回true，则表示该节点是父节点；否则，该节点是子节点
				tips = "该节点下有子节点，您确定要删除吗？";
		    }
		    layer.confirm(tips, {icon: 3, title:'提示信息'}, function(index){
				//删除节点信息，如果是父节点，则会将其父节点和子节点全部删除
				var zTree = $.fn.zTree.getZTreeObj(treeId);
				zTree.removeNode(treeNode);
				//关闭弹出层
				layer.close(index);
			});
		    return false;
		}
		
		/**
			用于捕获删除节点之后的事件回调函数
			参数：
			（1）event：标准的js event对象
			（2）treeId：对应的树id
			（3）treeNode：将要删除的节点JSON数据对象
		*/
		function onRemove(event,treeId,treeNode){
		    console.log("删除操作");
		}
	</script>
	
</body>
</html>