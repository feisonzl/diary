function checkstr(str,length){
	var n=0;
	var value=0;
	for(i=0;i<length;i++){
		value=str.charCodeAt(i);
		if(value>255){
			n+=2;
		}else{
			n+=1;
		}
	}
	if(n>length){
		return false;
	}else{
		return true;
	}
}

function checkLegUser(username){
	if(checkstr(username,20)){
		return true;
	}else{
		return false;
	}
}

function checkLegPwd(pwd){
	var Expression=/^[A-Za-z]{1}([A-Za-z0-9]|[._]){5,29}$/;
	var objExp=new RegExp(Expression);
	if(objExp.test(pwd)==true){
		return true;
	}else{
		return false;
	}
}