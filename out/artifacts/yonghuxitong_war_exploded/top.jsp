<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>用户管理系统</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Favicon -->
  <%--<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">--%>
  <link rel="apple-touch-icon" href="img/icon.png">

  <!-- Google font (font-family: 'Roboto', sans-serif;) -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
  <!-- Google font (font-family: 'Poppins', sans-serif;) -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">

  <!-- Plugins -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/plugins.css">

  <!-- Style Css -->
  <link rel="stylesheet" href="css/style.css">

  <!-- Custom Styles -->
  <link rel="stylesheet" href="css/custom.css">
</head>
<style>
  .page-content{
    margin-top: -125px;
  }

</style>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Add your site or application content here -->

<!-- Wrapper -->
<div id="wrapper" class="wrapper">
  <!-- Header -->
  <header class="header sticky-header">

    <!-- Header Top Area -->
    <div class="header-top-area">
      <div class="container">
        <div class="header-top-inner">
          <div class="header-top-left">
            <h3 style="color:#009688;">用户管理系统</h3>
          </div>
          <ul class="header-options">

            <c:if test="${sessionScope.user==null }">
              <li>
                <a href="doLogin.do">登录</a>
              </li>
              <li>
                <a href="regist.jsp">注册</a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user!=null }">
              <li>
                <a href="loginOut.do">注销</a>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
    </div>
    <!--// Header Top Area -->

    <!-- Header Bottom Area -->
    <div class="header-bottom-area d-none d-lg-block">
      <div class="container">
        <div class="header-bottom-inner">
          <a href="index.do" class="header-logo">
            <!-- <img src="admin/images/logo01.png" alt="用户管理系统"> -->
          </a>
          <nav class="sf-navigation">
            <ul>
              <li><a href="index.do">首页</a>

              </li>
              <li><a href="showNews.do?id=1">关于我们</a> </li>
              <li><a href="showNews.do?id=2">联系我们</a> </li>
              <li><a href="newsListFore.do">公告</a>
                <ul>
                  <c:forEach items="${ntlist }" var="t">
                    <li><a href="searchNews.do?fid=${t.id }">${t.name }</a></li>
                  </c:forEach>
                </ul>
              </li>
              <li><a href="index.do">商品分类</a>
                <ul>
                  <c:forEach items="${gtlist }" var="t">
                    <li><a href="showGoodsType.do?fid=${t.id }">${t.name }</a></li>
                  </c:forEach>
                </ul>
              </li>
              <li><a href="usersListFore.do">商家</a></li>
              <li><a href="goodsListFore.do">商品</a></li>
              <li><a href="goodsListFore_tj.do">推荐商品</a></li>
              <li><a href="myBbsList.do">建议留言</a></li>
              <li><a href="doAddMoney.do">充值</a></li>
              <li><a href="showShop.do">购物车</a></li>
              <c:if test="${sessionScope.user!=null }">
                <li><a href="showInfo.do"><img alt="" src="upload/${sessionScope.user.img }" width="50px;" height="50px;"> ${sessionScope.user.uname }</a>
                  <ul>
                    <li><a href="showInfo.do">我的信息</a></li>
                    <c:if test="${sessionScope.user.utype=='用户'}">
                      <li><a href="siteList.do">我的地址</a></li>
                      <li><a href="keepList.do">我的收藏</a></li>
                      <li><a href="shopList.do">我的订单</a></li>
                    </c:if>
                    <li><a href="myBbsList_pl.do">我的评论</a></li>
                    <li><a href="myBbsList.do">我的建议留言</a></li>
                  </ul>
                </li>
              </c:if>
              <li><a href="admin/login.jsp" target="_blank;">后台</a></li>
            </ul>
          </nav>
          <ul class="header-icons">
            <li>
              <button class="header-search-trigger"><i class="ti ti-search"></i></button>
              <div class="header-searchbox-wrapper">
                <form class="header-searchbox" action="searchGoods.do" method="post">
                  <input type="text" name="name" placeholder="输入商品名称">
                  <button><i class="ti ti-search"></i></button>
                </form>
              </div>
            </li>

          </ul>
        </div>
      </div>
    </div>
    <!--// Header Bottom Area -->

    <!-- Header Mobile Menu -->
    <div class="mobile-menu-area d-block d-lg-none">
      <div class="container">
        <div class="mobile-menu clearfix">
          <ul class="header-icons">
            <li>
              <button class="header-search-trigger"><i class="ti ti-search"></i></button>
              <div class="header-searchbox-wrapper">
                <form class="header-searchbox" action="searchGoods.do" method="post">
                  <input type="text" name="name" placeholder="输入商品名称">
                  <button><i class="ti ti-search"></i></button>
                </form>
              </div>
            </li>

          </ul>
          <a href="index.do" class="logo">
            <img src="admin/images/logo01.png" alt="用户管理系统">
          </a>
        </div>
      </div>
    </div>
    <!--// Header Mobile Menu -->

  </header>
  <!--// Header -->








			
