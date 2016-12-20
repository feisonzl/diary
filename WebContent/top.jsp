<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#top{
	margin: 0px;
	background-image: url(images/bg_top.jpg);
	width: 800px;
	height: 176px;
}
#navigation{
	margin: 2px;
}
</style>
<link rel="stylesheet" href="CSS/style.css"></link>
<div id="top" align="center"></div> 
<div id="navigation">
	<div style="float: left;color: #006700">
		<c:if test="${empty sessionScope.username }">
			&nbsp;>>&nbsp;welcome!!!please register!
		</c:if>
		<c:if test="${!empty sessionScope.username }">
			&nbsp;>>&nbsp;hello ${sessionScope.username},welecome to your blog!
		</c:if>
	</div>
	<div style="float: right;text-align: right;">
		<a href="">home</a>
		<c:if test="${empty sessionScope.username }">
			&nbsp;|&nbsp; <a href="">register</a>
			&nbsp;|&nbsp;<a href="">login</a>
			&nbsp;|&nbsp;<a href="">forget password</a>
		</c:if>
		<c:if test="${!empty sessionScope.username }">
			&nbsp;&nbsp;<a href="">my blog</a>
			&nbsp;|&nbsp;<a href="">blog list</a>
		</c:if>
	</div>
</div>
