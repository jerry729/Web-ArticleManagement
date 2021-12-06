<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员登陆 - 用户管理系统</title>
    <meta name="keywords" content="用户管理系统">
    <meta name="description" content="qadmin是一个轻量级后台模板,基于layui框架开发,简洁而不简单">
    <link rel="stylesheet" href="./static/layui/css/layui.css">
    <link rel="stylesheet" href="./static/admin/css/login.css">
    <script src="./static/layui/layui.js"></script>
</head>

<body id="login">
<div class="login">
    <h2>用户管理系统</h2>
    <form class="layui-form" method="post" target="_blank" action="#">
        <div class="layui-form-item">
            <input type="username" name="uname" id="uname" placeholder="用户名" class="layui-input">
            <i class="layui-icon input-icon">&#xe66f;</i>
        </div>
        <div class="layui-form-item">
            <input type="password" name="pwd" id="pwd"  placeholder="密码" class="layui-input">
            <i class="layui-icon input-icon">&#xe673;</i>
        </div>
       
        <div class="layui-form-item">
			<select name="utype" id="utype" style="display:block;" class="layui-input">
				<option value="管理员">管理员</option>
				<option value="用户">用户</option>
			</select>
            <%--<input type="checkbox" name="box" lay-skin="primary" title="记住密码" checked="">
            <a class="back" href="javascript:;"style="margin-top: 10px">忘记密码</a>--%>
            <a class="back" href="register.jsp"style="margin-top: 10px">注册新用户</a>
        </div>
        <div id="loginInfo"></div>
        <div class="layui-form-item">
            <button style="width: 100%" type="button" class="layui-btn" lay-button  lay-filter="login" onclick=" return checkLogin();">立即登录</button>

        </div>
    </form>
<script  src="static/js/jquery-3.3.1.min.js"></script>
    <script>
        function checkLogin() {
            var uname = $("#uname").val();
            var pwd = $("#pwd").val();
            var utype = $("#utype").val();
            console.log("uname=="+uname);
            console.log("pwd=="+pwd);
            if (uname == "" || pwd == "") {
                $("#loginInfo").html("用户名或者密码不能为空！");
                return false;
            } else {
                $.ajax({
                    url : "alogin.do",
                    type : "post",
                    data : {
                        "uname" : uname,
                        "pwd" : pwd,
                        "utype" : utype,
                    },
                    //data:"incode="+incode,
                    dataType : "json",
                    success : function(result) {
                        console.log("info=="+result.info);
                        if (result.info == 'ng') {
                            $("#loginInfo").html("用户名、角色或者密码不正确，请重新输入！");
                            return false;
                        } else {
                            $("#loginInfo").html("登录成功！");
                            window.location.href='index2.jsp'
                            $("#loginInfo").html("");
                            return true;
                        }
                    },
                    error : function() {
                        alert("服务器繁忙，请稍后再试！");
                    }
                })
            }
        }


        /*layui.use('form', function () {
            var form = layui.form,
                layer = layui.layer,
                $ = layui.jquery;

            form.on('submit(login)', function (data) {
                layer.load({
                    shade: 0.5,
                    time: 0,
                });
                setTimeout(function () {
                    window.location.href = 'index.html';
                }, 1000)

                return false;
            });
        });*/
    </script>
</div>
</body>

</html>



