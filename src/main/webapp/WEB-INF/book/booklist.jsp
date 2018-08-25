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
		<em><input type="button" value="添加图书" class="input-button" onclick="tobookAdd()" /></em>
		<div class="title">图书管理&gt;&gt;</div>
	</div>
	<form id="form1" action="${pageContext.request.contextPath}/book/bookfilter.do">
		书名:<input type="text" onchange="find()" value="${bname}" id="bn" name="bname"> 作者:<input type="text" value="${author}" onchange="find()" id="au" name="author" size="8">
		分类:<input type="text" value="${category}" onchange="find()" id="ca" name="category" size="8">
		状态:
		<select name="status" id="st" onchange="find()">
			<c:if test="${status==0}">
				<option value="-1">请选择</option>
				<option value="0" selected="selected">已入库</option>
				<option value="1">已借出</option>
			</c:if>
			<c:if test="${status==1}">
				<option value="-1">请选择</option>
				<option value="0">已入库</option>
				<option value="1" selected="selected">已借出</option>
			</c:if>
			<c:if test="${status==-1}">
				<option value="-1" selected="selected" >请选择</option>
				<option value="0">已入库</option>
				<option value="1" >已借出</option>
			</c:if>
			<c:if test="${status==null}">
				<option value="-1" selected="selected" >请选择</option>
				<option value="0">已入库</option>
				<option value="1" >已借出</option>
			</c:if>
		</select>
		<input id="reset" type="button" class="btn btn-default btn-xs" value="重置" onclick="resets()"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:batchDel()">批量删除</a>
	</form>
	<form id="form2" action="${pageContext.request.contextPath}/book/bookdel.do?$('#form1').serialize()" method="post">
		<input type="hidden" name="pageIndex" value="${page.pageIndex}">
		<input type="hidden" name="bname" value="${bname}">
		<input type="hidden" name="author" value="${author}">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="status" value="${status}">
	<div class="content">
		<table class="list">
			<tr>
				<td><input id="all" onclick="checkAll()" type="checkbox"></td>
				<td>编号</td>
				<td>书名</td>
				<td>作者</td>
				<td>分类</td>
				<td>出版商</td>
				<td>状态</td>
				<td>页数</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${booklist }" var="book">
				<tr>
					<td><input type="checkbox" name="bids" value="${book.bid}"></td>
					<td>${book.bid}</td>
					<td><a href="javascript:bookinfo(${book.bid })">${book.bname }</a></td>
					<td>${book.author }</td>
					<td>${book.category}</td>
					<td>${book.publisher.pname }</td>
					<c:if test="${book.status==0}">
						<td>已入库</td>
					</c:if>
					<c:if test="${book.status==1}">
						<td>已借出</td>
					</c:if>
					<td>${book.pagecount}</td>
					<td><a onclick="del(${book.bid})">删除</a></td>
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
			window.location.href = "bookfilter.do?pageIndex="+pageIndex+"&"+getForm();
		})

	});

	function find(){
		document.getElementById("form1").submit();
	}

	function fpage(){
        window.location.href='${pageContext.request.contextPath}/book/bookfilter.do?pageIndex=1&'+getForm();
	}

	function prePage() {
	    window.location.href='${pageContext.request.contextPath}/book/bookfilter.do?pageIndex=${page.prePage}&'+getForm();
    }

    function nextPage(){
        window.location.href="${pageContext.request.contextPath}/book/bookfilter.do?pageIndex=${page.nextPage}&"+getForm();
	}

	function endPage(){
        window.location.href='${pageContext.request.contextPath}/book/bookfilter.do?pageIndex=${page.pageCount}&'+getForm();
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
        window.location.href="${pageContext.request.contextPath}/book/bookfilter.do?pageIndex="+index+"&"+getForm();
    }

    function bookinfo(bid){
        location.href = "${pageContext.request.contextPath}/book/bookmn.do?bid="+bid+"&"+getForm()+"&pageIndex=${page.pageIndex}";
	}

	function del(bid){
		var v  = confirm("确定删除?");
		if(v){
			window.location.href="bookdel.do?bid="+bid+"&"+getForm()+"&pageIndex=${page.pageIndex}";
		}
	}


	//全选方法
	function checkAll(){
	    var c = document.getElementById("all").checked;
	    var bids = document.getElementsByName("bids");
	    for(var i=0;i<bids.length;i++){
	        bids[i].checked = c;
		}
	}


	function batchDel(){
	   var count = $("input[name='bids']:checked").length;
	   if(count == 0){
	       alert("请选择数据");
	       return;
	   }
	   if(confirm("共选中"+count+"条数据,确定删除?")){
	       $("#form2").submit();
	   }
	}


	function tobookAdd() {

        location.href='${pageContext.request.contextPath}/book/tobookadd.do?author=${author}&nname=${bname}&category=${category}&status=${status}&pageIndex=${page.pageIndex}';
    }
</script>
</html>








