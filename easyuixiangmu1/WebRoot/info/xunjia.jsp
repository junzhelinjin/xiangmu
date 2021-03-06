<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>配送记录</title>
        <base href="../h5/">
        <link rel="stylesheet" href="css/pages/choose.css"/>
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/xunjia_wuliao.css"/>
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
        function back() {
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
                <h1>配送记录</h1>
                <a href="app.jsp" class="app">
                    <i class="iconfont">&#xe643;</i>
                </a>
            </div>
        </header>
        <article style="bottom: 0;">
        <div class="weui_search_bar" id="search_bar">
              <form class="weui_search_outer" action="../info/xunjia" method="post">
                <div class="weui_search_inner">
                  <i class="weui_icon_search"></i>
                  <input type="search" name="text" class="weui_search_input" id="search_input" placeholder="请输入单号单号">
                  <a href="javascript:" class="weui_icon_clear" id="search_clear"></a>
                </div>
                <label for="search_input" class="weui_search_text" id="search_text">
                  <span>请输入单号单号</span>
                  <i class="weui_icon_search"></i>
                </label>
              </form>
              <a href="javascript:" class="weui_search_cancel" id="search_cancel">取消</a>
            </div>

           <div class="weui_cells weui_cells_access">
           <c:forEach var="r" items="${requestScope.infolist2}">
                <a class="weui_cell" onclick="sendId(this);">
                <input type="hidden" id="sid" value="${r.id}">
                    <div class="weui_cell_bd weui_cell_primary">
                        <div class="wuliao-title">
                            <label>${r.code}</label>
                            <span>-快递编号</span>
                        </div>
                        <div class="detail clearfix">
                           
                            <span class="require">类型：<label>${r.sizename}</label></span>
                            <span class="result">中转类型：<label>${r.typename}</label></span>
                        </div>
                        <div class="org">
                            <span>状态</span>
                            <label class="green">${r.istatusname}</label>
                        </div>
                    </div>
                </a>
                </c:forEach>
            </div>
        </article>
        <script src="lib/jquery-2.1.4.js"></script>
        <script src="js/jquery-weui.js"></script>
        <script type="text/javascript">
        	function sendId(o) {
				var sid=$(o).find("#sid").val();
				location.href="../info/tasks?id="+sid;
			}
        </script>
    </body>
</html>