<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>我</title>
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/self.css"/>
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
        })(document, window);</script>
    </head>
    <body>
        <header>
            <div class="head-box">
               <h3>我</h3>
               <div class="head-icon-outer">
                    <div class="head-icon"></div>
               </div>
               <h5>头像点击可以更换</h5>
            </div>
        </header>
        <article>
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="person_info.jsp">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>资料修改</p>
                    </div>
                    <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="modify.jsp">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>密码修改</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>检查新版本</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            <div class="button">
                <div class="bd">
                    <a href="../login/outloginphone" class="weui_btn weui_btn_primary">退出</a>
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
        </script>
    </body>
</html>
