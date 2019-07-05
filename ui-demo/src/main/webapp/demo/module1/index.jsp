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
					<h3 class="header smaller lighter blue">自定义alert的使用</h3>
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-sm btn-primary" onclick="selfAlert1();return false;">
								alert使用（无回调）
							</button>
							<button class="btn btn-sm btn-primary" onclick="selfAlert2();return false;">
								alert使用（有回调）
							</button>
							<button class="btn btn-sm btn-primary" onclick="selfAlert3();return false;">
								alert右下角显示，并显示动态效果
							</button>
						</div>
					</div>
					<h3 class="header smaller lighter blue">自定义confirm的使用</h3>
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-sm btn-primary" onclick="selfConfirm();return false;">
								confirm的使用
							</button>
						</div>
					</div>	
					<h3 class="header smaller lighter blue">自定义tips的使用</h3>
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-sm btn-primary" onclick="selfTips(this);return false;">
								tips的使用
							</button>
						</div>
					</div>	
					<h3 class="header smaller lighter blue">自定义msg的使用</h3>
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-sm btn-primary" onclick="selfMsg();return false;">
								msg的使用：无回调
							</button>
							<button class="btn btn-sm btn-primary" onclick="selfMsg2();return false;">
								msg的使用：有回调
							</button>
						</div>
					</div>	
					<h3 class="header smaller lighter blue">自定义open的使用</h3>
					<div class="row">
						<div class="col-sm-12">
							<button class="btn btn-sm btn-primary" onclick="selfOpen();return false;">
								open的使用：iframe
							</button>
							<button class="btn btn-sm btn-primary" onclick="selfOpen2();return false;">
								open的使用：右下角显示提示窗体
							</button>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	/*****************************alert使用***********************************/
		/**功能1：自定义的alert使用：无回调*/
		function selfAlert1(){
			$.webUtil.alert("无回调的alert使用");
		}
		
		/**功能2：自定义的alert使用：有回调*/
		function selfAlert2(){
			var opts = {
				yes: selfAlert2Success	
			};
			$.webUtil.alert("有回调的alert使用",opts);
		}
		
		/**alert的回调函数*/
		function selfAlert2Success(){
			$.webUtil.alert("alert回调信息");
		}
		
		/**功能3：自定义的alert使用：右下角显示附有动态效果*/
		function selfAlert3(){
			var opts = {
				offset: 'rb', //右下角显示
				anim: '1' //0-6的动画形式，-1不开启
			};
			$.webUtil.alert("右下角显示附有动态效果",opts);
		}
		/*****************************confirm使用***********************************/
		/**功能1：自定义confirm使用*/
		function selfConfirm(){
			$.webUtil.confirm('您是否确定吗？',selfConfirmSuccess);
		}
		
		/**自定义confirm的回调函数*/
		function selfConfirmSuccess(){
			$.webUtil.alert("confirm的成功回调函数");
		}
		
		/*****************************tips使用***********************************/
		/**功能1：自定义tips的使用*/
		function selfTips(obj){
			$.webUtil.tips(obj,"提示信息");
		}
		
		/*****************************msg使用***********************************/
		/**功能1：自定义msg的使用：手动关闭*/
		function selfMsg(){
			var index = $.webUtil.msg("msg提示信息，默认不会自动关闭遮罩层，需手动关闭遮罩层。本案例3秒后手动关闭");
			//3秒后手动关闭
			setTimeout(function(){
				$.webUtil.closeWindow(index);
			},3000);
			
		}
		
		/**功能2：自定义msg的使用：自动关闭*/
		function selfMsg2(){
			var opts = {
				time: 3000,//设置3秒后自定关闭遮罩层，如果不设置时间，默认是不会关闭遮罩层，必须手动调用closeWindow关闭
				end: selfMsg2Success	
			}
			$.webUtil.msg('msg提示信息，设置的三秒后自动关闭，如果不设置时间，默认不会自动关闭遮罩层，需手动关闭',opts);
		}
		/**自定义msg的回调函数*/
		function selfMsg2Success(){
			$.webUtil.alert("msg的回调函数");
		}
		
		/*****************************open使用***********************************/
		/**功能1：自定义打开窗口：嵌套iframe*/
		function selfOpen(){
			var opts = {
				area: ['900px', '500px'] //宽高
			};
			
			$.webUtil.open('demo/module1/iframe.jsp',opts);
		}
		
		/**2.功能2：自定义打开窗口，右下角显示*/
		function selfOpen2(){
			var opts = {
				type: 1 //0：信息框；1：页面层；2：iframe层；3：加载层；4：tips层
				,maxmin: false //不显示最大化
				,area: ['300px', '150px'] //宽高
				,offset: 'rb' //右下角显示
				,anim: 2 //动态效果
			};
			$.webUtil.open('测试',opts);
		}
		
	</script>			
</body>
</html>