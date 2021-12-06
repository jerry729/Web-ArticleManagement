<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户文章统计列表 - 用户管理系统 - </title>
    <jsp:include page="css.jsp"></jsp:include>
</head>

<%--统计列表--%>
<script src="static/dist/echarts.js"></script>
<body onload="tj()">

<div id="app">
    <!--顶栏-->
    <jsp:include page="header.jsp"></jsp:include>

    <div class="main">
        <!--左栏-->
        <div class="left">
            <ul class="cl">
                <!--顶级分类-->
                <li v-for="vo,index in menu" :class="{hidden:vo.hidden}">
                    <a href="javascript:;" :class="{active:vo.active}" @click="onActive(index)">
                        <i class="layui-icon" v-html="vo.icon"></i>
                        <span v-text="vo.name"></span>
                        <i class="layui-icon arrow" v-show="vo.url.length==0">&#xe61a;</i> <i v-show="vo.active"
                                                                                              class="layui-icon active">&#xe623;</i>
                    </a>
                    <!--子级分类-->
                    <div v-for="vo2,index2 in vo.list">
                        <a href="javascript:;" :class="{active:vo2.active}" @click="onActive(index,index2)"
                           v-text="vo2.name"></a>
                        <i v-show="vo2.active" class="layui-icon active">&#xe623;</i>
                    </div>
                </li>
            </ul>
        </div>


        <!--右侧-->
        <div class="right p20" style=" overflow-x:scroll;overflow-y:scroll;">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>学生发布文章图表</legend>
            </fieldset>
            <div class="layui-row">
                <div class="t_Record" >
                    <div id="main" style="height:400px; overflow:hidden; width:80%; overflow:auto"  ></div>
                </div>
            </div>



            <fieldset class="layui-elem-field layui-field-title">
                <legend>用户列表</legend>
            </fieldset>
            <table class="layui-table layui-form" lay-filter="mylist" style="height: 100px;">
                <thead>
                <tr>
                    <th lay-data="{field:'xh', align:'center',minWidth:60}">序号</th>
                    <th lay-data="{field:'yx', align:'center',minWidth:160}">姓名</th>
                    <th lay-data="{field:'yx2', align:'center',minWidth:100}">文章数量</th>
                    <th lay-data="{field:'addr2',align:'center',minWidth:250}">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="u" varStatus="num">
                    <tr class="id36567">
                        <td>${num.count}</td>
                        <td>${u.tname}</td>
                        <td>${u.bnum }</td>
                        <td class="td-manage">
                            <a title="进入文章管理" onclick="member_edit1('550')" href="bookListSearch.do?uid=${u.id }" 	class="layui-btn layui-btn-sm "  >进入文章管理</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%--引入角色分类--%>
<jsp:include page="config.jsp"></jsp:include>

<script src="./static/admin/js/script.js"></script>

<script type="text/javascript">

    var arry =null;
    var arry2 =null;
    function tj() {
        var start = $("#start").val();
        var end=$("#end").val();
        if (start ==""||end=="") {
        } else {
            $.ajax({
                url : "tj.do",
                type : "post",
                data :{"stime":start,"etime":end},
                dataType : "json",
                success:function(result){
                    //alert(result.xmlstr);
                    //alert(result.stu);
                    //alert(result.account);
                    arry = result.stu;
                    arry2 = result.account;

                    require(
                        [
                            'echarts',
                            'echarts/theme/macarons',
                            'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                            'echarts/chart/bar'
                        ],
                        function (ec,theme) {
                            var myChart = ec.init(document.getElementById('main'),theme);

                            option = {
                                title : {
                                    text: '学生发表文章统计',
                                    subtext: ''
                                },
                                tooltip : {
                                    trigger: 'axis'
                                },
                                legend: {
                                    //  data:['订单总额','待付款','已付款','代发货']
                                    data:['文章数量']
                                },
                                toolbox: {
                                    show : true,
                                    feature : {
                                        mark : {show: true},
                                        dataView : {show: true, readOnly: false},
                                        magicType : {show: true, type: ['line', 'bar']},
                                        restore : {show: true},
                                        saveAsImage : {show: true}
                                    }
                                },
                                calculable : true,
                                xAxis : [
                                    {
                                        type : 'category',
                                        data : arry
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'value'
                                    }
                                ],
                                series : [
                                    {
                                        name:'文章数量',
                                        type:'bar',
                                        data:arry2,
                                        markPoint : {
                                            data : [
                                                {type : 'max', name: '最大值'},
                                                {type : 'min', name: '最小值'}
                                            ]
                                        }
                                    }
                                ]
                            };

                            myChart.setOption(option);
                        }
                    );

                    /* $(".t_Record").show();
                    $("#main").show(); */
                },
                error:function(){
                    alert("error");
                }

            })
        }

    }


    $(document).ready(function(){

        $(".t_Record").width($(window).width()-60);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $(".t_Record").width($(window).width()-60);
        });
        /*  $(".btn_search").click(function(){
                $(".t_Record").width($(window).width()-60);
               });  */
    });

    require.config({
        paths: {
            echarts: './static/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            'echarts/chart/bar'
        ],
        function (ec,theme) {
            var myChart = ec.init(document.getElementById('main'),theme);

            option = {
                title : {
                    text: '学生发表文章统计',
                    subtext: ''
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    //  data:['订单总额','待付款','已付款','代发货']
                    data:['文章数量']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        data : arry
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'文章数量',
                        type:'bar',
                        data:arry2,
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        }
                    }

                ]
            };

            myChart.setOption(option);
        }
    );






</script>

</body>
</html>
