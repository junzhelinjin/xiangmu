<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>公告</title>
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/notice.css"/>
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
        <header>
            <div class="titlebar reverse">
                <h1>通告</h1>
            </div>
            <ul class="tabbar animate-slide width-full" data-col="4" id="tabbar">
                <li class="tab active">
                    <label class="tab-label">系统公告</label>
                </li>
                <li class="tab">
                    <label class="tab-label">询价公告</label>
                </li>
                <li class="tab">
                    <label class="tab-label">招标公告</label>
                </li>
                <li class="tab">
                    <label class="tab-label">竞价公告</label>
                </li>
                <hr>
            </ul>
        </header>
        <article style="padding-bottom: 54px;padding-top:70px;">
            <div class="weui_cells weui_cells_access animated fadeInRight">
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p class="title new">信息管理系统版本发布</p>
                    <p class="date">2016年5月1日</p>
                    <p class="info">系统将于今日进行整体的升级，届时可能短时间内无法使用，请大家耐心等待，我们会尽快的。</p>
                </div>
              </a>
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p class="title">采购商行为规范制度</p>
                    <p class="date">2016年5月1日</p>
                    <p class="info">系统将于今日进行整体的升级，届时可能短时间内无法使用，请大家耐心等待，我们会尽快的。</p>
                </div>
              </a>
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p class="title">苏州地区供应商名称整理</p>
                    <p class="date">2016年5月1日</p>
                    <p class="info">系统将于今日进行整体的升级，届时可能短时间内无法使用，请大家耐心等待，我们会尽快的。</p>
                </div>
              </a>
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p class="title">元素信息管理系统版本发布</p>
                    <p class="date">2016年5月1日</p>
                    <p class="info">系统将于今日进行整体的升级，届时可能短时间内无法使用，请大家耐心等待，我们会尽快的。</p>
                </div>
              </a>

              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p class="title">元素信息管理系统版本发布</p>
                    <p class="date">2016年5月1日</p>
                    <p class="info">系统将于今日进行整体的升级，届时可能短时间内无法使用，请大家耐心等待，我们会尽快的。</p>
                </div>
              </a>

              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <p class="title">元素信息管理系统版本发布</p>
                    <p class="date">2016年5月1日</p>
                    <p class="info">系统将于今日进行整体的升级，届时可能短时间内无法使用，请大家耐心等待，我们会尽快的。</p>
                </div>
              </a>
              
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