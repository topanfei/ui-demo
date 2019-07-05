<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加节点</title>
<base href="<%=path%>">
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<form class="form-horizontal" method="post" action="" id="addForm" role="form" >
						<!-- 搜索开始 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<input type="hidden" name="id" id="id">
									<input type="hidden" name="pId" id="pId">
									<!-- 父节点名称 -->
									<label class="col-sm-1 control-label no-padding-right" for="pName">父节点名称</label>
									<div class="col-sm-9">
										<input type="text" id="pName" placeholder="父节点名称" readonly="readonly" class="form-control">
									</div>
									<!-- 节点名称 -->
									<label class="col-sm-1 control-label no-padding-right" for="name">节点名称</label>
									<div class="col-sm-9">
										<input type="text" id="name" placeholder="节点名称" class="form-control">
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-12">
								<div class="text-center">
									<button id="saveBtn" class="btn btn-sm btn-primary">
										<i class="fa fa-save marginr5"></i>&nbsp;保存
									</button>
								</div>		
							</div>
						</div>	
					</form>
				</div>
			</div>
		</div>
	</div>						
	
	<script type="text/javascript">
		/* var treeNode = new Object();
		function setVal(treeNode,parentId,parentName){
		    treeNode = treeNode;
		    console.log("treeNodeaaa="+treeNode+";id="+treeNode.id);
		    $("#parentId").val(parentId);
		    $("#parentName").val(parentName);
		} */
	
	</script>
</body>
</html>