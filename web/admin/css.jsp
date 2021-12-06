<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<meta name="keywords" content="用户管理系统">
<meta name="description" content="qadmin是一个轻量级后台模板,基于layui框架开发,简洁而不简单">
<link rel="stylesheet" href="./static/layui/css/layui.css">
<link rel="stylesheet" href="./static/admin/css/style.css">
<%--日期--%>
<script src="./static/laydate/laydate.js"></script>
<script>
    //执行一个laydate实例
    laydate.render({
        elem: '#start' //指定元素
    });
    laydate.render({
          elem: '#end' //指定元素
      });
</script>
<script src="./static/layui/layui.js"></script>
<script src="./static/js/jquery-3.3.1.min.js"></script>
<script src="./static/js/vue.min.js"></script>
<style>
    <!--

    -->
    .rightEditor {
        margin: 50px 0px 0px 200px;
        box-sizing: border-box;
        height: 100%;
    }
</style>