<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="frame-bd">
<ul class="left-menu">
	<li><a href="${pageContext.request.contextPath}/book/bookfilter.do" target="mainFrame"><img src="${pageContext.request.contextPath}/img/btn_bill.gif" /></a></li>
	<c:if test="${sessionUser.isadmin==0}">
	<li><a href="providerlist.do" target="mainFrame"><img src="${pageContext.request.contextPath}/img/btn_suppliers.gif" /></a></li>
	</c:if>
	<li><a href="${pageContext.request.contextPath}/user/userlist.do" target="mainFrame"><img src="${pageContext.request.contextPath}/img/btn_users.gif" /></a></li>
	<li><a href="${pageContext.request.contextPath}/system/loglist.do" target="mainFrame"><img src="${pageContext.request.contextPath}/img/sysinfo.gif" /></a></li>
	<li><a href="#" id="exit"><img src="${pageContext.request.contextPath}/img/btn_exit.gif" /></a></li>
</ul>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		
	<script type="text/javascript">
	
		$(function(){
			
			$("#exit").on("click",function(){
				
				if(confirm("确认退出吗？")){
					
					//退出登录parent|top
					top.window.location.href="${pageContext.request.contextPath}/user/logout.do";
				}
			});
		});
	</script>
</body>
</html>