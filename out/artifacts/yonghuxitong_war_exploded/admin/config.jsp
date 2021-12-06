<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<c:if test="${sessionScope.auser.utype=='管理员'}">
    <script src="./static/admin/js/config.js"></script>
</c:if>
<c:if test="${sessionScope.auser.utype=='用户'}">
    <script src="static/admin/js/config_yh.js"></script>
</c:if>
<c:if test="${sessionScope.auser==null}">
    <script src="./static/admin/js/config_loginOut.js"></script>
</c:if>



<%--编辑器--%>
<%--<script charset="utf-8" src="/yonghuxitong/kindeditor/lang/zh-CN.js"></script>--%>
<script charset="utf-8" src="/yonghuxitong/kindeditor/kindeditor.js"></script>

<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#note');
    });
</script>
<script>

    KindEditor.ready(function(K) {

        K.create('textarea[id="note"]', {

            uploadJson : '/yonghuxitong/kindeditor/jsp/upload_json.jsp',

            fileManagerJson : '/yonghuxitong/kindeditor/jsp/file_manager_json.jsp',

            allowFileManager : true,

            allowImageUpload : true,

            autoHeightMode : true,

            afterCreate : function() {this.loadPlugin('autoheight');},

            afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

        });

    });

</script>

<script type="text/javascript">
    //静态表格
    layui.use('table',function(){
        var table = layui.table;
        //转换静态表格
        table.init('mylist', {
            height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
            ,count: 50 //数据总数 服务端获得
            ,limit: 5 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            ,page:true //开启分页
            /* ,toolbar: '#toolbarDemo' *///工具栏
            /*  ,defaultToolbar:['filter', 'exports'] */
            ,limits:[ 5, 10, 15, 20, 30, 50]//分页显示每页条目下拉选择
            ,cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
        });
        //监听行工具事件
        table.on('tool(mylist)', function(obj){ //注：tool 是工具条事件名，mylist 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                alert(layEvent);
                layer.msg('修改操作');
            }
        });
        //监听头工具栏事件
        table.on('toolbar(mylist)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            /* switch(obj.event){
            case 'getCheckLength':
                if(data.length === 0){
                layer.msg('请选择一行');
                } else {
                layer.msg('删除');
                }
            break;
            }; */
        });
    });
    //  iframe层  详情信息
    function add(){
        //iframe层
        layer.open({
            type: 2,//层类型
            title: "添加",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['1000px', '1000px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['user_add.jsp', 'yes'], //iframe的url，no代表不显示滚动条
        });

    }
</script>

