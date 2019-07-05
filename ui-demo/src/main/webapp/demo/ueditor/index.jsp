<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="<%=path%>">
<script type="text/javascript"  src="uiplugs/ueditor/ueditor.config.js"></script>
<script type="text/javascript"  src="uiplugs/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript"  src="uiplugs/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<h3 class="header smaller lighter blue">百度ueditor的使用</h3>
					<form action="" class="form-horizontal" method="post">
						<div class="row">
							<div class="form-group">
								<label class="col-sm-2 control-label no-padding-right" for="editor">简介信息</label>
								<div class="col-sm-8">
									<script type="text/plain" id="editor" style="width: 100%"></script>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-10">
								<div class="text-center">
									<button class="btn btn-sm btn-primary" onclick="save();return false;">
										<i class="fa fa-save marginr5"></i>&nbsp;回显编辑信息
									</button>
									<button class="btn btn-sm btn-primary" onclick="panduan();return false;">
										<i class="fa fa-save marginr5"></i>&nbsp;判断是否有内容
									</button>
								</div>
							</div>
						</div>	
						
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2" >
								<h4 class="header smaller lighter blue">内容显示</h4>
								<div id="showContent">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>		
	
	<script type="text/javascript">
		var ue = UE.getEditor('editor',{
		   toolbars:[
		       [
			   		'undo',//撤销
			   		'redo',//重做
			   		'cleardoc',//清空文档
			   		'paragraph',//段落格式
			   		'fontfamily',//字体
			   		'fontsize',//字号
			   		'forecolor',//字体颜色
			   		'backcolor',//背景色
			   		'bold',//粗体
			   		'justifyleft',//居左对齐
			   		'justifycenter',//居中对齐
			   		'justifyright',//居右对齐
			   		'justifyjustify',//两端对齐
			   		'insertorderedlist', //有序列表
			   		'insertunorderedlist',//无序列表
			   		'indent',//首行缩进
			   		'lineheight',//行间距
			   		'spechars'//特殊字符
		       ]
		   ],
		   autoHeightEnabled:false,//是否保持toollbar的位置不动，默认true
		   autoFloatEnabled:true,//关闭富文本高度自动长高
		   elementPathEnabled:false,//关闭元素路径
		   initialFrameHeight:250,//默认编辑区的高度
		   wordCount:false,//关闭字数统计 
		   fontsize:[10,11,12,14,16,18,20]//设置字号的选择
		});
	
		ue.ready(function(){
		    /* ue.dom.domUtils.setStyles(self.ue.body, {
			'color': '#868686','font-family' : "'Microsoft Yahei','Helvetica Neue', Helvetica, STHeiTi, Arial, sans-serif", 'font-size' : '14px'
			}); */
		    
		    //ue.execCommand('fontfamily','微软雅黑');//设置默认字体 
		   //ue.execCommand('fontsize','10px');//设置默认字号
		   $(".edui-editor-messageholder.edui-default").css({"visibility":"hidden"});//去除本地保存成功提示 
		});
		
		//保存操作
		function save(){
		    var content = UE.getEditor('editor').getContent();
		    console.log("content="+content);
		    $("#showContent").html(content);
		}
		
		
		//判断是否有内容
		function panduan(){
		    if(!UE.getEditor('editor').hasContents()){
				alert("请录入信息！");
		    }
		}
	</script>
</body>
</html>