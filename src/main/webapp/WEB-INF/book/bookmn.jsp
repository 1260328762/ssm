<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">图书管理&gt;&gt;</div>
		</div>
        <form action="#" id="form2" method="post">
            <input type="hidden" name="author" value="${author}">
            <input type="hidden" value="${bname}" name="bname">
            <input type="hidden" value="${category}" name="category">
            <input type="hidden" value="${status}" name="status">
            <input type="hidden" value="${page.pageIndex}" name="pageIndex">
        </form>
		<form id="form1" method="post" action="${pageContext.request.contextPath}/book/modifybook.do">
            <input type="hidden" name="bid" value="${bookinfo.bid}">
            <input type="hidden" name="author1" value="${author}">
            <input type="hidden" value="${bname}" name="bname1">
            <input type="hidden" value="${category}" name="category1">
            <input type="hidden" value="${status}" name="status1">
            <input type="hidden" value="${page.pageIndex}" name="pageIndex1">
			<div class="content">
				<table class="box">
					<tr>
						<td class="field">编号：</td>
						<td>
                            <input value="${bookinfo.bid }" type="text" id="textfield" class="text" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td class="field">书名：</td>
						<td><input id="bname" value="${bookinfo.bname}" type="text" name="bname" class="text txt"
							id="textfield2" disabled="disabled"/> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">作者：</td>
						<td><input id="au" value="${bookinfo.author}" type="text" name="author" class="text txt" disabled="disabled" />
						<font color="red">*</font></td>
					</tr>
                    <tr>
						<td class="field">分类：</td>
						<td><input value="${bookinfo.category}" type="text" name="category" class="text txt" disabled="disabled" />
						<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">出版社：</td>
						<td>
                        <select type="text" name="pid" class="text txt" disabled="disabled">
                            <c:forEach items="${publisherlist}" var="pinfo">
                                <c:if test="${bookinfo.pid==pinfo.pid}">
                                    <option value="${pinfo.pid}" selected="selected">${pinfo.pname}</option>
                                </c:if>
                                <c:if test="${bookinfo.pid!=pinfo.pid}">
                                    <option value="${pinfo.pid}">${pinfo.pname}</option>
                                </c:if>
                            </c:forEach>
                        </select>
						<font color="red">*</font></td>
					</tr>
                    <tr>
						<td class="field">状态：</td>
						<td>
                            <select type="text" name="status" class="text txt" disabled="disabled" >
                                <c:if test="${bookinfo.status==0}">
                                    <option value="0" selected="selected">已入库</option>
                                    <option value="1" >已借出</option>
                                </c:if>
                                <c:if test="${bookinfo.status==1}">
                                    <option value="0" >已入库</option>
                                    <option value="1" selected="selected">已借出</option>
                                </c:if>
                            </select>
						<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">页数：</td>
						<td><input value="${bookinfo.pagecount}" type="text" name="pagecount" class="text txt" disabled="disabled" />
						<font color="red">*</font></td>
					</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="button" id="back" value="返回列表" onclick="backToList()" class="input-button" />
				<input type="button" id="modi" value="修改" class="input-button" />
				<input type="button" value="删除" onclick="del(${bookinfo.bid})" class="input-button" />
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
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
				"bname": {required:true,remote:{
				    url:"${pageContext.request.contextPath}/book/checkname.do",
                    type:"post",
                    data: {"bid":${bookinfo.bid}}
                    }},
				"auther" : {required : true},
				"publish" : {required : true},
                "category":{required :true},
				"pagecount" : {required : true}
			}
		})
	});

	function backToList() {
        var c = $("#form2").serialize();
        location.href="${pageContext.request.contextPath}/book/bookfilter.do?"+c;
    }

	function del(id){
		var flg = confirm("确认删除?");
		if(flg){
			window.location.href="${pageContext.request.contextPath}/book/bookdel.do?ibd="+id;
		}
	}
</script>
</html>












