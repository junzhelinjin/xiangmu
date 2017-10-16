$(function(){
	function picshow(picstyle,addbt_style,delbt_style){
		
		if(!picstyle)picstyle={"background-color":"#888",width: "70px",height: "90px",margin:"5px","float":"left"};
		if(!addbt_style)addbt_style={"font-size": "50px",color: "#eee","font-weight": "bold","text-align": "center"};
		if(!delbt_style)delbt_style={"font-size": "30px",color: "#333","font-weight": "bold","margin-left": "50px","margin-top":"70px","position":"absolute"};
		var lastpic;
		var ids=$($(".picshow").attr("idsserlector"));
		var addbt_class=$(".picshow").attr("addbt_class");
		var delbt_class=$(".picshow").attr("delbt_class");
		var pic_class=$(".picshow").attr("pic_class");
		
		var form= $("<form method='post' enctype='multipart/form-data'></form>");
		var file=$(" <input  type='file' name='file' style='display: none;' >");
		form.append(file);
		$("body").append(form);
		
		
		
		var addItem=function(){			
			var pic=$("<div></div>").css(picstyle);
			if(pic_class&&pic_class.length>0)
				pic=$("<div></div>").addClass(pic_class);
			var add=$("<b>+</b>").css(addbt_style);
			if(addbt_class&&addbt_class.length>0)
			add=$("<b>+</b>").addClass(addbt_class);
			pic.append(add);
			pic.click(function(){
				lastpic= pic;
				file[0].click();
			});
			$(".picshow").append(pic);
		};
		var ondel=function(){
			var o=$(event.target.parentNode);
			var id=o.find("img").attr("myid");
			$.getJSON("pics/delpic",{id:id},function(json){
				if(json.status>0){
					o.remove();
					delid(id);
				}
									
			});
		};
		
		var addAllItem=function(id,url){			
			var pic=$("<div></div>").css(picstyle);
			if(pic_class&&pic_class.length>0)
				pic=$("<div></div>").addClass(pic_class);
			var img=$("<img/>").attr("width",70).attr("height",90).attr("myid",id).attr("src",url);
			var del=$("<b>-</b>").css(delbt_style);
			if(delbt_class&&delbt_class.length>0)
				del=$("<b>-</b>").addClass(delbt_class);
			del.click(ondel);
			pic.append(del);
			pic.append(img);
			$(".picshow").append(pic);
		};
		
		 var setItem=function(pic,id,url){
			pic.find("b").remove();
			var img=$("<img />").attr("width",70).attr("myid",id).attr("height",90).attr("src",url);
			var del=$("<b>-</b>").css(delbt_style);
			if(delbt_class&&delbt_class.length>0)
				del=$("<b>-</b>").addClass(delbt_class);
			del.click(ondel);
			pic.append(del);
			pic.append(img);
			pic.unbind();
			addItem();
		};
		 
		 addid=function(id){
			 var oid=ids.val();
			 if(oid.length==0)ids.val(id);
			 else ids.val(oid+","+id);
		 };
		 delid=function(id){
			 var oid=ids.val();
			 if(oid.indexOf(",")>0){
				 if(oid.indexOf(","+id+",")>0) ids.val(ids.val(oid.replace(id+",", "")));
				if(oid.indexOf(id+",")==0) ids.val(oid.substring((id+",").length));
				else ids.val(oid.substring(0,oid.length-(id+",").length));
			 }else ids.val("");
		 };
		 
		 upload=function(){
				var hr =new XMLHttpRequest();
				hr.open("POST", "pics/upload", true);
				hr.onreadystatechange=function(){
					if(hr.readyState==4){
						var json=eval("("+hr.responseText+")");
						addid(json.status);
						setItem(lastpic,json.status, json.url);
					}
				};
				hr.send(new FormData(form[0]));
				};
			file.change(upload);
		
		
		var idvalue=ids.val();
		
		if(idvalue.length>0){
			$.getJSON("pics/list",{ids:idvalue},function(json){
				for(var i=0;i<json.length;i++){
					addAllItem(json[i].id,json[i].url);
				}
				addItem();
				
			});
		}else{
			addItem();
			
		}
	}

	var pic=new picshow();
	
});