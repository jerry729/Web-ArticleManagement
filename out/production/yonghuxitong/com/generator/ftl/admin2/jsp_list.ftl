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
    <title>${tableNameCn}列表 - 用户管理系统 - </title>
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
                        <a href="doAdd${Domain}.do" class="layui-btn">添加${tableNameCn}</a>
                </div>


                <form method="post" action="${domain}ListSearch.do" class="layui-form">
                    <div class="layui-col-lg8" style="text-align: center">

                        <div class="layui-input-inline" style="width: 150px">
                            <input type="text" name="name"  placeholder="请输入${tableNameCn}名" class="layui-input key">
                        </div>
                        <#--<div class="layui-input-inline" style="width: 200px">
                            <select name="fid" class="layui-input-inline">
                                <option value="">请选择类别...</option>
                                <c:forEach items="${tlist}" var="c">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>-->
                        <button type="submit" class="layui-btn sou">搜索</button>
                    </div>

                </form>

            </div>

            <table class="layui-table layui-form" lay-filter="mylist">
                <thead>
                <tr>
                    <th lay-data="{field:'xh', align:'center',width:60}">序号</th>
                     <#list fieldList as field>
                         <#if field.nameHump!="pubtime" && field.nameHump!="id">
                             <th lay-data="{field:'${field.nameHump}', align:'center',width:160}">${field.nameCn}</th>
                         </#if>
                     </#list>
                    <th lay-data="{field:'addr2',align:'center',minWidth:250}">操作</th>
                </tr>
                </thead>
                <tbody>


                <c:forEach items=${r'"${'}list${r'}"'} var="u" varStatus="num">
                    <tr>
                        <td>${r"${"}num.count${r"}"}</td>
                    <#list fieldList as field>
                        <#if field.nameHump!="pubtime" && field.nameHump!="id">
                        <td>${r'${'}u.${field.nameHump}${r'}'}</td>
                        </#if>
                    </#list>
                        <td  class="td-manage">
                            <a title="编辑" href="doUpdate${Domain}.do?id=${r"${"}u.id${r"}"}"  class="layui-btn layui-btn-sm">编辑</a>
                            <a title="删除" href="delete${Domain}.do?id=${r"${"}u.id${r"}"}"  onclick="return del(1,1,1)" class="layui-btn layui-btn-danger  layui-btn-sm" >删除</a>
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
</body>
</html>
