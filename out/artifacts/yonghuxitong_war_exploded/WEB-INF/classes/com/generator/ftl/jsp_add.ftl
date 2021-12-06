<%@page import="com.util.Info"%>
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
    <title>添加${tableNameCn} - 用户管理系统 - </title>
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
        <div class="rightEditor p20">


            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加${tableNameCn}</legend>
            </fieldset>


            <form class="layui-form " action="add${Domain}.do"  enctype="multipart/form-data" method="post">

                <#list fieldList as field>
                    <#if field.nameHump!="pubtime" && field.nameHump!="id"&& field.nameHump!="upload"&& field.nameHump!="upload2"
                    && field.nameHump!="upload3"&& field.nameHump!="note">
                      <div class="layui-form-item">
                          <label>${field.nameCn}：</label>
                          <div class="layui-input-inline">
                              <input type="text" name="${field.nameHump}" placeholder="请输入${field.nameCn}" autocomplete="off" class="layui-input">
                          </div>
                      </div>
                    </#if>
                    <#if field.nameHump=="img">
                          <div class="layui-form-item">
                              <label>${field.nameCn}：</label>
                              <div class="layui-input-inline">
                                  <input type="file" name="file" class="layui-input">
                              </div>
                          </div>
                    </#if>
                    <#if field.nameHump=="note">
                          <div class="form-group">
                              <label>${field.nameCn}：</label>
                              <textarea class="layui-textarea" id="note" rows="5" name="note"></textarea>
                          </div>
                    </#if>
                </#list>
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
