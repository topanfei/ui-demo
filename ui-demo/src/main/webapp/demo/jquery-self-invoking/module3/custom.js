var maskIndex;//遮罩层序号值
(function($){
    $.myWebUtil = {
	    /**
	     * 弹框
	     * msg：提示信息
	     * yesCallBack：确定回调函数
	     * opts：拓展配置信息
	     */
	    alert: function(msg,yesCallBack,opts){
		    var yesFunc= function(index){ //确定按钮回调函数，默认是关闭弹窗
			if(yesCallBack != null){
			    yesCallBack();
			}
			$.myWebUtil.closeWindow(index);
		    }
		    var cancelFunc = function(index){ //右上角关闭按钮触发回调函数
			$.myWebUtil.closeWindow(index);
		    }
		    var defaults = {
			icon: 0 //0：警告；1：成功；2：错误；3：疑问；4：锁定；5：哭脸；6：笑脸；
			,title: '信息' //标题
			,shade: [0.1,'#000'] //遮罩层
			,shadeClose: true //是否点击遮罩关闭，默认是
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
			,shadeClose: true //是否点击遮罩关闭，默认是
			,btn: ['确定','取消']
		    	,yes: yesFunc
		    	,cancel: cancelFunc
		    };
		    var btn1Func = function(index){
			if(yesCallBack != null){
			    yesCallBack()
			}
			$.myWebUtil.closeWindow(index);
		    };
		    var cancelFunc = function(index){
			$.myWebUtil.closeWindow(index);
		    }
		    opts = $.extend(defaluts,opts);
		    layer.confirm(msg,opts,btn1Func,cancelFunc);
	    },
	    /**
	     * 打开窗口页面
	     * url：打开页面的url地址
	     * opts：拓展配置信息
	     */
	    open: function(url,opts){
		    var defaults ={
			type: 2 //0：信息框；1：页面层；2：iframe层；3：加载层；4：tips层
			,title: '信息'
			,content:url //页面地址
			,area: [window.screen.width / 2 + 'px', window.screen.height / 2 + 'px'] //宽高
			,shade: [0.1,'#000']
			,maxmin: true
			,scrollbar:false //屏蔽滚动条
			,shadeClose:false //设置点击遮罩层不关闭弹窗
			,success: null //弹出层弹出后的回调函数
		    }
		    opts = $.extend(defaults,opts);
		    layer.open(opts);
	    }, 
	    /**
	     * 关闭弹出层
	     * index：弹出层序号
	     */
	    closeWindow: function(index){ //关闭弹窗
		   layer.close(index);
	    },
	    /**
	     * 提示信息
	     * msg：提示语信息
	     * opts：拓展配置属性
	     */
	    msg: function(msg,opts){
		    //层销毁后的回调函数
		    var endFunc = function(index){
			$.myWebUtil.closeWindow(index);
		    };
		    var defaults = {
			icon: 6 //0：警告；1：成功；2：错误；3：疑问；4：锁定；5：哭脸；6：笑脸； 
			,time: false //如果time值设置为false，则层不会关闭，需要手动关闭，所以该方法将遮罩层序号返回。也可以设置毫秒数
			,shade: [0.1,'#000'] //遮罩层
			,shadeClose: true //是否点击遮罩关闭，默认是
			,end: endFunc //层销毁后的回调函数
		    };
		    opts = $.extend(defaults,opts);
		    return layer.msg(msg,opts);
	    },
	    /**
	     * 吸附显示信息
	     * msg：提示信息
	     * elemObj：吸附目标元素对象
	     * opts：拓展配置属性
	     */
	    tips: function(msg,elemObj,opts){
		    var defaults = {
			    tips: [3,'#c00'],
			    time:3000 //3秒后关闭提示信息
		    } 
		    opts = $.extend(defaults,opts);
		    layer.tips(msg,elemObj,opts);
	    },
	    /**
	     * ajax请求
	     * opts：拓展属性配置
	     * successCallBack
	     */
	    ajaxSubmit: function(opts,successCallBack,errorCallBack){
		    var index = "";
		    var beforeSendFunc = function(){
				index = $.myWebUtil.msg(opts.beforeSendText);
		    }
		    var successFunc = function(json){
				if(successCallBack != null){
				    successCallBack(json);
				}
				$.myWebUtil.closeWindow(index);
		    }
		    var errorFunc = function(json){
				var exceptionText = json.responseText;//异常信息
				$.myWebUtil.closeWindow(index);
				$.myWebUtil.alert(exceptionText);
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
	    },
	    /**
	     * 上传文件
	     */
	    uploadFile: function(url,opts){
		    var defaults = {
			elem: '' //容器选择器，也可以是DOM对象
			,accept: 'file' //images：图片；file：所有文件；video：视频；audio：音频
			,exts: '' //允许上传的文件后缀，如 jpg|png|gif
			,size: 4096//最大支持4M。设置最大可允许的大小，单位为kb
			,multiple: false //是否允许多文件上传，默认不允许多文件上传
			,number: 0 //设置同时上传的数量，一般配合multiple参数出现
			,url: url //服务端上传接口
			,data:null //传递的参数
			,before: null //文件提交上传前的回调函数
			,done: null //执行上传请求成功的回调函数
			,error: null //执行上传请求异常的回调函数
		    };
		    
		    opts = $.extend(defaults,opts);
		    layui.use(['upload'],function(){
			var upload = layui.upload;
			var uploadInst = upload.render(opts);
		    });
	    }
	    
	    /*submit: function(opts){
		     var submitCheckFunc = function(){
			 return false;
		     }
		     var defaults = {
			 isCheck: true
			 ,formObj: null
			 ,url: ''
			 ,submitCheck: submitCheckFunc
		     };
		     opts = $.extend(defaults,opts);
		     var form = (opts.formObj == null) ? $("[name='form']") : opts.formObj;
		     if(opts.isCheck){
			 if(defaults.submitCheck){
			     form.prop("action", opts.url);
			     form.submit();
			 }else{
			     console.log("表单验证未通过!");
		     }
		     }else{//不需校验
			 form.prop("action", opts.url);
		 	 form.submit();
		     }
	    }*/
    };
    
    
    $.fn.formValidate = function(){
	var isValid = true;
	var formObj = $(this);//获取form对象
	//获取页面表单的元素
	var a = formObj.find(":text");//所有的文本框
	var b = formObj.find(":password");//所有的密码框
	var c = formObj.find(":radio");//所有的单选框
	var d = formObj.find(":checkbox");//所有的复选框
	var e = formObj.find(":select");//所有的下拉列表
	var f = formObj.find(":textarea");//所有的文本域
	var g = formObj.find(":file");//所有的文件域
	var h = $.merge(a,b);
	h = $.merge(h,c);
	h = $.merge(h,d);
	h = $.merge(h,e);
	h = $.merge(h,f);
	h = $.merge(h,g);
	//循环所有的表单元素
	$.each(h,function(){
	    var elem= $(this);
	});
    }
})(jQuery);


//实例方法
/*(function($){
    $.webValidator = {
	opName : "validate_option",
        defaults : {
        	empty : true//默认可以为空
		,min : 0//长度最小0
		,max : 999999//长度最大999999
		,onErrMsg:''//异常提示信息
		,onShowMsg : ""//显示信息
		,ischeck : true//校验
       },
       
    };
    
 
})(jQuery);*/

