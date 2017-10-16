<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>物流信息管理系统</title>
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/login.css"/>
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
        </script>
    </head>
    <body>
        <div class="header">
            <img src="images/login_logo_w.png">
            <h2>物流配送平台</h2>
        </div>
        <div class="login-wrap">
            <div class="login-box">
                <form class="f1" method="post" action="../login/loginphone">
                    <div class="input-wrap">
                        <input type="text" name="tel" placeholder="账号/邮箱">
                    </div>
                    <div class="input-wrap">
                        <input type="password" name="pass" placeholder="密码">
                    </div>
                   <div class="input-wrap">
                        <input type="text" name="code" placeholder="验证码">

                        <img src="../img/code.jpg" onclick="this.src='../img/code.jpg?a='+(a++)" class="validate-code">
                    </div>

                    
                </form>
            </div>
            <div class="btns">
                
            </div>

            <a onclick="app();" class="weui_btn login-btn weui_btn_primary">登录</a>
                    
        </div>
        <div class="footer">
            Copyright&nbsp;&copy;&nbsp;uimaker&nbsp;版权所有
        </div>
        <script src="lib/jquery-2.1.4.js"></script>
        <script src="js/jquery-weui.js"></script>
        <script type="text/javascript">
        	var a=0;
        	function app() {
        		var form=$(".f1");
    			var data=form.serializeArray();
    			var action = form.attr("action")
        		$.ajax({type:"POST",url:action,data:data,dataType:"json",success:function(json){
        			if(json.status>0){
        				location.href="app.jsp";
        			}else{
        				location.href="login.jsp";
        			}
        		}});
			}
        </script>
    </body>
</html>