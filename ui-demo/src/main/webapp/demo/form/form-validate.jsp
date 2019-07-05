<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="<%=path%>">

<style>
	.checkbox-inline, .radio-inline {
	    position: relative;
	    display: inline-block;
	    padding-left: 0px;
	    margin-bottom: 0;
	    vertical-align: middle;
	    font-weight: 400;
	    cursor: pointer;
	}
</style>
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-primary" onclick="window.location.href='index.jsp'">
								<i class="fa fa-reply marginr5">返回</i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<!-- 表单开始 -->
							<form class="form-horizontal" id="validation-form" method="POST">
								<!-- 用户名 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="userName"><i class="required_flag">*</i>用户名：</label>
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" name="userName" id="userName" class="col-xs-12 col-sm-6" />
										</div>
									</div>
								</div>
								<!-- 密码 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><i class="required_flag">*</i>密码：</label>
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="password" name="password" id="password" class="col-xs-12 col-sm-6" />
										</div>
									</div>
								</div>
								<!-- 确认密码 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="rePassword"><i class="required_flag">*</i>确认密码：</label>
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="password" name="rePassword" id="rePassword" class="col-xs-12 col-sm-6" />
										</div>
									</div>
								</div>
								<!-- 性别 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right"><i class="required_flag">*</i>性别：</label>
									<div class="col-xs-12 col-sm-9">
										<label class="radio-inline">
											<input name="sex" value="1" type="radio" class="ace" />
											<span class="lbl"> 男</span>
										</label>
										<label class="radio-inline">
											<input name="sex" value="2" type="radio" class="ace" />
											<span class="lbl"> 女</span>
										</label>
									</div>
								</div>
								<!-- 技能 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right"><i class="required_flag">*</i>技能：</label>
									<div class="col-xs-12 col-sm-9">
										<label class="checkbox-inline">
											<input name="skill" value="1" type="checkbox" class="ace" />
											<span class="lbl"> JAVA</span>
										</label>
										<label class="checkbox-inline">
											<input name="skill" value="2" type="checkbox" class="ace" />
											<span class="lbl"> C语言</span>
										</label>
									</div>
								</div>
								<!-- 邮箱 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email"><i class="required_flag">*</i>邮箱：</label>
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="email" name="email" id="email" class="col-xs-12 col-sm-6" />
										</div>
									</div>
								</div>
								<!-- 普通下拉列表 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform"><i class="required_flag">*</i>普通下拉列表：</label>
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<select class="col-xs-12 col-sm-6" id="platform" name="platform">
												<option value="">-请选择-</option>
												<option value="选择一">选择一</option>
												<option value="选择二">选择二</option>
												<option value="选择三">选择三</option>
											</select>
										</div>
									</div>
								</div>
								
								<!-- 文本域 -->
								<div class="form-group">
									<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="comment"><i class="required_flag">*</i>备注</label>
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<textarea class="col-xs-12 col-sm-6" name="comment" id="comment"></textarea>
										</div>
									</div>
								</div>
								<!-- <div class="space-2"></div> -->
								
								<!-- 提交按钮 -->
								<div class="form-group">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Submit
										</button>

										&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset">
											<i class="ace-icon fa fa-undo bigger-110"></i>
											Reset
										</button>
									</div>
								</div>
							</form><!-- 表单结束 -->
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
	<script src="<%=path %>uiPlugs/ace-admin-1.4/assets/js/ace.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	<script type="text/javascript">
		$(function(){
		    formValidate();
		});
		
		//表单验证
		function formValidate(){
		    $('#validation-form').validate({
				errorElement: 'div',
				errorClass: 'help-block',
				focusInvalid: false,
				ignore: "",
				rules: {
				    userName:{
						required: true,
						maxlength:40
				    },
				    password: {
						required: true,
						minlength: 5,
						maxlength:10
					},
					rePassword: {
						required: true,
						minlength: 5,
						maxlength:10,
						equalTo: "#password"
					},
					sex:{
					    required: true 
					},
					skill:{
					    required: true 
					},
					email: {
						required: true,
						email:true
					},
					platform:{
					    required: true
					}
					,comment: {
						required: true,
						minlength: 5,
						maxlength:50,
					}
				},
		
				messages: {
				    userName:{
						required:"用户名必填！",
						maxlength:"最多输入40个字符！"
				    },
				    password:{
						required:"密码必填！",
						minlength:"密码最少5个字符！",
						maxlength:"密码最多10个字符！"
				    },
				    rePassword:{
						required: "确认密码必填！",
						minlength:"密码最少5个字符！",
						maxlength:"密码最多10个字符！",
						equalTo: "密码和确认密码输入不一致！"
				    },
				    sex:{
						required:"性别必填！"
				    },
				    skill:{
						required:"技能必填！"
				    },
				    email: {
						required: "邮件必填！",
						email:"邮件格式不正确！"
					},
					platform:{
					    required: "普通下拉列表必填！"
					}
					,comment: {
						required: "备注必填！",
						minlength: "备注最少5个字符！",
						maxlength:"备注最多50个字符！"
					}
				},
				highlight: function (e) {//显示错误提示的样式
					$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
				},
				success: function (e) {//验证通过后去掉错误提示的样式信息
					$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
					$(e).remove();
				},
				errorPlacement: function (error, element) {//复选框、下拉列表的错误提示信息特殊处理显示
					if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
						var controls = element.closest('div[class*="col-"]');
						if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
						else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
					}
					else if(element.is('.select2')) {
						error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
					}
					else if(element.is('.chosen-select')) {
						error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
					}
					else error.insertAfter(element.parent());
				},
		
				submitHandler: function (form) {//验证通过后触发
				    alert("验证通过!");
				},
				invalidHandler: function (form) {//验证未通过触发
				    alert("验证未通过!");
				}
			});
		    
		}
		
	</script>
	
</body>
</html>