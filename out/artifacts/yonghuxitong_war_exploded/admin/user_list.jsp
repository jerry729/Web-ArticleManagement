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
    <title>用户列表 - 用户管理系统 - </title>
    <jsp:include page="css.jsp"></jsp:include>
</head>
<body>

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
        <div class="right p20">



            <div class="layui-row">
                <div class="layui-col-lg4">
                    <a href="user_add.jsp" class="layui-btn">添加用户</a>
                    <%--   <a href="?/admin/user/index/connect/qq.html" class="layui-btn">QQ</a>
                       <a href="?/admin/user/index/connect/weibo.html" class="layui-btn">微博</a>
                       <a href="?/admin/user/index/connect/weixin.html" class="layui-btn">微信</a>
                       <a href="?/admin/user/index/connect/alipay.html" class="layui-btn">支付宝</a>
                       <a href="?/admin/user/index/connect/xcx.html" class="layui-btn">小程序</a>--%>
                </div>
                <form method="post" action="userListQuery.do">
                    <div class="layui-col-lg8" style="text-align: right">

                        <div class="layui-input-inline" style="width: 150px">
                            <input type="text" name="uname"  placeholder="请输入用户名" class="layui-input key">
                        </div>
                        <div class="layui-input-inline" style="width: 150px">
                            <input type="text" name="tname"  placeholder="请输入姓名" class="layui-input key">
                        </div>
                        <button type="submit" class="layui-btn sou">搜索</button>
                    </div>

                </form>

            </div>

            <table class="layui-table layui-form" lay-filter="mylist">
                <thead>
                <tr>
                    <th lay-data="{field:'xh', align:'center',width:60}">序号</th>
                    <th lay-data="{field:'yx', align:'center',width:160}">姓名</th>
                    <th lay-data="{field:'yx2', align:'center',width:100}">用户名</th>
                    <th lay-data="{field:'yx3', align:'center',minWidth:100}">密码</th>
                    <th lay-data="{field:'yx4', align:'center',minWidth:50}">性别</th>
                    <th lay-data="{field:'yx5', align:'center',minWidth:50}">图片</th>
                    <th lay-data="{field:'sr',align:'center', minWidth:100}">生日</th>
                    <th lay-data="{field:'ye',align:'center', minWidth:100}">余额</th>
                    <th lay-data="{field:'fl2',align:'center', minWidth:100}">电话</th>
                    <th lay-data="{field:'addr2',align:'center',minWidth:250}">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="u" varStatus="num">
                    <tr class="id36567">
                        <td>${num.count}</td>
                        <td>${u.tname}</td>
                        <td>${u.uname }</td>
                        <td>${u.pwd }</td>
                        <td>${u.sex }</td>
                        <td><img src="../upload/${u.img}" width="50px;" height="50px;"></td>
                        <td>${u.birthday}</td>
                        <td>${u.money}</td>
                        <td>${u.tel}</td>
                        <td class="td-manage">
                            <a title="编辑" onclick="member_edit1('550')" href="doUpdateUser.do?id=${u.id }" 	class="layui-btn layui-btn-sm "  >修改</a>
                            <c:if test="${u.uname!='admin'}">
                                <a title="删除" href="deleteUser.do?id=${u.id }"  onclick="return del(1,1,1)" class="layui-btn layui-btn-danger layui-btn-sm " >删除</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <c:if test="${sessionScope.p==2 }">
                <td colspan="8"> <c:if test="${page.page>1}">
                    <a href="userListQuery.do?page=1" >首页</a>
                    <a href="userListQuery.do?page=${page.page-1 }"> 上一页</a>
                </c:if>
                    <c:if test="${page.page<page.totalPage}">
                        <a href="userListQuery.do?page=${page.page+1 }">下一页</a>
                        <a href="userListQuery.do?page=${page.totalPage }">末页</a>
                    </c:if>
                </td>
            </c:if>

            <div class="page">
                <ul class="pagination">
                    <c:if test="${sessionScope.p==1 }">
                        <c:if test="${page.page>1}">
                            <li><a href="userList.do?page=1" >首页</a></li>
                            <li><a href="userList.do?page=${page.page-1 }"> 上一页</a></li>
                            <li class="disabled"><a>下一页</a></li>
                            <li class="disabled"><a>末页</a></li>
                        </c:if>
                        <c:if test="${page.page<page.totalPage}">
                            <li class="disabled"><a>首页</a></li>
                            <li class="disabled"><a>上一页</a></li>
                            <li><a href="userList.do?page=${page.page+1 }">下一页</a></li>
                            <li><a href="userList.do?page=${page.totalPage }">末页</a></li>
                        </c:if>
                    </c:if>
                </ul>
            </div>



        </div>
    </div>
</div>
<%--引入角色分类--%>
<jsp:include page="config.jsp"></jsp:include>
<script type="text/javascript">
    //单个删除
    function del(id,mid,iscid){
        if(confirm("您确定要删除吗?")){
            return true;
        }else{
            return false;
        }
    }

</script>
<script src="./static/admin/js/script.js"></script>
</body>
</html>
