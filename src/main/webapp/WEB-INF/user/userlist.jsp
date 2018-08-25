<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
</head>
<body>


<div class="main">

<div class="optitle clearfix">
<em>
    <c:if test="${sessionUser.isadmin==3}">
		<input value="添加用户" class="input-button" onclick="window.location='${pageContext.request.contextPath }/user/touseradd'" type="button">
    </c:if>
</em>
	<div class="title">用户管理&gt;&gt;</div>
	</div>
    <c:if test="${sessionUser.isadmin==3}">
    <div >
        <table>
            <tbody><tr><td>
                <form id="form1" method="post" action="${pageContext.request.contextPath }/user/userfilter.do" class="form-horizontal">
                    用户级别: <select id="level" name="isadmin"  onchange="serch()"> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <c:if test="${isadmin==1}">
                                        <option value="0" >请选择</option>
                                        <option value="1" selected="selected">读者</option>
                                        <option value="2">图书管理员</option>
                                        <option value="3">系统管理员</option>
                                    </c:if>
                                    <c:if test="${isadmin==2}">
                                        <option value="0" >请选择</option>
                                        <option value="1" >读者</option>
                                        <option value="2" selected="selected">图书管理员</option>
                                        <option value="3">系统管理员</option>
                                    </c:if>
                                    <c:if test="${isadmin==3}">
                                        <option value="0" >请选择</option>
                                        <option value="1">读者</option>
                                        <option value="2">图书管理员</option>
                                        <option value="3" selected="selected">系统管理员</option>
                                    </c:if>
                                    <c:if test="${isadmin!=2 && isadmin!=1 && isadmin!=3}">
                                        <option value="0" >请选择</option>
                                        <option value="1">读者</option>
                                        <option value="2">图书管理员</option>
                                        <option value="3">系统管理员</option>
                                    </c:if>
                            </select>
                            用户名称：<input id="name" value="${username }" name="username" type="text" onchange="serch()">
                            <input id="reset" type="button" class="btn btn-default btn-xs" value="重置" onclick="resets()" >
                </form></td></tr>
            </tbody></table>
    </div>
    </c:if>
	<div class="content">
<table class="list">
  <tbody><tr>
    <td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
    <td width="80"><div class="STYLE1" align="center">用户名称</div></td>
    <td width="100"><div class="STYLE1" align="center">性别</div></td>
    <td width="100"><div class="STYLE1" align="center">年龄</div></td>
    <td width="150"><div class="STYLE1" align="center">电话 </div></td>
    <td width="150"><div class="STYLE1" align="center">地址 </div></td>
    <td width="150"><div class="STYLE1" align="center">级别 </div></td>
    <td width="150"><div class="STYLE1" align="center">操作</div></td>
  </tr>
  <c:forEach items="${userlist}" var="userinfo">
  <tr>
    <td height="23"><span class="STYLE1">${userinfo.id }</span></td>
    <td><span class="STYLE1"><a style="text-decoration: none" href="${pageContext.request.contextPath }/user/userinfo.do?id=${userinfo.id}">${userinfo.username }</a></span></td>
    <c:if test="${userinfo.sex==1}">
   		 <td><span class="STYLE1">男</span></td>
    </c:if>
     <c:if test="${userinfo.sex==2}">
   		 <td><span class="STYLE1">女</span></td>
    </c:if>
    <td><span class="STYLE1">${userinfo.age }</span></td>
    <td><span class="STYLE1">${userinfo.phone }</span></td>
    <td><span class="STYLE1">${userinfo.address }</span></td>
	    <c:if test="${userinfo.isadmin==1 }">
	    	<td><span class="STYLE1">读者 </span></td>
	    </c:if>
	    <c:if test="${userinfo.isadmin==2 }">
	    	<td><span class="STYLE1">图书管理员 </span></td>
	    </c:if>
      <c:if test="${userinfo.isadmin==3 }">
          <td><span class="STYLE1">系统管理员 </span></td>
      </c:if>
    <td>
    	<c:if test="${sessionUser.id == userinfo.id }">
    		<span style="color:gray;" class="STYLE1">删除</span>
    	</c:if>
    	<c:if test="${sessionUser.id!=userinfo.id }">
    		<a id="del" style="text-decoration: none;" href="#" onclick="del(${userinfo.id})"><span class="STYLE1">删除</span></a>
    	</c:if>
    </td>
  </tr>
  </c:forEach>
</tbody></table>
</div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	function del(id){
		var flg = confirm("确认删除?");
		if(flg){
			window.location.href="${pageContext.request.contextPath }/user/userdel.do?id="+id;
		}
	}

	function serch(){
       document.getElementById("form1").submit();
    }

    function resets() {
        $("#name").val("");
        $("#level").val("0");
        serch();
    }
</script>
</html>









