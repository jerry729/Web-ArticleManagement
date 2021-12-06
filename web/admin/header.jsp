<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--顶栏-->
<header>
    <h1 v-text="webname"></h1>
    <div class="breadcrumb">
        <i class="layui-icon">&#xe715;</i>
        <ul>
            <li v-for="vo in address">
                <a v-text="vo.name" :href="vo.url"></a> <span>/</span>
            </li>
        </ul>
    </div>
</header>
<style>
  .h{
    overflow-y: scroll;
    padding-right:10px;
    height: 90%;
  }
</style>