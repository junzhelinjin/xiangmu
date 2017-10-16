function showMsg(txt){
	 layer.alert(txt);
}
function showPage(title,url,width,height,closeCallBack,maxmin){
	if(!maxmin)maxmin=true;
	else{
		maxmin=false;
	}
	layer.ready(function(){ 
		  layer.open({
		    type: 2,
		    title: title,
		    maxmin: true,
		    area: [width+'px', height+'px'],
		    content:url,
		    end: function(){
		      if(closeCallBack)closeCallBack();
		    }
		  });
		});
}


function showTip(txt,selector){
	layer.tips(txt, selector, {tips: 1});
}

function closePage(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

function sendData(action,data){
	$.ajax({type:"POST",url:action,dataType:"json",data:data,success:function(json){
		if(json.status>0){
			closePage();
//			location.href="operator/index";
		}
	}});
}
function sendForm(form){
	var m = form.children(".must");
	for ( var i = 0; i < m.length; i++) {
		if (m.get(i).value.length == 0) {
			showMsg("信息不全");
			return ;		
		}
	}
	var data = form.serializeArray();
	var action = form.attr("action");
	sendData(action, data);
	
}
function showConfirm(txt,fun,button1,button2){
	var bt1 = "确定";
	var bt2 = "取消";
	if(button1)bt1=button1;if(button2)bt2=button2;
	layer.confirm(txt, {
		  btn: [bt1,bt2] //按钮
		}, function(){
		  fun();
		}, function(){
			
		});
}