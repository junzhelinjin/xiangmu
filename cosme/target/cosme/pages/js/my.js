
function datagridInit(url,cols,selector){
   var a=$('#tt');
      if(selector) a=selector;
    a.datagrid({
        rownumbers:true,
        nowrap: true,
        fit:true,
        pagination:true,
        fitColumns:true,
        remoteSort:true,
        singleSelect: true,
        toolbar:'#tb',
        striped:true,
        url:url,
        columns:[cols]
    });
}

$('#tt').datagrid({
    onDblClickRow: function(index,field){
        openEdit();
    }
});
function reload(){
    $('#tt').datagrid('reload');
}
$.fn.datebox.defaults.formatter = function(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + "年" + (m < 10 ? ("0" + m) : m) + "月"
        + (d < 10 ? ("0" + d) : d) + "日";
};
$.fn.datebox.defaults.parser = function(s) {
    if (!s)
        return new Date();
    var yStr = s.substr(0, 4);
    var mStr = s.substr(5, 2);
    var dStr = s.substr(8, 2);

    var y = parseInt(yStr, 10);
    var m = parseInt(mStr, 10);
    var d = parseInt(dStr, 10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
        return new Date(y, m - 1, d);
    } else {
        return new Date();
    }
};

function addTab(title,url){
    parent.addTab(title,url);
}
var alldata=null;
function  openDialog(title,url,width,height,fn,data) {
    $('#dd').dialog({
        closed: false,
        modal:true,
        href:url,
        title: title,
        width:width,
        height:height,
        buttons: [{
            text: "保存",
            iconCls: 'icon-ok',
            handler: fn
        }, {
            text: "关闭",
            iconCls: 'icon-cancel',
            handler: function () {
                $('#dd').dialog('close');

            }
        }]
    });
    if(data) alldata=data;
    else alldata=null;
}
