<%--
  Created by IntelliJ IDEA.
  User: 大乔儿
  Date: 2018/8/8
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>密码修改成功,即将跳转到登录界面...</h3>

</body>
<script>
    function fn() {
        setTimeout(function () {
            top.location.href="${pageContext.request.contextPath}/user/tologin";
        },1000)
    }
    window.onload=fn;
</script>
</html>
