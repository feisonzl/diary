<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="JS/AjaxRequest.js"></script>
<script type="text/javascript">
var flag_user=true;
function checkUser(username) {
	if(username=="")
	{
		document.getEventById("div_user").innerHTML="please input username!!";
		document.getEventById("tr_user").style.display='block';
		flag_user=false;
		/*alert("please input username!!");*/
	}else if(!checkUser(username)){
		document.getEventById("div_user").innerHTML="your username is illegal!!";
		document.getEventById("tr_user").style.display='block';
		flag_user=false;
	}else{
		var loader=new net.AjaxRequest("UserServlet?action=register",register_load,onerror,"GET","username"+username);(),regi
function register_load(){
	
}
function onerror(){
	alert("register error!!");
}result=this.req.responseText;
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
function onerror(){
	alert("register error!!");
}
function checkPwd(pwd) {
	if(pwd=="")
	{
		document.getEventById("div_pwd").innerHTML="please input pwd!!";
		document.getEventById("tr_pwd").style.display='block';
		flag_pwd=false;
		/*alert("please input username!!");*/
	}else if(!checkPwd(pwd)){
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


</script>

<style>
#register{
	width: auto;
	height: ;
	display: none;
	z-index: 10;
	background-color: #FFFFFF;
}

</style>
<div id="register">
	<form action="" name="form1" id="form1" method="post">
		<table style="width: 100%;height: 100%;border: 0;background-color: #FEFEFC;">
			<tr><td height="408" align="center" valign="top">
					<table style="width: 100%;border: 0;"><tr>
							<td height="50" style="font-size: 14px; font-weight: bold;color:#1B7F5D;">
							<b>user register</b>
							</td>
					</tr>
					</table>
					<table style="width: 94%;height: 331;border: 0;background-color: #CCCCCC">
						<tr>
							<td height="310" valign="top" bgcolor="#FFFFFF">
								<table style="border: 0px;background-color: #FFFEF9;">
									<tr id="tr_user" style="display: none;">
										<td height="40" colspan="2" align="center"><div id="div_user" style="border:solid #FF6600 1px;color: #FF000000;width: 90%;height: 29px;padding-top: 8px;"></div>										</td>
									</tr>
									<tr>
										<td width="93" height="40" align="center">user name</td>
										<td height="40" align="left"><input id="username" type="text" onblur="checkUser(this.value)"> </td>
									</tr>
									<tr id="tr_pwd" style="display: none;">
										<td height="40" colspan="2" align="center"><div id="div_pwd" style="border:solid #FF6600 1px;color: #FF000000;width: 90%;height: 29px;padding-top: 8px;"></div>										</td>
									</tr>
									<tr>
										<td width="93" height="40" align="center">password</td>
										<td height="40" align="left"><input id="pwd" type="password" onblur="checkPwd(this.value)"> </td>
									</tr>
									<tr>
										<td width="93" height="40" align="center">confirm password</td>
										<td height="40" align="left"><input id="repwd" type="password" onblur="checkRepwd(this.value)"> </td>
									</tr>

								</table>
							<b>user register</b>
							</td>
						</tr>
					</table>
			</td>
			</tr>
		
		</table>
	</form>
</div>

