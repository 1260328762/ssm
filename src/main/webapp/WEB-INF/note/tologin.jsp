<%--
  Created by IntelliJ IDEA.
  User: 大乔儿
  Date: 2018/8/9
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
<script type="application/javascript">

    function fn() {
        setTimeout(function () {
            top.location.href="${pageContext.request.contextPath}/user/tologin";
        })
    }
    onload=fn;
</script>
</html>
