var net = new Object();
net.AjaxRequest = function(url,onload,onerror,method,params){
	this.req = null;
	this.onload = onload;
	this.onerror = (onerror)?onerror:this.defaultError;
	this.loadDate(url,method,params);
}

net.AjaxRequest.prototype.loadDate = function(url,method,params){
	if(!method){
		method="GET";
	}
	if(window.XMLHttpRequest){
		this.req = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		try{
			this.req = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				this.req = new ActiveXObject("Microsoft.XMLHTTP");				
			}catch(e){
				
			}
		}
	}
	if(this.req){
		try{
			var loader=this;
			this.req.onreadystatechange = function(){
				net.AjaxRequest.onReadyState.call(loader);
			}
			this.req.open(method,url,true);
			if(method=="POST"){
				this.req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			}
			this.req.send(params);
		}catch(e){
			this.req.onerror.call(this);
		}
	}

}

net.AjaxRequest.onReadyState=function(){
	var req = this.req;
	var ready = req.readyState;
	if(ready==4){
		if(req.status==200){
			this.onload.call(this);
		}else{
			this.onerror.call(this);
		}
	}
}

net.AjaxRequest.prototype.defaultError=function(){
	alert("Error Msg!!\n\n CallBack State:"+this.req.readyStatus+"\n State:"+this.req.status);
}