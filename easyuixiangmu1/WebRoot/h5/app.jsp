<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>应用</title>
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/app.css"/>
        
        <script>
        (function (doc, win) {
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
                
                <h1>应用</h1>
            </div>
        </header>
        <article style="padding-bottom: 54px;padding-top:44px;">
            

            <div class="list-wrap">
                <h4></h4>
                <ul class="app-list">
                    <li>
                        <div class="app-wrap">
                            <a href="../info/choose">
                                <i class="iconfont">&#xe64b;</i>
                                <span>我要接单</span>
                            </a>
                        </div>
                        
                    </li>
                    <li>
                        <div class="app-wrap">
                            <a href="../info/xunjiawuliao">
                                <i class="iconfont">&#xe644;</i>
                                <span>开始配送</span>
                            </a>
                        </div>
                        
                    </li>
                    
                    <li>
                        <div class="app-wrap">
                            <a href="../info/xunjia">
                                <i class="iconfont">&#xe647;</i>
                                <span>配送情况</span>
                            </a>
                        </div>
                        
                    </li>
                    
                    <li>
                        <div class="app-wrap">
                            <a href="../info/recode">
                                <i class="iconfont">&#xe64a;</i>
                                <span>配送记录</span>
                            </a>
                        </div>
                    </li>

                </ul>
            </div>
		<div class="list-wrap">
             <h4></h4>
                <ul class="app-list">
                    <li>
                        <div class="app-wrap">
                            <a href="javascript:;">
                                <i class="iconfont">&#xe625;</i>
                                <span>个人收益</span>
                            </a>
                        </div>
                        
                    </li>
                    
                    <li>
                        <div class="app-wrap">
                            <a href="javascript:;">
                                <i class="iconfont">&#xe645;</i>
                                <span>客户评标</span>
                            </a>
                        </div>
                        
                    </li>
                    
                    
                </ul>
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
                    <label class="tab-label" onclick="">我</label>
                    
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