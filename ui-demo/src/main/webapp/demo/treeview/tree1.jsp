<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="<%=path%>">
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
									<h4 class="widget-title lighter smaller">树形结构（利用ace-tree插件）</h4>
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
	
	<!-- page specific plugin scripts -->
	<script src="<%=path %>uiplugs/ace-admin-1.4.0/assets/js/tree.min.js"></script>
	<script type="text/javascript">
	jQuery(function($){
		var dataSource = initiateDemoData();//see below

		$('#tree1').ace_tree({
			dataSource: dataSource,
			loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
			'open-icon' : 'ace-icon fa fa-folder-open',
			'close-icon' : 'ace-icon fa fa-folder',
			'itemSelect' : true,
			'folderSelect': true,
			'multiSelect': true,
			'selected-icon' : null,
			'unselected-icon' : null,
			'folder-open-icon' : 'ace-icon tree-plus',
			'folder-close-icon' : 'ace-icon tree-minus'
		});

		function initiateDemoData(){
			/* var tree_data = {
			    '菜单1-1':{
					'name':'菜单1-1','type':'folder','additionalParameters':{
						'id':'80','children':{
						    '菜单1-1-1':{'name':'菜单1-1-1','type':'item','additionalParameters':{'id':'127'}},
						    '菜单1-1-2':{'name':'菜单1-1-2','type':'item','additionalParameters':{'id':'128'}}
						}
			    	}
			    },
			    '菜单1-2':{'name':'菜单1-2-1','type':'item','additionalParameters':{'id':'129'}}
			}; */
			var tree_data = [
			    {
					"name":"客户管理",
					"type":"folder",
					"additionalParameters":{
					    "id":"1",
					    "children":[
							{
							    "name":"<i class='ace-icon fa fa-file-text grey'></i>客户列表",
							    "type":"item",
							    "additionalParameters":{
									'id':'1-1'
							    }
							},
							{
							    "name":"<i class='ace-icon fa fa-file-text grey'></i>客户列表2",
							    "type":"item",
							    "additionalParameters":{
									'id':'1-2'
							    }
							}
					    ]
					}
					
			    },
			    {
					"name":"学生管理",
					"type":"item",
					"additionalParameters":{
					    'id':'2'
					}
			    }
			    
			]
			
			var dataSource1 = function(options, callback){
				var data = null
				if(!("text" in options) && !("type" in options)){
					data = tree_data;//the root tree
					callback({ data: data });
					return;
				}
				else if("type" in options && options.type == "folder") {
					if("additionalParameters" in options && "children" in options.additionalParameters)
						data = options.additionalParameters.children || {};
					else data = {}//no data
				}
				
				if(data != null)//this setTimeout is only for mimicking some random delay
					setTimeout(function(){callback({ data: data });} , parseInt(Math.random() * 500) + 200);

				//we have used static data here
				//but you can retrieve your data dynamically from a server using ajax call
				//checkout examples/treeview.html and examples/treeview.js for more info
			}

			
			return dataSource1;
		}
		
		
		$("#tree1").on('updated',function(e,result){
		    console.log(result.info[0].id);
		}).on('selected',function(e,result){//选择
		}).on('unselected',function(e){//取消选择
		    
		}).on('opened',function(e,result){//打开文件夹
		    console.log("打开文件夹");
		}).on('closed',function(e){//关闭文件夹
		    console.log("关闭文件夹");
		}); 
	});
	
	
	</script>
</body>
</html>