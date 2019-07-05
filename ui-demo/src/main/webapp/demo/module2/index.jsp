<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>利用iframe布局搜索和列表的页面</title>
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<h3 class="header smaller lighter blue">利用iframe+form隐藏域，通过搜索值查询对应数据。搜索不需回显</h3>
					<form class="form-horizontal" method="post" action="" id="form" role="form" >
						<!-- 搜索开始 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="widget-box">
									<div class="widget-header">
										<h4 class="widget-title"><i class="fa fa-search"></i>&emsp;查询条件</h4>
										<div class="widget-toolbar">
											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>
										</div>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<!-- 输入框 -->
														<label class="col-sm-1 control-label no-padding-right" for="xx1">输入框</label>
														<div class="col-sm-3">
															<input type="text" id="xx1" placeholder="xx1" class="form-control">
														</div>
														
														<!-- 下拉列表 -->
														<label class="col-sm-1 control-label no-padding-right" for="xx2">下拉列表</label>
														<div class="col-sm-3">
															<select id="xx2" class="form-control">
																<option value="">-请选择-</option>
																<option value="1">选项1</option>
																<option value="2">选项2</option>
																<option value="3">选项3</option>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<!-- 年月日期 -->
														<label class="col-sm-1 control-label no-padding-right" for="xx3">年月日期</label>
														<div class="col-sm-3">
															<div class="input-group">
																<input type="text" class="form-control date-picker" id="xx3">
																<span class="input-group-addon">
																	<i class="fa fa-calendar bigger-110"></i>
																</span>
															</div>
														</div>
														<!-- 年月日日期 -->
														<label class="col-sm-1 control-label no-padding-right" for="xx4">年月日日期</label>
														<div class="col-sm-3">
															<div class="input-group">
																<input type="text" class="form-control date-picker" id="xx4">
																<span class="input-group-addon">
																	<i class="fa fa-calendar bigger-110"></i>
																</span>
															</div>
														</div>
														<!-- 日期区间 -->
														<label class="col-sm-1 control-label no-padding-right">日期区间</label>
														<div class="col-sm-3">
															<div class="input-daterange input-group">
																<input type="text" class="input-sm form-control" id="startDate">
																<span class="input-group-addon">
																	<i class="fa fa-exchange"></i>
																</span>
																<input type="text" class="input-sm form-control" id="endDate">
															</div>
														</div>
													</div>
													
													<div class="form-group">
														<!-- 搜索下拉单选列表 -->
														<label class="col-sm-1 control-label no-padding-right" for="xx5">单选搜索下拉</label>
														<div class="col-sm-3">
															<select id="xx5" class="form-control multiselect">
																<option value="">请选择</option>
																<option value="1">选项1</option>
																<option value="2">选项2</option>
																<option value="3">选项3</option>
															</select>
														</div>
													
														<!-- 搜索下拉多选列表 -->
														<label class="col-sm-1 control-label no-padding-right" for="xx6">多选搜索下拉</label>
														<div class="col-sm-3">
															<select id="xx6" class="form-control multiselect" multiple="multiple">
																<option value="1">选项1</option>
																<option value="2">选项2</option>
																<option value="3">选项3</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<!-- 按钮 -->
											<div class="row">
												<!-- BootStrap文本水平居中用 class="text-center"
													 BootStrap图片居中  class="class-block"
													 其他元素，使用列偏移 class="col-md-offset-4"
												 -->
												<div class="text-center">
													<button class="btn btn-sm btn-primary">
														<i class="fa fa-search marginr5"></i>&nbsp;搜索
													</button>
													<button class="btn btn-sm btn-primary">
														<i class="fa fa-refresh marginr5"></i>&nbsp;重置
													</button>
													<button class="btn btn-sm btn-primary">
														<i class="fa fa-download marginr5"></i>&nbsp;下载
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!-- 搜索结束 -->
					</form>
						
					<!-- 表格数据 -->
					<div class="row">
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title"><i class="fa fa-list"></i>&emsp;明细列表</h4>
									<div class="widget-toolbar">
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
									</div>
								</div>
								<div class="widget-body">
									<div class="widget-main">
										<div class="row">
											<div class="col-sm-12">
												<!-- 数据表格的数据，用于iframe传参给后台 -->
												<form id="dataListForm" method="post" action="module/dataList" target="dataListForm">
													<input type="hidden" name="xx1">
													<input type="hidden" name="xx2">
													<input type="hidden" name="xx3">
													<input type="hidden" name="xx4">
													<input type="hidden" name="xx5">
													<input type="hidden" name="pageCurrNum">
													<input type="hidden" name="pageSize">
												</form>
												<iframe name="dataListForm" id="dataListFrame" frameBorder="0" scrolling="no" width="100%">
												</iframe>
											</div>
										</div>
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
	
		//文档地址：http://davidstutz.de/bootstrap-multiselect/
		//下拉搜索组件
		$(".multiselect").multiselect({
			buttonWidth:'100%',
			maxHeight:'300',//下拉面板的高度
			includeSelectAllOption:true,//开启全选
			selectAllText:'全选',//下拉面板全选显示字样
			selectAllNumber:true,//
			enableFiltering:true,//开启过滤
			filterPlaceholder:'请搜索...',//搜索框显示字样
			enableCaseInsensitiveFiltering:true,//搜索不区分大小写
			nonSelectedText:'请选择',//一个未选中，显示字样
			nSelectedText:'选中',//若干个选中，显示中文字样
			allSelectedText:'全部选中',//所有选项选中，显示字样
			buttonClass: 'btn btn-white btn-primary',
			 templates: {
				button: '<button type="button" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> &nbsp;<b class="fa fa-caret-down"></b></button>',
				ul: '<ul class="multiselect-container dropdown-menu"></ul>',
				filter: '<li class="multiselect-item filter"><div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input class="form-control multiselect-search" type="text"></div></li>',
				filterClearBtn: '<span class="input-group-btn"><button class="btn btn-default btn-white btn-grey multiselect-clear-filter" type="button"><i class="fa fa-times-circle red2"></i></button></span>',
				li: '<li><a tabindex="0"><label></label></a></li>',
		        divider: '<li class="multiselect-item divider"></li>',
		        liGroup: '<li class="multiselect-item multiselect-group"><label></label></li>'
			 }
		});
	
		//年月日期组件
		$("#xx3").datepicker({
			format:'yyyymm',
			autoclose:true,
			startView:'year',
			minViewMode:'year',
			maxViewMode:'decade',
			language:'zh-CN',
			onSelect:goQuery
		}).on('changeDate',goQuery);
		
		//年月日日期组件
		$("#xx4").datepicker({
			format:'yyyymmdd',
			autoclose:true,
			language:'zh-CN',
			onSelect:goQuery
		}).on('changeDate',goQuery);
		
		//日期区间组件
		$(".input-daterange").datepicker({
		    autoclose:true,
		    language:'zh-CN'
		});
		
		//年月日期和年月日日期组件右边的日历按钮
		$(".date-picker").datepicker().next().on(ace.click_event,function(){
		   $(this).prev().focus(); 
		});
		
		/**选中日期后触发*/
		function goQuery(ev){
		    var year = ev.date.getFullYear();
		    var month = ev.date.getMonth()+1;
		    var date = ev.date.getDate();
		    if(month.toString().length == 1){
				month = "0"+month;
		    }
		    if(date.toString().length == 1){
				date = "0"+date;
		    }
			console.log("year="+year+";month="+month+";date="+date);
	    }
		
	
		$(function(){
		    queryData();
		});
	
		/**查询表格数据*/
		function queryData(){
		   //以一个字段为例，以xx1字段为例
		   var xx1 = $("#xx1","#form").val();
		   //将搜索的值赋值给搜素表单的隐藏域
		   $("input[name='xx1']","#dataListForm").val(xx1);
		   $("#dataListForm").submit();
		}
	</script>			
</body>
</html>