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
    <title>修改文章 - 用户管理系统 - </title>
    <jsp:include page="css.jsp"></jsp:include>
</head>
<body>
<style>
  .h{
    overflow-y: scroll;
    padding-right:10px;
    height: 90%;
  }
</style>
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
        <div class="rightEditor p20">



            <!-- 配置文件 -->
            <script type="text/javascript" src="./static/ueditor/ueditor.config.js"></script>
            <!-- 编辑器源码文件 -->
            <script type="text/javascript" src="./static/ueditor/ueditor.all.js"></script>


            <fieldset class="layui-elem-field layui-field-title">
                <legend>修改文章</legend>
            </fieldset>


            <form class="layui-form h" action="updateBook.do"  method="post"> <%--enctype="multipart/form-data"--%>


                <div class="layui-form-item">
                    <label class="layui-form-label">名称：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" placeholder="请输入文章名称" autocomplete="off" class="layui-input" value="${book.name }">
                        <input type="hidden" name="id"  value="${book.id}" />
                    </div>
                    <div class="layui-form-mid layui-word-aux"  ></div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block" >
                        <textarea id="note" name="note" style="width:600px;height:200px;" class="layui-textarea" >${book.note}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" type="submit" lay-filter="submit">立即提交</button>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%--引入角色分类--%>
<jsp:include page="config.jsp"></jsp:include>

<script src="./static/admin/js/script.js"></script>
</body>
</html>

