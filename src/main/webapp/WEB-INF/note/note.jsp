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
<h3>密码修改成功</h3>

</body>
<script>
    function fn() {
        setTimeout(function () {
            window.location.href="${pageContext.request.contextPath}/user/userinfo.do?id="+${userid};
        },1000)
    }
    window.onload=fn;
</script>
</html>
