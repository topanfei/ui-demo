(function($){
	 //引用layui的layui组件
    layui.use(['layer'],function(){
    	var layer = layui.layer;
    	layer.ready(function(){
    		
    		/**自定义的工具类*/
    		$.webUtil = {
    				/**
    			     * 关闭弹出层
    			     * index：弹出层序号
    			     */
    			    closeWindow: function(index){ //关闭弹窗
    				   layer.close(index);
    			    },
    			    /**关闭所有弹窗*/
    			    closeAllWindow:function(){
    			    	layer.closeAll();
    			    },
    			    
    			    /**
    			     * 弹框
    			     * msg：提示信息
    			     * yesCallBack：确定回调函数
    			     * opts：拓展配置信息
    			     */
    				alert: function(msg,opts){
    					var yesFunc= function(index){ //确定按钮回调函数，默认是关闭弹窗
    						$.webUtil.closeWindow(index);
    					}
    					var cancelFunc = function(index){ //右上角关闭按钮触发回调函数
    						$.webUtil.closeWindow(index);
    					}
    					var defaults = {
    						icon: 0 //0：警告；1：成功；2：错误；3：疑问；4：锁定；5：哭脸；6：笑脸；
    						,title: '信息' //标题
    						,shade: [0.1,'#000'] //遮罩层
    						,offset: 'auto' //默认垂直水平居中 't':顶部坐标；'r':右边缘坐标；'b':底部坐标；'l':左边缘坐标；'lt'：左上角；'lb'：左下角；'rt'：右上角；'rb':右下角 ；'100px':指定义垂直坐标，水平居中；['100px','100px']:水平垂直都是100
    						,anim: 0 //0-6的动画形式，-1不开启
    						,shadeClose: false //是否点击遮罩关闭，默认不关闭
    						,yes: yesFunc //确定按钮回调函数
    						,cancel: cancelFunc //右上角关闭按钮触发回调函数
    					};
    				    opts = $.extend(defaults,opts);
    				    layer.alert(msg,opts);
    				},
    				/**
    			     * 确认对话框函数
    			     * msg：提示信息
    			     * yesCallBack：确定的回调函数
    			     * opts：拓展配置
    			     */
    			    confirm: function(msg,yesCallBack,opts){
    				    var defaluts = {
	    					icon: 3 //0：警告；1：成功；2：错误；3：疑问；4：锁定；5：哭脸；6：笑脸；
	    					,title: '信息' //标题
	    					,shade: [0.1,'#000'] //遮罩层
	    					,shadeClose: false //是否点击遮罩关闭，默认不关闭
	    					,btn: ['确定','取消']
    				    	,yes: yesFunc //确定按钮的函数
    				    	,cancel: cancelFunc //取消按钮的函数
    				    };
    				    var yesFunc = function(index){
	    					if(yesCallBack != null){
	    					    yesCallBack()
	    					}
	    					$.webUtil.closeWindow(index);
    				    };
    				    var cancelFunc = function(index){
    				    	$.webUtil.closeWindow(index);
    				    }
    				    opts = $.extend(defaluts,opts);
    				    layer.confirm(msg,opts,yesFunc,cancelFunc);
    			    },
    			    
    			    /**
    			     * 吸附显示信息
    			     * elemObj：吸附目标元素对象
    			     * msg：提示信息
    			     * opts：拓展配置属性
    			     */
    			    tips: function(elemObj,msg,opts){
    				    var defaults = {
    					    tips: [3,'#c00'],
    					    time:3000 //3秒后关闭提示信息
    				    } 
    				    opts = $.extend(defaults,opts);
    				    layer.tips(msg,elemObj,opts);
    			    },
    			    /**
    			     * 提示信息
    			     * msg：提示语信息
    			     * opts：拓展配置属性
    			     */
    			    msg: function(msg,opts){
    				    //层销毁后的回调函数
    				    var endFunc = function(index){
    				    	$.webUtil.closeWindow(index);
    				    };
    				    var defaults = {
	    					//icon:  //0：警告；1：成功；2：错误；3：疑问；4：锁定；5：哭脸；6：笑脸； 
	    					time: false //如果time值设置为false，则层不会关闭，需要手动关闭，所以该方法将遮罩层序号返回。也可以设置毫秒数
	    					,offset: 'auto' //默认垂直水平居中 't':顶部坐标；'r':右边缘坐标；'b':底部坐标；'l':左边缘坐标；'lt'：左上角；'lb'：左下角；'rt'：右上角；'rb':右下角 ；'100px':指定义垂直坐标，水平居中；['100px','100px']:水平垂直都是100
	    					,shade:[0.5,'#393D49'] //遮罩层
	    					,shadeClose: false //是否点击遮罩关闭，默认不关闭
	    					,end: endFunc //层销毁后的回调函数
    				    };
    				    opts = $.extend(defaults,opts);
    				    return top.layer.msg(msg,opts); //这里因为页面是用iframe嵌套着，所以使用top或者parent去调用layer.msg就可以
    			    },
    			   
    			    /**
    			     * 打开窗口页面
    			     * url：打开页面的url地址
    			     * opts：拓展配置信息
    			     */
    			    open: function(url,opts){
    				    var defaults = {
	    					type: 2 //0：信息框；1：页面层；2：iframe层；3：加载层；4：tips层
	    					,title: '信息'
	    					,closeBtn : 1 //默认值为1 。可通过配置1和2来展示，如果不显示，在设置值为0
	    					,content:url //页面地址
	    					,area: [window.screen.width / 2 + 'px', window.screen.height / 2 + 'px'] //宽高
	    					,shade: [0.1,'#000']
	    					,maxmin: true //允许全屏最小化
	    					,offset: 'auto' //默认垂直水平居中 't':顶部坐标；'r':右边缘坐标；'b':底部坐标；'l':左边缘坐标；'lt'：左上角；'lb'：左下角；'rt'：右上角；'rb':右下角 ；'100px':指定义垂直坐标，水平居中；['100px','100px']:水平垂直都是100
	    					,scrollbar:true //默认允许浏览器滚动
	    					,shadeClose:false //设置点击遮罩层不关闭弹窗
	    					,anim: 1 //0-6的动画形式，-1不开启
	    					,success: null //弹出层弹出后的回调函数
    				    }
    				    opts = $.extend(defaults,opts);
    				    layer.open(opts);
    			    },
    			    /**
    			     * ajax请求
    			     * opts：拓展属性配置
    			     * successCallBack
    			     */
    			    ajaxSubmit: function(successCallBack,opts){
    				    var index = "";
    				    var beforeSendFunc = function(){
    						index = $.webUtil.msg(opts.beforeSendText);
    				    }
    				    var successFunc = function(json){
    						if(successCallBack != null){
    						    successCallBack(json);
    						}
    						$.webUtil.closeWindow(index);
    				    }
    				    var errorFunc = function(json){
    						var exceptionText = json.responseText;//异常信息
    						$.webUtil.closeWindow(index);
    						$.webUtil.alert(exceptionText);
    				    }
    				    var defaults = {
    					    type: 'POST'
    					    ,url: ''
    					    ,contentType: 'application/x-www-form-urlencoded'//如果传递的是json对象，则设置application/json;charset=utf-8
    					    ,data: null //参数
    					    ,beforeSend: beforeSendFunc //发送url前的执行，返回false即会取消ajax请求
    					    ,beforeSendText: '正在保存，请稍等...' //发送url前执行的函数的提示语
    					    ,success: successFunc //执行url成功后的回调函数
    					    ,error: errorFunc //执行url错误后的回调函数
    				    };
    				    opts = $.extend(defaults,opts);
    				    $.ajax(opts);
    			    }
    			    
    		};
    		
    		$.fn.iframeSubmit = function(opts){
    			var defaults = {
    				action: ""
    				,msg: '搜索中，请稍等...'
    			};
    			opts = $.extend(defaults,opts);
    			var form = $(this);
    			//显示加载中的遮罩层
 				var index = top.layer.msg(opts.msg,
 					{
 						time: false //如果time值设置为false，则层不会关闭，需要手动关闭，所以该方法将遮罩层序号返回。也可以设置毫秒数
 						,shade:[0.5,'#393D49'] //遮罩层
 						,shadeClose: false //是否点击遮罩关闭，默认不关闭
 					}
 				);
 				var action = $(form).prop("action");
 				console.log("action="+action);
 				action = (action == "" || action ==null) ? opts.action : action;
 				$(form).prop("action",action);
 				$(form).submit();
 				top.layer.close(index);
    		}
    	});
    });
	
	
})(jQuery);