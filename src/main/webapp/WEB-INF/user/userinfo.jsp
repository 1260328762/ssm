<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<form id="form1" method="post" action="${pageContext.request.contextPath }/user/usermodify.do">
			<input type="hidden" name="id" value="${userinfo.id}"/>
			<div class="content">
				<table class="box">
					<tr>
						<td class="field">用户编号：</td>
						<td><input value="${userinfo.id }" type="text" name="userId" id="textfield" class="text" disabled="disabled"/> 
						<font color="red">*</font></td>

					</tr>
					<tr>
						<td class="field">用户名称：</td>
						<td><input value="${userinfo.username}" type="text" name="username" class="text"
							id="textfield2" disabled="disabled"/> <font color="red">*</font></td>
					</tr>

					<tr>
						<td class="field txt">用户性别：</td>
						<td><select disabled="disabled" class="txt" name="sex" id="select">
							<c:if test="${userinfo.sex==1}">
									<option value="1" selected="selected">男</option>
									<option value="2">女</option>
							</c:if>
							<c:if test="${userinfo.sex==2}">
									<option value="1">男</option>
									<option value="2" selected="selected">女</option>
							</c:if>
						</select></td>
					</tr>
					<tr>
						<td class="field">用户年龄：</td>
						<td><input value="${userinfo.age}" type="text" name="age" class="text txt" disabled="disabled" /> 
						<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><input value="${userinfo.phone }" type="text" name="phone" class="text txt" disabled="disabled" /> 
						<font color="red">*</font></td>

					</tr>
					<tr>
						<td class="field">用户地址：</td>
						<td><textarea name="address" id="textarea" class="text txt"
								cols="45" rows="5" disabled="disabled">${userinfo.address }</textarea></td>
					</tr>
					<tr>
						<td class="field">用户权限：</td>
						<td>
							<c:if test="${userinfo.isadmin==1 }">
								<input type="radio"  disabled="disabled" name="isadmin"  value="1" checked="checked" />读者
								<input type="radio"  disabled="disabled" name="isadmin"  value="2" />图书管理员
								<input type="radio"  disabled="disabled" name="isadmin"  value="3" />系统管理员
							</c:if>
							<c:if test="${userinfo.isadmin==2 }">
								<input type="radio"  disabled="disabled" name="isadmin"  value="1" />读者
								<input type="radio"  disabled="disabled" name="isadmin"  value="2" checked="checked" />图书管理员
								<input type="radio"  disabled="disabled" name="isadmin"  value="3" />系统管理员
							</c:if>
							<c:if test="${userinfo.isadmin==3 }">
								<input type="radio" class="txt" disabled="disabled" name="isadmin"  value="1" />读者
								<input type="radio" class="txt" disabled="disabled" name="isadmin"  value="2" />图书管理员
								<input type="radio" class="txt" disabled="disabled" name="isadmin"  value="3" checked="checked"/>系统管理员
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="button" id="back" value="返回" onclick="window.location.href='${pageContext.request.contextPath}/user/userlist.do'" class="input-button" />
				<input type="button" id="modi" value="修改" class="input-button" />
				<input type="button" id="del" value="删除" class="input-button" onclick="deluser(${userinfo.id})"/>
			    <input type="button" onclick="modifyPw(${userinfo.id})" value = "修改密码" class="input-button" />
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#modi").on("click",function(){
			$(".txt").each(function(){
				$(this).removeAttr("disabled");

			});
			$(this).remove();
			$("#back").after("<input type='submit' value='提交' class='input-button' />");
		});


		$("#form1").validate({
			rules:{
				"age" : {digits : true,range : [0,150],required : true},
				"phone" : {digits : true ,maxlength : 11,required : true}
			},
			
			messages : {
				"age" : {digits : "必须输入整数",range : "年龄越界",required : "年龄不能为空"},
				"phone" : {digits : "必须输入整数",manxlength : "非法手机号",required : "手机号不能为空" }
			}
		})
	})
</script>
<script type="application/javascript">
	function deluser(id){
        var flg = confirm("确定删除?");
        if(flg){
            window.location.href="${pageContext.request.contextPath}/user/userdel.do?id="+id;
        }
	}

	function modifyPw(id){
	    window.location.href="${pageContext.request.contextPath}/user/tomodifyuser?id="+id;
	}
</script>
</html>










