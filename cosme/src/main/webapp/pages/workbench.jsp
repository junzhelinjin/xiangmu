<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../custom/uimaker/easyui.css">
    <link rel="stylesheet" href="css/workbench.css">
</head>
<body>
<div class="container">
    <div id="bd">
        <div class="bd-content">
            <div class="right-zone">
                <div class="inform item-box">
                    <div class="inform-hd">
                        <label>通知公告</label>
                        <a href="javascript:;">更多<span>&gt;</span></a>
                    </div>
                    <ul>
                        <li>
                            <span></span>
                            <a href="javascript:;" class="ellipsis">uimaker信息管理<i></i></a>
                            <label>04-13</label>
                        </li>
                        <li>
                            <span></span>
                            <a href="javascript:;" class="ellipsis">光电获土耳其最大固网<i></i></a>
                            <label>04-12</label>
                        </li>
                        <li>
                            <span></span>
                            <a href="javascript:;" class="ellipsis">2015中国线缆行业最具竞争</a>
                            <label>04-11</label>
                        </li>
                        <li>
                            <span></span>
                            <a href="javascript:;" class="ellipsis">2016年铝包钢绞线2016管道保温棉询</a>
                            <label>04-10</label>
                        </li>
                        <li>
                            <span></span>
                            <a href="javascript:;" class="ellipsis">力缆（特种导线）再次温棉询</a>
                            <label>04-09</label>
                        </li>
                        <li>
                            <span></span>
                            <a href="javascript:;" class="ellipsis">光电获土耳其最大固网</a>
                            <label>04-08</label>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="center-part">
                <div class="center-items todo">
                    <ul class="work-items clearfix">
                        <li>
                            <div class="work-inner">
                                <div class="work-item red">
                                    <i class="iconfont">&#xe622;</i>
                                    <span class="num">6&nbsp;<span class="unit">条</span></span>
                                    <label>预警信息未读</label>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="work-inner">
                                <div class="work-item green">
                                    <i class="iconfont">&#xe61f;</i>
                                    <span class="num">14&nbsp;<span class="unit">个</span></span>
                                    <label>待办未处理</label>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

    </div>


</div>
<div class="todo-panel">
    <div class="todo-title">
        <i class="iconfont">&#xe61f;</i>
        <span class="num">14&nbsp;<span class="unit">个</span></span>
        <label>待办未处理</label>
    </div>
    <div class="todo-items">
        <ul>
            <li>
                <span></span>
                <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理<i></i></a>
                <label>04-13</label>
            </li>
            <li>
                <span></span>
                <a href="javascript:;" class="ellipsis">您有<span>10条</span>供应商开发申请未处理<i></i></a></a>
                <label>04-13</label>
            </li>
            <li>
                <span></span>
                <a href="javascript:;" class="ellipsis">您有<span>0条</span>供应商开发申请未处理，请及时审批<i></i></a></a>
                <label>04-13</label>
            </li>

        </ul>
    </div>

</div>
<script type="text/javascript" src="../custom/jquery.min.js"></script>
<script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/echarts-all.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        //我的待办点击事件
        $(document).on('click','.work-item.green',function(event){
            var width = ( $(this).width()) + 20;
            $(".todo-panel").width(width -2).css({top:$(this).offset().top,left:$(this).offset().left}).show();
            event.stopPropagation();
        });
        $(".todo-panel").click(function(){
            event.stopPropagation();
        });
        $(document).click(function(){
            $(".todo-panel").hide();
        });

    });

    //公开附件tab事件处理
    $(".attached-tab").on("click","a",function(){
        $(this).closest(".attached-tab").find("a").removeClass("current");
        $(this).addClass("current");
        $(this).closest(".attached").find("ul").addClass("hide");
        $(this).closest(".attached").find("ul." + $(this).attr("attached")).removeClass("hide");
    })

</script>
</body>
</html>

