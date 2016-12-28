<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#notClickDiv{
	filter:alpha(Opacity=35);opacity: 0.35;
	background-color: #000000;
	position: absolute;
	display: none;
	z-index: 9;
	left: 0px;
	top: 0px;
	margin: 0px;
	padding: 0px;
}
#top{
	margin: 0px;
	background-image: url(images/bg_top.jpg);
	/*background-color:#707070;*/
	width: 800px;
	height: 176px;
}
#navigation{
	margin: 0px;
	background-image: url(images/navigation_bg.jpg);
	height: 26px;
	width: 790px;	
	padding: 5px 5px 0px 5px;
}
#login ul{
	margin: 0px;	
	list-style: none;
}
#login ul li{
	padding: 5px;
}
#loginTitle{
	padding: 15px;
	background-color: #FCFBF0;
	color: #1B7F5D;
	font-size: 14px;
	font-weight: blod;
	margin: 0px;
}
#login{
	position:absolute;
	width: 280px;
	height: 156px;
	margin: 0px;
	padding: 4px;
	z-index: 10;
	background-color: #546B51;
	display: none;
}
</style>
<script type="text/javascript" src="JS/AjaxRequest.js"></script>
<script>
function loginSubmit(form2) {
	if(form2.username==""){
		alert("please input username");
		form2.username.focus();
		return false;
	}
	if(form2.pwd==""){
		alert("please input password");
		form2.pwd.focus();
		return false;
	}
	var params="username="+form2.username.value+"&pwd"+form2.pwd.value;
	var loader=new net.AjaxRequest("UserServlet?action=login",deal_load,onerror,"POST",encodeURI(params));
}

function onerror() {
	alert("you operation is error!!");
}

function deal_load() {
	var h=this.req.responseText;
	h=h.replace(/\s/g,"");
	alert(h);
	if(h=="login success"){
		window.location.href="DiaryServlet?action=listAllDiary";
	}else{
		form2.username.value="";
		form2.pwd.value="";
		form2.username.focus();
	}
}

function myClose(divID) {
	document.getElementById(divID).style.display="none";
	//divID.style.display='none';
	document.getElementById("notClickDiv").style.display='none';
	
}

function myOpen(divID) {
	/*var notClickDiv=document.getElementById("notClickDiv");*/
	document.getElementById("notClickDiv").style.display='block';
	document.getElementById("notClickDiv").style.width=document.body.clientWidth;
	document.getElementById("notClickDiv").style.height=document.body.clientHeight;
	document.getElementById(divID).style.display='block';
	document.getElementById(divID).style.left=(document.body.clientWidth-240)/2;
	document.getElementById(divID).style.top=(document.body.clientHeight-120)/2;
}
</script>
<link rel="stylesheet" href="CSS/style.css"></link>
<div id="notClickDiv"></div>
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
		<a href="index.jsp">home</a>
		<c:if test="${empty sessionScope.username }">
			&nbsp;|&nbsp; <a href="#" onclick="Regopen('register')">register</a>
			&nbsp;|&nbsp;<a href="#" onclick="myOpen('login')">login</a>
			&nbsp;|&nbsp;<a href="">forget password</a>
		</c:if>
		<c:if test="${!empty sessionScope.username }">
			&nbsp;&nbsp;<a href="">my blog</a>
			&nbsp;|&nbsp;<a href="">blog list</a>
		</c:if>
	</div>
</div>

<div id="login">
	<form action="" name="form2" id="form2" method="post">
		<div id="loginTitle"><b>user login</b></div>
		<div id="loginContent" style="margin: 0px;background-color: #FFFEF9;">
		<ul>
			<li>
			username:<input name="username" id="username" type="text" style="width: 120px;" onkeydown="if(event.keyCode==13){this.form.pwd.focus();}">
			</li>
			<li>
			password:<input type="password" id="pwd" name="pwd" style="width: 120px;" onkeydown="if(event.keyCode==13){loginSubmit(this.form);}">
			</li>
			<li style="padding-left: 40px">
			<input type="button" value="submit" id="submit" name="submit" onclick="loginSubmit(this.form)">
			<input type="button" value="close" id="submit2" name="submit2" onclick="myClose('login')">
			</li>
		</ul>
		</div>
		<div style="background-color: #FEFEFC;height: 10px;"></div>
	</form>

</div>