<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/meta.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<base href="<%=path%>">
</head>
<body>
	<div class="row">
		<div class="col-sm-12">
			<button class="btn btn-primary" onclick="window.location.href='index.jsp'">
				<i class="fa fa-reply marginr5">返回</i>
			</button>
		</div>
	</div>
	<form class="cmxform" id="commentForm" method="get" action="">
	  <fieldset>
	    <legend>输入您的名字，邮箱，URL，备注。</legend>
	    <p>
	      <label for="cname">Name (必需, 最小两个字母)</label>
	      <input id="cname" name="name" minlength="2" type="text" required>
	    </p>
	    <p>
	      <label for="cemail">E-Mail (必需)</label>
	      <input id="cemail" type="email" name="email" required>
	    </p>
	    <p>
	      <label for="curl">URL (可选)</label>
	      <input id="curl" type="url" name="url">
	    </p>
	    <p>
	      <label for="ccomment">备注 (必需)</label>
	      <textarea id="ccomment" name="comment" required></textarea>
	    </p>
	    <p>
	      <input class="submit" type="submit" value="Submit">
	    </p>
	  </fieldset>
	</form>
	
	<script>
		$.validator.setDefaults({
		    submitHandler: function() {//验证通过后触发的事件
		      alert("提交事件!");
		    }
		});
		$(function(){
		    $("#commentForm").validate(); 
		});
		</script>
</body>
</html>