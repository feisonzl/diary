<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
-->

<script type="text/javascript" src="JS/AjaxRequest.js"></script>
<script type="text/javascript" src="JS/common.js"></script>
<script type="text/javascript" >
var flag_user=true;
var flag_pwd=true;
var flag_repwd=true;

function check_load(){
	result=this.req.responseText;
	result=result.replace(/\s/g,"");
	if(result=="1"){
		document.getEventById("div_user").innerHTML="";
		document.getEventById("tr_user").style.display='none';
		flag_user=true;
	}else{
		document.getEventById("div_user").innerHTML=result;
		document.getEventById("tr_user").style.display='block';
		flag_user=false;		
	}
}

function checkUser(username) {
	//alert("checkUser!!");
	if(username=="")
	{
		//alert("checkUser username==''");
		document.getEventById("div_user").innerHTML="please input username!!";
		document.getEventById("tr_user").style.display='block';
		flag_user=false;
		/*alert("please input username!!");*/
	}else if(!checkLegUser(username)){
		//alert("!checkUser(username)");
		document.getEventById("div_user").innerHTML="your username is illegal!!";
		document.getEventById("tr_user").style.display='block';
		flag_user=false;
	}else{
		//alert("net.AjaxRequest!!");
		var loader=new net.AjaxRequest("UserServlet?action=checkUser&username="+username+"&nocache="+new Date().getTime(),check_load,onerror,"GET");
	}
	
}

function checkPwd(pwd) {
	if(pwd=="")
	{
		document.getEventById("div_pwd").innerHTML="please input pwd!!";
		document.getEventById("tr_pwd").style.display='block';
		flag_pwd=false;
		/*alert("please input username!!");*/
	}else if(!checkLegPwd(pwd)){
		document.getEventById("div_pwd").innerHTML="your pwd is illegal!!";
		document.getEventById("tr_pwd").style.display='block';
		flag_pwd=false;
	}else{
		document.getEventById("div_pwd").innerHTML="";
		document.getEventById("tr_pwd").style.display='none';
		flag_pwd=true;
	}
}

function checkRepwd(repwd) {
	if(repwd=="")
	{
		document.getEventById("div_pwd").innerHTML="please confirm pwd!!";
		document.getEventById("tr_pwd").style.display='block';
		flag_repwd=false;
		/*alert("please input username!!");*/
	}else if(form1.pwd.value!=repwd){
		document.getEventById("div_pwd").innerHTML="your password is different!!";
		document.getEventById("tr_pwd").style.display='block';
		flag_repwd=false;
	}else{
		document.getEventById("div_pwd").innerHTML="";
		document.getEventById("tr_pwd").style.display='none';
		flag_repwd=true;
	}
}

function onerror(){
	alert("register error!!");
}

function Regopen(divID){
	document.getElementById("notClickDiv").style.display='block';
	document.getElementById("notClickDiv").style.width=document.body.clientWidth;
	document.getElementById("notClickDiv").style.height=document.body.clientHeight;
	document.getElementById(divID).style.display='block';
	document.getElementById(divID).style.left=(document.body.clientWidth-663)/2;
	document.getElementById(divID).style.top=(document.body.clientHeight-200)/2;
}

function register_load(){
	result=this.req.responseText;
	result=result.replace(/\s/g,"");
	alert("register result:"+result);
	form1.reset();
	document.getElementById("tr_user").style.display='none';
	document.getElementById("tr_pwd").style.display='none';
	document.getElementById("tr_repwd").style.display='none';
	myClose("register");
	//alert("register success!!");
	
}
function register_user(){
	//alert("register_user!!username="+form1.username.value+"&pwd="+form1.pwd.value+"&repwd="+form1.repwd.value);
	if(form1.username.value==""){
		alert("please input username!!");form1.username.focus();return false;
	}else if(form1.pwd.value==""){
		alert("please input password!!");form1.username.focus();return false;
	}else if(form1.repwd.value==""){
		alert("please confirm password!!");form1.username.focus();return false;
	}else if(flag_repwd && flag_pwd && flag_user){
		var params="&username="+form1.username+"&pwd="+form1.pwd;
		var loader=new net.AjaxRequest("UserServlet?action=register&nocache="+new Date().getTime(),register_load,onerror,"GET",params);
	}else{
		alert("your input message is illegal!!");
	}
	
}


</script>

<style>
#register{
	width: 663;
	height: 441;
	display: none;
	z-index: 11;
	background-color: #546B51;
	padding: 4px;
	position: absolute;
}

</style>
<div id="register">
	<form action="" name="form1" id="form1" method="post">
		<table style="width: 100%;height: 100%;border: 0;background-color: #FEFEFC;">
			<tr><td height="200" align="center" valign="top">
					<table style="width: 100%;border: 0;"><tr>
							<td height="50" style="font-size: 14px; font-weight: bold;color:#1B7F5D;">
							<b>user register</b>
							</td>
					</tr>
					</table>
					<table style="width: 94%;height: 331;border: 0;background-color: #CCCCCC">
						<tr>
							<td height="180" valign="top" bgcolor="#FFFFFF">
								<table style="border: 0px;background-color: #FFFEF9;">
									<tr id="tr_user" style="display: none;">
										<td height="40" colspan="2" align="center"><div id="div_user" style="border:solid #FF6600 1px;color: #FF000000;width: 90%;height: 29px;padding-top: 8px;"></div>										</td>
									</tr>
									<tr>
										<td width="93" height="40" align="center">user name</td>
										<td height="40" align="left"><input name="username" id="username" type="text" onblur="checkUser(this.value)"> </td>
									</tr>
									<tr id="tr_pwd" style="display: none;">
										<td height="40" colspan="2" align="center"><div id="div_pwd" style="border:solid #FF6600 1px;color: #FF000000;width: 90%;height: 29px;padding-top: 8px;"></div>										</td>
									</tr>
									<tr>
										<td width="93" height="40" align="center">password</td>
										<td height="40" align="left"><input name="pwd" id="pwd" type="password" onblur="checkPwd(this.value)"> </td>
									</tr>
									<tr>
										<td width="93" height="40" align="center">confirm password</td>
										<td height="40" align="left"><input name="repwd" id="repwd" type="password" onblur="checkRepwd(this.value)"> </td>
									</tr>
									<tr>
										<td width="93" height="40" align="center"><input type="button" onclick="register_user()" value="submit"></td>
										<td width="93" height="40" align="center"><input type="button" onclick="myClose('register')" value="close"></td>
									</tr>

								</table>
							</td>
						</tr>
					</table>
			</td>
			</tr>
		
		</table>
	</form>
</div>

<!-- 
</body>
</html>
 -->
