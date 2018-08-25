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
			<div class="title">用户注册&gt;&gt;</div>

		</div>
		<form id="form1"  method="post" action="${pageContext.request.contextPath }/user/useradd.do">
			<div class="content">
				<table class="box">
					<tr>
						<td class="field">用户名称：</td>
						<td><input type="text" name="username" class="text" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">用户密码：</td>

						<td><input type="password" name="password" class="text" id="pw" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input type="password" name="password1" class="text" />
							<font color="red">*</font></td>
					</tr>

					<tr>
						<td class="field">用户性别：</td>
						<td><select name="sex" id="select">
								<option value="1">男</option>
								<option value="2">女</option>
						</select></td>
					</tr>

					<tr>
						<td class="field">用户年龄：</td>
						<td><input type="text" name="age" class="text" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><input type="text" name="phone" class="text" /> <font color="red">*</font></td>

					</tr>
					<tr>
						<td class="field">用户地址：</td>
						<td><textarea name="address" id="textarea" class="text"
								cols="45" rows="5"></textarea></td>
					</tr>
					<tr>
						<td class="field">用户权限：</td>
							<td>
								<input type="radio" name="isadmin"  value="1" checked="checked" />读者
								<input type="radio" name="isadmin" value="2" />图书管理员
								<input type="radio" name="isadmin" value="3" />系统管理员
						</td>
					</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="submit" value="数据提交" class="input-button" /> 
				<input type="button" onclick="window.location='${pageContext.request.contextPath }/user/userlist.do';" value="返回" class="input-button" />
			</div>

		</form>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	//对用户输入的信息进行前端验证
	$(function(){
		//获取form表单中的内容
		$("#form1").validate({
			//验证规则
			rules:{
				"username" : {required : true,remote : "${pageContext.request.contextPath }/user/usercheck.do"},
				"password" : {required : true},
				"password1" : {equalTo : "#pw"},
				"age" : {digits : true,range : [0,150],required : true},
				"phone" : {digits : true ,maxlength : 11,required : true}
			},
			messages : {
				"username" : {required : "用户名不能为空",remote : "用户名已存在"},
				"password" : {required : "密码不能为空"},
				"password1" : "两次密码不一致",
				"age" : {digits : "必须输入整数",range : "年龄越界",required : "年龄不能为空"},
				"phone" : {digits : "必须输入整数",manxlength : "非法手机号",required : "手机号不能为空" }
			}
		});
	});
</script>
</html>















