
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>uimaker信息管理系统</title>
    <link href="pages/css/base.css" rel="stylesheet">
    <link href="pages/css/platform.css" rel="stylesheet">
    <link rel="stylesheet" href="custom/uimaker/easyui.css">
</head>
<body>
<div class="container">
    <div id="pf-hd">
        <div class="pf-logo">
            <img src="pages/images/main/main_logo.png" alt="logo">
        </div>

        <div class="pf-nav-wrap">
            <div class="pf-nav-ww">
                <ul class="pf-nav">
                    <li class="pf-nav-item home current" data-menu="sys-manage">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe63f;</span>
                            <span class="pf-nav-title">系统管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item project" data-menu="org-manage">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe60d;</span>
                            <span class="pf-nav-title">组织管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item static" data-menu="main-data">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe61e;</span>
                            <span class="pf-nav-title">主数据</span>
                        </a>
                    </li>
                    <li class="pf-nav-item manger" data-menu="supplier-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe620;</span>
                            <span class="pf-nav-title">供应商管理</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="supplier-dev">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe625;</span>
                            <span class="pf-nav-title">供应商开发</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe64b;</span>
                            <span class="pf-nav-title">采购寻源</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe64c;</span>
                            <span class="pf-nav-title">合同管理</span>
                        </a>
                    </li>


                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe623;</span>
                            <span class="pf-nav-title">示例示例</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe646;</span>
                            <span class="pf-nav-title">示例示例示例示例示例</span>
                        </a>
                    </li>
                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe623;</span>
                            <span class="pf-nav-title">采购寻源</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe646;</span>
                            <span class="pf-nav-title">合同管理</span>
                        </a>
                    </li>


                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe623;</span>
                            <span class="pf-nav-title">示例示例</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe646;</span>
                            <span class="pf-nav-title">示例示例示例示例示例示例</span>
                        </a>
                    </li>


                </ul>
            </div>


            <a href="javascript:;" class="pf-nav-prev disabled iconfont">&#xe606;</a>
            <a href="javascript:;" class="pf-nav-next iconfont">&#xe607;</a>
        </div>



        <div class="pf-user">
            <div class="pf-user-photo">
                <img src="pages/images/main/user.png" alt="">
            </div>
            <h4 class="pf-user-name ellipsis">uimaker</h4>
            <i class="iconfont xiala">&#xe607;</i>

            <div class="pf-user-panel">
                <ul class="pf-user-opt">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe60d;</i>
                            <span class="pf-opt-name">用户信息</span>
                        </a>
                    </li>
                    <li class="pf-modify-pwd">
                        <a href="http://www.uimaker.com">
                            <i class="iconfont">&#xe634;</i>
                            <span class="pf-opt-name">修改密码</span>
                        </a>
                    </li>
                    <li class="pf-logout">
                        <a href="login.html">
                            <i class="iconfont">&#xe60e;</i>
                            <span class="pf-opt-name">退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </div>

    <div id="pf-bd">
        <div id="pf-sider">
            <h2 class="pf-model-name">
                <span class="iconfont">&#xe64a;</span>
                <span class="pf-name">组织管理</span>
                <span class="toggle-icon"></span>
            </h2>

            <ul class="sider-nav">
                <li class="current">
                    <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe620;</span>
                        <span class="sider-nav-title">供应商组织</span>
                        <i class="iconfont">&#xe642;</i>
                    </a>
                    <ul class="sider-nav-s">
                        <li><a href="#" onclick="addTab('首页','pages/workbench.jsp')">首页</a></li>
                        <li><a href="#" onclick="addTab('通知表','pages/Notice.jsp')">通知表</a></li>
                        <li><a href="#" onclick="addTab('消息发送表','pages/Message_send.jsp')">消息发送表</a></li>
                        <li><a href="#" onclick="addTab('消息表','pages/Message.jsp')">消息表</a></li>

                    </ul>
                </li>
            </ul>
        </div>

        <div id="pf-page">
            <div id="tt" class="easyui-tabs1" style="width:100%;height:100%;">

            </div>
        </div>
    </div>

    <div id="pf-ft">
        <div class="system-name">
            <i class="iconfont">&#xe6fe;</i>
            <span>信息管理系统&nbsp;v1.0</span>
        </div>
        <div class="copyright-name">
            <span>CopyRight&nbsp;2016&nbsp;&nbsp;uimaker.com&nbsp;版权所有</span>
            <i class="iconfont" >&#xe6ff;</i>
        </div>
    </div>
</div>

<script type="text/javascript" src="custom/jquery.min.js"></script>
<script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="pages/js/main.js"></script>



<script type="text/javascript">
    $('.easyui-tabs1').tabs({
        tabHeight: 44,
        onSelect:function(title,index){
            var currentTab = $('.easyui-tabs1').tabs("getSelected");
            if(currentTab.find("iframe") && currentTab.find("iframe").size()){
                currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
            }
        }
    })
    $(window).resize(function(){
        $('.tabs-panels').height($("#pf-page").height()-46);
        $('.panel-body').height($("#pf-page").height()-76)
    }).resize();

    var page = 0,
        pages = ($('.pf-nav').height() / 70) - 1;

    if(pages === 0){
        $('.pf-nav-prev,.pf-nav-next').hide();
    }
    $(document).on('click', '.pf-nav-prev,.pf-nav-next', function(){


        if($(this).hasClass('disabled')) return;
        if($(this).hasClass('pf-nav-next')){
            page++;
            $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
            if(page == pages){
                $(this).addClass('disabled');
                $('.pf-nav-prev').removeClass('disabled');
            }else{
                $('.pf-nav-prev').removeClass('disabled');
            }

        }else{
            page--;
            $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
            if(page == 0){
                $(this).addClass('disabled');
                $('.pf-nav-next').removeClass('disabled');
            }else{
                $('.pf-nav-next').removeClass('disabled');
            }

        }
    })
    function addTab(title, url){
        if ($('#tt').tabs('exists', title)){
            $('#tt').tabs('select', title);
        } else {
            var content = '<iframe name="right"  scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tt').tabs('add',{
                title:title,
                content:content,
                closable:true
            });
        }
    }

    // setTimeout(function(){
    //    $('.tabs-panels').height($("#pf-page").height()-46);
    //    $('.panel-body').height($("#pf-page").height()-76)
    // }, 200)
</script>
</body>
</html>

