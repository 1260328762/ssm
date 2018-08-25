<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超市账单管理系统</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<frameset rows="100,*" cols="*" frameborder="no" border="0" framespacing="0">
	<frame src="${pageContext.request.contextPath}/user/totop" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
	<frameset cols="200,*" frameborder="no" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/user/toleft" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" />
		<frame src="${pageContext.request.contextPath}/user/towel" name="mainFrame" id="mainFrame" />
	</frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>