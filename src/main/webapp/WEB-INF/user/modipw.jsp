<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<form id="form1"  method="post" action="${pageContext.request.contextPath}/user/modifyPw.do">
			<input type="hidden" name="id" value="${userid }" id="id"/>
			<div class="content">
				<table class="box">
					<tr>
						<td class="field">旧密码：</td>
						<td><input type="password" name="opassword" class="text" id="opw" />
							<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">新密码：</td>
						<td><input type="password" name="password" class="text" id="npw"/>
							<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input type="password" name="password1" class="text" id="rpw" />
							<font color="red">*</font></td>
					</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="submit" value="数据提交" class="input-button" /> 
				<input type="button" onclick="window.location.href='userinfo.do?id=${userid}'" value="返回" class="input-button" />
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#form1").validate({
			rules:{
				"opassword" : {remote : "${pageContext.request.contextPath}/user/checkPw.do?id=${userid}"},
				"password" : {required : true},
				"password1" : {equalTo : "#npw"}
			},
			messages:{
				"opassword":{remote:"旧密码不正确"},
				"password":{required:"密码不能为空"},
				"password1":"两次输密码不一致"
			}
		})
	})
</script>
</html>


