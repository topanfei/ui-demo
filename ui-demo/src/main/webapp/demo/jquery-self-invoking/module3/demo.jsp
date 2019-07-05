<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>自定义插件</title>
<base href="<%=path%>">
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<h4 class="header smaller lighter blue">自定义插件</h4>
					<form class="form-horizontal" name="form" method="post" action="" id="form" role="form" >
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right" for="xx1">输入框</label>
									<div class="col-sm-6">
										<input type="text" id="xx1" v_empty='1' v_min='1' v_max="20" placeholder="请输入..." class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right" for="userName">下拉列表</label>
									<div class="col-sm-6">
										<input type="text" id="xx2" placeholder="请输入..." class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2 no-padding-right">单选</label>
									<div class="col-sm-6">
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
								<div class="form-group">
									<label class="control-label col-sm-2 no-padding-right">多选</label>
									<div class="col-sm-6">
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
								<div class="form-group">
									<label class="control-label col-sm-2 no-padding-right" for="comment">文本域</label>
									<div class="col-sm-6">
										<div class="clearfix">
											<textarea class="form-control" name="comment" id="comment"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-12">
								<div class="text-center">
									<button class="btn btn-sm btn-primary" onclick="goSubmit();return false;">
										<i class="fa fa-check marginr5"></i>&nbsp;提交
									</button>
									<button class="btn btn-sm btn-primary">
										<i class="fa fa-refresh marginr5"></i>&nbsp;重置
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
	
		function goSubmit(){
		    //$.myWebUtil.submit("FormSerlvet",{"is_check":false});
		   var checkbox = $("#form").find(":checkbox");
		   console.log("checkbox="+checkbox);
		   console.log("checkbox length = "+checkbox.length);
		}
		
		
		(function($){
		    /**验证表单*/
		    $.fn.formIsValid = function(){
				var formObj = $(this);
				var isValid = true;
				var elements = $.webValidator.getFormElements(formObj);
				$.each(elements,function(){
				   var elem = $(this);//每个元素对象
				   var options = $.webValidator.getOption(elem);//获取页面每个元素上的配置项
				});
		    }
		    
		    $.webValidator = {
			      defaults: {
				      type: 'text', //默认是文本
				      empty: true, //非空
				      min: 0, //最小值
				      max: 999999, //最大值
				      onErrMsg: '',
				      onShowMsg: '',
				      isCheck: true //是否验证：默认必须验证
			      },
			      getFormElements: function(formObj){
				  	  var textElem = formObj.find(":text");//获取所有文本元素
				  	  var passwordElem = formObj.find(":password");//获取所有密码元素
				  	  var radioElem = formObj.find(":radio");//获取所有单选元素
				  	  var checkboxElem = formObj.find(":checkbox");//获取所有复选框元素
				  	  var selectElem = formObj.find(":select");//获取所有下拉列表元素
				  	  var textareaElem = formObj.find(":textarea");//获取所有文本域元素
				  	  var uploadElem = formObj.find("[name='uploadBtn']");//获取所有文件上传按钮元素
				  	  var b = $.merge(textElem,passwordElem);
				  	  b = $.merge(b,radioElem);
				  	  b = $.merge(b,checkboxElem);
				  	  b = $.merge(b,selectElem);
				  	  b = $.merge(b,textareaElem);
				  	  b = $.merge(b,uploadElem);
				  	  return b;
			      },
			      getOption: function(elem){
					 if(elem == null || elem.length == 0){
					      return null;
					 }
					 var options = {};
					 $.extend(options,$.webValidator.defaults);
					 var type = elem.attr("v_type");
					 if(type != null){
					     options.type = type;
					 }
					 var empty = elem.attr("v_empty");
					 if(empty != null){
					     options.empty = empty;
					 }
					 var min = elem.attr("v_min");
					 if(min != null){
					     options.min = min;
					 }
					 var max = elem.attr("v_max");
					 if(max != null){
					     options.max = max;
					 }
					 var onErrMsg = elem.attr("v_onErrMsg");
					 if(onErrMsg != null){
					     options.onErrMsg = onErrMsg;
					 }
					 var onShowMsg = elem.attr("v_onShowMsg");
					 if(onShowMsg != null){
					     options.onShowMsg = onShowMsg;
					 }
					 var isCheck = elem.attr("v_isCheck");
					 if(isCheck != null){
					     options.isCheck = isCheck;
					 }
					 return options;
			      }
			     
		    };
		    
		    
		})(jQuery);
	
	</script>
</body>
</html>