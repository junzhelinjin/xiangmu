<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>接单</title>
        <base href="../h5/">
        <link rel="stylesheet" href="fonts/iconfont.css"/>
        <link rel="stylesheet" href="css/font.css"/>
        <link rel="stylesheet" href="css/weui.min.css"/>
        <link rel="stylesheet" href="css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="css/mui.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/pages/choose.css"/>
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
                <h1></h1>
                <a href="app.jsp" class="app">
                    <i class="iconfont">&#xe643;</i>
                </a>
            </div>
        </header>
        <article style="bottom: 54px;">
            <div class="weui_search_bar" id="search_bar">
              <form class="weui_search_outer" action="../info/choose" method="post">
                <div class="weui_search_inner">
                  <i class="weui_icon_search"></i>
                  <input type="search" name="text" class="weui_search_input" id="search_input" placeholder="按单号／配送区域搜索" >
                  <a href="javascript:" class="weui_icon_clear" id="search_clear"></a>
                </div>
                <label for="search_input" class="weui_search_text" id="search_text">
                  <span>按单号／配送区域搜索</span>
                  <i class="weui_icon_search"></i>
                </label>
              </form>
              <a href="javascript:" class="weui_search_cancel" id="search_cancel">取消</a>
            </div>
            
            <div class="weui_cells weui_cells_access animated fadeInRight">
              <a class="weui_cell switch" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary tip-zone">
                   <div class="tip">
                     <span class="tip-text">点击此处可批量处理</span>
                     <span class="chosen">
                       <i class="iconfont xx">&#xe63b;</i>
                       <span class="green">已选择</span>
                       <span class="red">2个</span>
                     </span>
                   </div>
                </div>
              </a>
            </div>
            
            <c:forEach var="r" items="${requestScope.infolist}">
            <div class="weui_cells weui_cells_access animated fadeInRight">
              <a class="weui_cell box" href="../info/order?id=${r.id}">
                <div class="weui_cell_bd weui_cell_primary">
                    <p><span class="phone">${r.sizename}</span><span class="type">-快递类型</span><span class="green">${r.code}</span><span class="order">收货单:</span></p>
                    <p><span class="factory-name">配送到：${r.zname}</span><span class="red">${r.istatusname}</span><span class="order">状态:</span></p>
                </div>
                <div class="choose-icon">
                  <i class="weui_icon_success"></i>
                </div>
              </a>
            </div>
		</c:forEach>
        </article>
        <footer>
           <div class="button">
                <div class="bd">
                    <a href="javascript:;" class="weui_btn weui_btn_primary">设置批量合格</a>
                </div>
            </div>
        </footer>

        <script src="lib/jquery-2.1.4.js"></script>
        <script src="js/jquery-weui.js"></script>
        <script type="text/javascript">
          $(".switch").click(function(){
            $(this).find(".tip-text").hide();
            $(this).find(".chosen").show();
            $(".box").addClass("choose");
            $("footer").show();
          });

          $(".button").click(function(){
            $(this).find(".tip-text").show();
            $(this).find(".chosen").hide();
            $(".box").removeClass("choose");
            $("footer").hide();
          });
          
          $(".xx").click(function(event) {
        	$(this).parent().hide();
        	$(this).parent().prev().show();
            $(".box").removeClass("choose");
			$("footer").hide();
			event.stopPropagation();
		});
        </script>
    </body>
</html>