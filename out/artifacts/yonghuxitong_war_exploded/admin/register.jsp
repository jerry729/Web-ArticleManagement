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
  <title>用户注册 - 用户管理系统 - </title>
  <jsp:include page="css.jsp"></jsp:include>
  <script src="./static/js/register.js"></script>
</head>
<body>

<div id="app">
  <!--顶栏-->
 <%-- <jsp:include page="header.jsp"></jsp:include>--%>

  <div class="main">
    <!--左栏-->
   <%-- <div class="left">
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
    </div>--%>
    <!--右侧-->
    <%--<div class="right p20">--%>
      <div class="p20">


      <fieldset class="layui-elem-field layui-field-title">
        <legend>添加用户</legend>
      </fieldset>


      <form class="layui-form h" action="addRegister.do" method="post" enctype="multipart/form-data">


        <div class="layui-form-item">
          <label class="layui-form-label">用户名：</label>
          <div class="layui-input-inline">
            <input type="text" name="uname" id="uName"  onblur="return checkUName()"  placeholder="" autocomplete="off" class="layui-input" required>
            <%--<div id='checku' class="tips"></div>--%>
          </div>
          <div class="layui-form-mid layui-word-aux" id='checkUName' ></div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">姓名：</label>
          <div class="layui-input-inline">
            <input type="text" name="tname" placeholder="" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">图片：</label>
          <div class="layui-input-inline">
            <input type="file" name="file" placeholder="" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">邮箱：</label>
          <div class="layui-input-inline">
            <input type="email" name="email" placeholder="" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">电话：</label>
          <div class="layui-input-inline">
            <input type="text" name="tel"  id="tel"  onblur="return checkTel()" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux" id='checkTel' ></div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">密码：</label>
          <div class="layui-input-inline">
            <input type="password"  id="pwd"  onblur="return checkPwd()" placeholder="请输入密码" autocomplete="off" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux" id='checkPwd' ></div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">确认密码：</label>
          <div class="layui-input-inline">
            <input type="password"  id="pwdc" name="pwd"   onblur="return checkPwdc()" placeholder="请输入密码" autocomplete="off" class="layui-input" required>
          </div>
          <div class="layui-form-mid layui-word-aux" id='checkPwdc' ></div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">性别：</label>
          <div class="layui-input-inline">
            <input type="radio" name="sex"   autocomplete="off" class="layui-input" value="男" checked> 男
            <input type="radio" name="sex"   autocomplete="off" class="layui-input" value="女" > 女
          </div>
          <%--<div class="layui-form-mid layui-word-aux" id='checkTel' ></div>--%>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">地址：</label>
          <div class="layui-input-inline">
            <input type="text" name="address"  placeholder="请输入地址" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">余额：</label>
          <div class="layui-input-inline">
            <input type="number" name="money"  placeholder="请输入余额" value="1" autocomplete="off" class="layui-input" required>
          </div>
        </div>

        <div class="layui-form-item">
          <label class="layui-form-label">生日：</label>
          <div class="layui-input-inline">
            <input type="text" name="birthday"  placeholder="请输入生日" autocomplete="off" class="layui-input">
          </div>
        </div>

        <%--<div class="layui-form-item">
          <label class="layui-form-label">内容</label>
          <div class="layui-input-block" style="width:1000px;">
            <script id="container" name="body" style="height: 500px" type="text/plain"></script>
                        </div>
                        </div>--%>

        <%--<div class="layui-form-item">
            <label class="layui-form-label">关键词</label>
            <div class="layui-input-inline">
            <input type="text" name="key" placeholder="用英文豆号隔开" autocomplete="off" class="layui-input">
            </div>
            </div>--%>

        <%--  <div class="layui-form-item">
          <label class="layui-form-label">附件地址</label>
          <div class="layui-input-inline">
          <input type="text" name="file" id="file_url" placeholder="不上传就留空 可使用外链http://" autocomplete="off" class="layui-input">
          </div>
          <div class="layui-word-aux">
          <button type="button" class="layui-btn" id="file">
          <i class="layui-icon"></i>在线上传
      </button>
      </div>
      </div>--%>
        <%--<div class="layui-form-item">
            <label class="layui-form-label">是否置顶</label>
            <div class="layui-input-block">
            <input type="checkbox" value="1" name="top" lay-text="开启|关闭" lay-skin="switch">
            </div>
            </div>--%>
        <%--  <div class="layui-form-item">
          <label class="layui-form-label">是否显示</label>
          <div class="layui-input-block">
          <input type="checkbox" value="1" name="state" lay-text="开启|关闭" checked="" lay-skin="switch">
          </div>
          </div>--%>
        <div class="layui-form-item">
          <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" type="submit" lay-filter="submit" onsubmit="checkAll()">立即提交</button>

          </div>
        </div>
      </form>

    </div>
  </div>
</div>
<%--引入角色分类--%>
<%--<jsp:include page="config.jsp"></jsp:include>--%>


<script src="./static/admin/js/script.js"></script>
</body>
</html>

