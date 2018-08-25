<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
<style>
.page{
	border-radius:5px;
	background-color:#a096f34f;
	border:0;
}

</style>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">日志管理&gt;&gt;</div>
	</div>
	<form id="form1" action="${pageContext.request.contextPath}">

	</form>
	<form id="form2" action="${pageContext.request.contextPath}/book/bookdel.do?$('#form1').serialize()" method="post">
	<div class="content" style="width: 1000px">
		<table class="list">
			<tr>
				<td>编号</td>
				<td>日志内容</td>
				<td>操作ip</td>
				<td>浏览器</td>
				<td>日志时间</td>
			</tr>
			<c:forEach items="${loglist }" var="log">
				<tr>
					<td>${log.logId}</td>
					<td>${log.logContent}</td>
					<td>${log.ip}</td>
					<td>${log.browser }</td>
					<td>${log.logtime}</td>
				</tr>
			</c:forEach>
		</table>
		<div style="text-align: center">
			<input class="page" type="button" onclick="fpage()" value="首页">
			<input class="page" type="button" onclick="prePage()" value="上一页">
			<c:forEach begin="${page.start}" end="${page.end}" varStatus="v">
				<a href="javascript:skip(${v.index})">${v.index}</a>
			</c:forEach>
			<input class="page" type="button" onclick="nextPage()"  value="下一页">
			<input class="page" type="button" onclick="endPage()" value="尾页">
			<input id="pageindex" class="page" type="text" size="1px">
			<input id="x1" class="page" type="button"  value="跳转">
			<input id = "max" type="hidden" value="${page.pageCount }"><span>当前第[${page.pageIndex }]页,共[${page.pageCount }]页</span>
		</div>
	</div>
	</form>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#x1").click(function(){
			var pageIndex = $("#pageindex").val();
			if(pageIndex == null || pageIndex == ""){
				alert("请输入页码");
				return ;
			}
			
			if(pageIndex <=0){
				pageIndex = 1;
			}
			
			if(pageIndex >= $("#max").val()){
				pageIndex = $("#max").val();
			}
			window.location.href = "${pageContext.request.contextPath}/system/loglist.do?pageIndex="+pageIndex;
		})

	});

	function find(){
		document.getElementById("form1").submit();
	}

	function fpage(){
        window.location.href='${pageContext.request.contextPath}/system/loglist.do?pageIndex=1';
	}

	function prePage() {
	    window.location.href='${pageContext.request.contextPath}/system/loglist.do?pageIndex=${page.prePage}';
    }

    function nextPage(){
        window.location.href="${pageContext.request.contextPath}/system/loglist.do?pageIndex=${page.nextPage}";
	}

	function endPage(){
        window.location.href='${pageContext.request.contextPath}/system/loglist.do?pageIndex=${page.pageCount}';
	}

	function resets() {
		$("#bn").val("");
        $("#au").val("");
        $("#ca").val("");
        $("#st").val("-1");
		find();
    }

    function getForm() {
		return $("#form1").serialize();
    }
    
    function skip(index) {
        window.location.href="${pageContext.request.contextPath}/system/loglist.do?pageIndex="+index+"&"+getForm();
    }

</script>
</html>








