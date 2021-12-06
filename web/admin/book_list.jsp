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
    <title>文章列表 - 用户管理系统 - </title>
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
            <%--<div class="layui-row">
                <div class="layui-col-lg4">
                    <a href="book_add.jsp" class="layui-btn">添加文章</a>
                </div>


                <form method="post" action="bookListSearch.do" class="layui-form">
                    <div class="layui-col-lg8" style="text-align: center">

                        <div class="layui-input-inline" style="width: 150px">
                            <input type="text" name="name"  placeholder="请输入文章名" class="layui-input key">
                        </div>
                        <button type="submit" class="layui-btn sou">搜索</button>
                    </div>

                </form>

            </div>--%>
                <%--<fieldset class="layui-elem-field layui-field-title">
                    <legend>用户文章信息维护</legend>
                </fieldset>--%>

                   <%-- <div class="layui-form-item">
                        <label class="layui-form-label">用户名：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uname" id="uName"  value="${user.uname}"   placeholder="" autocomplete="off" class="layui-input" readonly>
                            <input type="hidden"  value="${user.id }" name="id" />
                        </div>
                        <div class="layui-form-mid layui-word-aux" id='checkUName' ></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="email" placeholder="" value="${user.email}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">余额：</label>
                        <div class="layui-input-inline">
                            <input type="number" name="money"  placeholder="请输入余额" value="${user.money}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">生日：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="birthday"  placeholder="请输入生日" value="${user.birthday}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>--%>


                   <%-- <fieldset class="layui-elem-field layui-field-title">
                        <legend>文章列表</legend>
                    </fieldset>--%>

             <%--   <div class="layui-row">
                    <div class="layui-col-lg4">
                        <a href="book_add.jsp" class="layui-btn">添加文章</a>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uname" id="uName"  value="${user.uname}"   placeholder="" autocomplete="off" class="layui-input" readonly>
                            <input type="hidden"  value="${user.id }" name="id" />
                        </div>
                        <div class="layui-form-mid layui-word-aux" id='checkUName' ></div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="email" placeholder="" value="${user.email}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">余额：</label>
                        <div class="layui-input-inline">
                            <input type="number" name="money"  placeholder="请输入余额" value="${user.money}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">生日：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="birthday"  placeholder="请输入生日" value="${user.birthday}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>
                    <form method="post" action="bookListSearch.do" class="layui-form">
                        <div class="layui-col-lg8" style="text-align: center">

                            <div class="layui-input-inline" style="width: 150px">
                                <input type="text" name="name"  placeholder="请输入文章名" class="layui-input key">
                            </div>
                            <button type="submit" class="layui-btn sou">搜索</button>
                        </div>

                    </form>

                </div>--%>


                <div class="layui-row">


                    <%--<div class="layui-form-item">
                        <label class="layui-form-label">用户名：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uname" id="uName"  value="${user.uname}"   placeholder="" autocomplete="off" class="layui-input" readonly>
                            <input type="hidden"  value="${user.id }" name="id" />
                        </div>
                        <div class="layui-form-mid layui-word-aux" id='checkUName' ></div>
                    </div>--%>
                </div>


            <div class="layui-row">


                <div class="layui-col-lg2">
                    用户名: <span style="color: #b21f2d">${user.uname}</span>
                </div>
                <div class="layui-col-lg2">
                    邮箱：<span style="color: #b21f2d">${user.email}</span>
                </div>
                <div class="layui-col-lg2">
                    余额：<span style="color: #b21f2d">${user.money}</span>
                </div>
                <div class="layui-col-lg2">
                    生日：<span style="color: #b21f2d">${user.birthday}</span>
                </div>

                <div class="layui-col-lg1">
                        <a href="book_add.jsp" class="layui-btn">添加文章</a>
                </div>
                <form method="post" action="bookListSearch.do" class="layui-form">
                    <div class="layui-col-lg3" style="text-align: center">

                        <div class="layui-input-inline" style="width: 200px">
                            <input type="text" name="name"  placeholder="请输入文章名" class="layui-input key">
                        </div>
                        <button type="submit" class="layui-btn sou">搜索</button>
                    </div>
                </form>
            </div>

            <table class="layui-table layui-form" lay-filter="mylist">
                <thead>
                <tr>
                    <th lay-data="{field:'xh', align:'center',width:60}">序号</th>
                    <th lay-data="{field:'yx0', align:'center',minWidth:160}">名称</th>
                    <%--<th lay-data="{field:'uid', align:'center',minWidth:60}">发布人</th>--%>
                    <th lay-data="{field:'fl4',align:'center', minWidth:100}">内容</th>
                    <%--<th lay-data="{field:'kc',align:'center', minWidth:100}">时间</th>--%>
                    <th lay-data="{field:'addr2',align:'center',minWidth:250}">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="u" varStatus="num">
                    <tr class="id36567">
                        <td>${num.count}</td>
                        <td>${u.name}</td>
                        <%--<td><c:forEach items="${ulist}" var="t">
                            <c:if test="${t.id==u.uid}">
                                ${t.tname}
                            </c:if>
                        </c:forEach></td>--%>
                        <td>${u.note}</td>
                       <%-- <td>${u.pubtime}</td>--%>
                        <td class="td-manage">
                            <c:if test="${sessionScope.auser.utype=='管理员'||sessionScope.auser.utype=='用户'}">
                            <a title="编辑" onclick="member_edit1('550')" href="doUpdateBook.do?id=${u.id }"  class="layui-btn  layui-btn-sm">修改</a>
                             <a title="查看" onclick="member_edit1('550')" href="lookBook.do?id=${u.id }"  class="layui-btn  layui-btn-sm">查看</a>
                            <a title="删除" href="deleteBook.do?id=${u.id }"  onclick="return del(1,1,1)" class="layui-btn layui-btn-danger  layui-btn-sm" >删除</a>
                            </c:if>
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

