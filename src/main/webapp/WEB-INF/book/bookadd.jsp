<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">图书管理&gt;&gt;</div>
	</div>
	<form id="form1" method="post" action="${pageContext.request.contextPath}/book/bookadd.do">
		<div class="content">
		<font color="red"></font>
			<table class="box">

			<tbody><tr>
					<td class="field">书名：</td>
					<td><input name="bname" class="text" type="text"> <font color="red">*</font></td>
				</tr>
				<tr>
					<td class="field">作者：</td>
					<td><input name="author" value="" class="text" type="text"> <font color="red">*</font></td>

				</tr>
				<tr>
					<td class="field">类型：</td>
					<td><input name="category" class="text" type="text"> <font color="red">*</font></td>
				</tr>
				<tr>
					<td class="field">页数：</td>
					<td><input name="pagecount" class="text" type="text"> <font color="red">*</font></td>
				</tr>
				<tr>
					<td class="field">出版社：</td>
					<td>
						<select name="pid">
							<c:forEach items="${publisherlist}" var="pinfo">
								<option value="${pinfo.pid}">${pinfo.pname}</option>
							</c:forEach>
						</select><font color="red">*</font>
					</td>
				</tr>
			</tbody></table>
		</div>

		<div class="buttons">
			<input value="提交" class="input-button" type="submit"> 
			<input onclick="back()" value="返回" class="input-button" type="button">
		</div>
	</form>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$("#form1").validate({
		rules : {
			"bname" : {required : true,remote : "checkbookname.do"},
			"auther" : {required : true},
			"pagecount":{required:true,digits:true},
			"category":{required :true}
		},
		messages : {
			"bname" : {remote : "书名重复"},
		}
	})

	function back(){
		location.href="${pageContext.request.contextPath}/book/bookfilter.do?author=${author}&bname=${bname}&status=${status}&pageIndex=${page.pageIndex}&category=${category}";
	}
</script>
</html>


























