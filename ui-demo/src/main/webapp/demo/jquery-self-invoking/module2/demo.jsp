<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery自定义方法</title>
<base href="<%=path%>">
</head>
<body class="no-skin">
	<div class="main-container ace-save-state" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<h4 class="header smaller lighter blue">jQuery的 $、$.extend、$.fn、$.fn.extend自定义方法使用</h4>
					<!-- 案例1开始 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">示例1：通过 $ 方式定义test方法</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
<!-- 代码 -->										 
<pre>
	(function($){
		    $.test = function(a,b){
				return a+b;
		    }
		    
		    $("#demo1").html($.test(2,4));
	})(jQuery);
</pre>
									
										运行结果：<span id="demo1"></span>
									</div>
								</div>
							</div>
						</div>
					</div><!-- 案例1结束 -->
					
					<!-- 案例2开始 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">示例2：通过 $.extend 方式定义test方法</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
<!-- 代码 -->										 
<pre>
	(function($){
		    $.extend.test = function(a,b){
				return a+b;
		    }
		    $("#demo2").html($.test(2,4));
	})(jQuery);
</pre>
									
										运行结果：<span id="demo2"></span>
									</div>
								</div>
							</div>
						</div>
					</div><!-- 案例2结束 -->
					
					<!-- 案例3开始 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">示例3：通过 $.extend 方式定义test方法</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
<!-- 代码 -->										 
<pre>
	(function($){
		    $.extend({
				test:function(a,b){
				    return a+b;
				}
		    });
		    $("#demo3").html($.test(2,4));
	})(jQuery);
</pre>
									
										运行结果：<span id="demo3"></span>
									</div>
								</div>
							</div>
						</div>
					</div><!-- 案例3结束 -->
					
					<!-- 案例4开始 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">示例4：通过 $.fn 方式定义test方法</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										姓名：<input type="text" id="name" value="张三">
<!-- 代码 -->										 
<pre>
	(function($){
		    $.fn.test = function(){
				var value = $(this).val();
				return value;
		    }
		   $("#demo4").html( $("#name").test());
	})(jQuery);
</pre>
									
										运行结果：<span id="demo4"></span>
									</div>
								</div>
							</div>
						</div>
					</div><!-- 案例4结束 -->
					
					<!-- 案例5开始 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">示例5：通过 $.fn.extend 方式定义test方法</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										姓名：<input type="text" id="name2" value="张三">
<!-- 代码 -->										 
<pre>
	(function($){
		    $.fn.extend.test = function(){
				var value = $("#name2").val();
				return value;
		    }
		    
		    $("#demo5").html( $("#name2").test());
	})(jQuery);
</pre>
									
										运行结果：<span id="demo5"></span>
									</div>
								</div>
							</div>
						</div>
					</div><!-- 案例5结束 -->
					
					<!-- 案例6开始 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">示例6：通过 $.fn.extend 方式定义test方法</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main padding-8">
										姓名：<input type="text" id="name3" value="张三">
<!-- 代码 -->										 
<pre>
	(function($){
		    $.fn.extend({
			   test:function(){
			       var value = $("#name3").val();
					return value;
			   } 
			    
			});
		    $("#demo6").html( $("#name3").test());
		})(jQuery);
</pre>
									
										运行结果：<span id="demo6"></span>
									</div>
								</div>
							</div>
						</div>
					</div><!-- 案例6结束 -->
					<!-- 总结 -->
					<div class="well well-lg">
						<h4 class="blue">总结：</h4>
						<ul>
							<li>参考博客：https://www.cnblogs.com/sharpest/p/6271039.html 和 https://www.cnblogs.com/xuxiuyu/p/5989743.html</li>
							<li>（1）示例1、示例2、示例3中定义test方法，该方法就相当于java中的静态方法，需要使用$ 直接调用。如：$.test(2,4);</li>
							<li>（2）示例1、示例2、示例3中不同点是：方法声明方式不同；调用方式完全一致</li>
							<li>（3）示例4、示例5、示例6中定义test方法，该方法就相当于java中的实例方法，需要使用具体的对象调用，如 $("#demo").test();</li>
							<li>（4）示例4、示例5、示例6中不同点是：方法声明方式不同，调用方式完全一致</li>
							<li>（5）jQuery.extend(): Merge the contents of two or more objects together into the first object.(把两个或者更多的对象合并到第一个当中)；</li>
							<li>（6）jQuery.fn.extend():Merge the contents of an object onto the jQuery prototype to provide new jQuery instance methods.(把对象挂载到jQuery的prototype属性，来扩展一个新的jQuery实例方法)</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<script type="text/javascript">
		/**案例1：使用$ 方式定义test方法，该方法可以理解为java中的静态方法一样，通过使用 $可 直接调用方法。如  $.test(2,4); */
		(function($){
		    $.test = function(a,b){
				return a+b;
		    }
		    
		    $("#demo1").html($.test(2,4));
		})(jQuery);
		
		/**案例2：使用$.extend方式定义test方法，该方法可以理解为java中的静态方法一样，可以使用 $ 直接调用。如  $.test(2,4);*/
		(function($){
		    $.extend.test = function(a,b){
				return a+b;
		    }
		    $("#demo2").html($.test(2,4));
		})(jQuery);
	
		/**案例3：使用$.extend 方式定义test方法，该方式可以理解为java中的静态方法一样，可以使用 $ 直接调用。如  $.test(2,4);*/
		(function($){
		    $.extend({
				test:function(a,b){
				    return a+b;
				}
		    });
		    $("#demo3").html($.test(2,4));
		})(jQuery);
		
		/**案例4：使用 $.fn 方式定义test方法，该方式可以理解为java中的实例方法一样，必须通过某个实例对象调用，如：$("#name").test();*/
		(function($){
		    $.fn.test = function(){
				var value = $("#name").val();
				return value;
		    }
		    $("#demo4").html( $("#name").test());
		})(jQuery);
		
		/**案例5：使用 $.fn.extend 方式定义test方法，该方式可以理解为java中的实例方法一样，必须通过某个实例对象调用，如：$("#name").test();*/
		(function($){
		    $.fn.extend.test = function(){
				var value = $("#name2").val();
				return value;
		    }
		    
		    $("#demo5").html( $("#name2").test());
		})(jQuery);
			
		/**案例6：使用 $.fn.extend 方式定义test方法，该方式可以理解为java中的实例方法一样，必须通过某个实例对象调用，如：$("#name").test();*/
		(function($){
		    $.fn.extend({
			   test:function(){
			       var value = $("#name3").val();
					return value;
			   } 
			    
			});
		    $("#demo6").html( $("#name3").test());
		})(jQuery);
		
	</script>		
</body>
</html>