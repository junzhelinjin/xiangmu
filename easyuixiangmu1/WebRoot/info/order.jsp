<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>发货单号</title>
        <base href="../h5/">
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/order.css"/>
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
                <h1>发货单号：${requestScope.oinfolist.code}</h1>
            </div>
        </header>
        <article style="bottom: 0;">
            <ul class="xunjia-box">
                <li class="inner">
                    <div class="item-name">快递公司：</div>
                    <div class="item-value">${requestScope.oinfolist.ename}</div>
                </li>
                <li class="inner">
                    <div class="item-name">入库日期：</div>
                    <div class="item-value">${requestScope.oinfolist.createdate}</div>
                </li>
                <li class="inner">
                    <div class="item-name">快递类型：</div>
                    <div class="item-value">${requestScope.oinfolist.sizename}</div>
                </li>
                <li class="inner">
                    <div class="item-name">配送到：</div>
                    <div class="item-value">${requestScope.oinfolist.zname}</div>
                </li>
                <li class="inner">
                    <div class="item-name">中专类型：</div>
                    <div class="item-value">${requestScope.oinfolist.typename}</div>
                </li>
                <li class="inner">
                    <div class="item-name">发货备注：</div>
                    <div class="item-value">${requestScope.oinfolist.comments}</div>
                </li>
            </ul>
           
        </article>
        
        <footer>
           <div class="button">
                <div class="bd">
                    <a href="../info/inorder?id=${requestScope.oinfolist.id}" class="weui_btn weui_btn_primary">接单</a>
                </div>
            </div>
        </footer>

        <script src="lib/jquery-2.1.4.js"></script>
        <script src="js/jquery-weui.js"></script>
    </body>
</html>