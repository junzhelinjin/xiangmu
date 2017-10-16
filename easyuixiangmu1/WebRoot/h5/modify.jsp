<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>密码修改</title>
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/modify.css"/>
        <script>(function (doc, win) {
          var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
              var clientWidth = docEl.clientWidth;
              if (!clientWidth) return;
              docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
            };

          if (!doc.addEventListener) return;
          win.addEventListener(resizeEvt, recalc, false);
          doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
        function back(){
        	window.history.back(-1);
        }
        </script>
    </head>
    <body>
        <header>
            <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>密码修改</h1>
            </div>
        </header>
        <article style="bottom: 54px;">
        <form class="f1" action="../login/updatephone" method="post">
        <input type="hidden" name="id" value="${sessionScope.puser.id}">
            <div class="weui_cells animated fadeInRight">
                    <div class="weui_cell tip">
                        <div class="weui_cell_bd weui_cell_primary">
                            <p>当前密码</p>
                        </div>
                    </div>
            </div>
            <div class="weui_cell password">
                <div class="weui_cell_bd weui_cell_primary password">
                    <input class="weui_input" name="old" type="password" placeholder="请输入当前密码">
                </div>
            </div>
            <div class="weui_cells animated fadeInRight">
                    <div class="weui_cell tip">
                        <div class="weui_cell_bd weui_cell_primary">
                            <p>新密码</p>
                        </div>
                    </div>
            </div>
            <div class="weui_cell password">
                <div class="weui_cell_bd weui_cell_primary password">
                    <input class="weui_input" name="pass1" type="password" placeholder="请输入新密码">
                </div>
            </div>
            <div class="weui_cells animated fadeInRight">
                    <div class="weui_cell tip">
                        <div class="weui_cell_bd weui_cell_primary">
                            <p>新密码确认</p>
                        </div>
                    </div>
            </div>
            <div class="weui_cell password">
                <div class="weui_cell_bd weui_cell_primary password">
                    <input class="weui_input" name="pass2" type="password" placeholder="请再次输入新密码">
                </div>
            </div>
       </form>
            <div class="button">
                <div class="bd">
                    <a onclick="updatephone();" class="weui_btn weui_btn_primary">确认变更</a>
                </div>
            </div>
           
        </article>
        <footer>
            <ul class="menubar animated fadeInUp delay3">
                <li class="tab">
                    <i class="iconfont">&#xe63c;</i>
                    <label class="tab-label">公告</label>
                    <span class="point"></span>
                </li>
                <li class="tab">
                    <i class="iconfont">&#xe63d;</i>
                    <label class="tab-label">任务</label>
                    <span class="point"></span>
                </li>
                <li class="tab active">
                    <i class="iconfont">&#xe63f;</i>
                    <label class="tab-label">应用</label>
                    <span class="point"></span>
                </li>
                <li class="tab">
                    <i class="iconfont">&#xe63e;</i>
                    <label class="tab-label">我</label>
                </li>
            </ul>
        </footer>
        <script src="lib/jquery-2.1.4.js"></script>
        <script src="js/jquery-weui.js"></script>
        <script type="text/javascript">
        $("ul.menubar").on("click","li",function(){      
            
        	if($(this).text().match("公告")){
        		window.location.href="notice.jsp";
        	}else if($(this).text().match("任务")){
        		window.location.href="nothing_todo.jsp";
        	}else if($(this).text().match("我")){
        		window.location.href="self.jsp";
        	}else{
        		window.location.href="app.jsp";
        	}
        });
        
        function updatephone() {
        	var form=$(".f1");
			var data=form.serializeArray();
			var action = form.attr("action");
			$.ajax({type:"POST",url:action,data:data,dataType:"json",success:function(json){
				if(json.status>0){
					alert("修改成功");
					location.href="login.jsp";
				}else{
					location.href="modify.jsp";
				}
			}});
		}
        </script>
    </body>
</html>