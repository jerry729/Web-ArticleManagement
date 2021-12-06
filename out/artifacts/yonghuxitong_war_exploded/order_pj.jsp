<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script type="text/javascript" src="js/userAdd.js"></script>
<jsp:include page="top.jsp"></jsp:include>

<div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
  <div class="container">
    <div class="sf-breadcrumb">
      <ul>
        <li><a href="index.do">首页</a></li>
        <li>订单评价</li>
      </ul>
    </div>
  </div>
</div>
<!--// Bradcrumb Area -->

<!-- Page Conttent -->
<main class="page-content">

  <!-- Account Page Area -->
  <div class="account-page-area section-padding-lg">
    <div class="container">
      <div class="row">

        <div class="col-lg-12">
          <ul class="nav myaccount-tab-trigger" id="account-page-tab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">订单详情</a>
            </li>

          </ul>
        </div>

        <div class="col-lg-12">
          <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
            <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
              <div class="myaccount-details">
                <form class="sf-form" action="addOrderPj.do" onsubmit="return check();"  method="post"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                  <div class="sf-form-inner">
                    <div class="single-input single-input-half">
                      <label >订单编号：</label>
                      <input type="text"  readonly="readonly" value="${order.ono }" >
                      <input type="hidden"  name="kid" value="${order.kid }" >
                      <span id='checku' class="spanInit" ></span>
                    </div>
                    <div class="single-input single-input-half">
                      <label >订单时间：</label>
                      <input type="text"   value="${order.stime }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half">
                      <label >订单总价：</label>
                      <input type="text"   value="${order.zprice }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half">
                      <label >订单状态：</label>
                      <input type="text"   value="${order.status }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half ">
                      <label >订单名称：：</label>
                      <input type="text"   value="${goods.name }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half ">
                      <label >订单量：</label>
                      <input type="text"   value="${order.amount }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half">
                      <label >用户姓名：</label>
                      <input type="text"   value="${user.tname }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half">
                      <label >用户账号：</label>
                      <input type="text"   value="${user.uname }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half">
                      <label >用户电话：</label>
                      <input type="text"   value="${user.tel }" readonly="readonly">
                    </div>
                    <div class="single-input single-input-half">
                      <label >用户地址：</label>
                      <c:forEach items="${dlist}" var="d">
                        <c:if test="${order.dzid==d.id}">
                          <input type="text"   value="${d.name }" readonly="readonly">
                        </c:if>
                      </c:forEach>
                    </div>
                    <div class="single-input single-input-half">
                      <label >评价内容：</label>
                      <textarea id="new-review-textbox" name="pj" cols="30" id="editor_id" rows="5" required="required"></textarea>
                    </div>
                    <div class="single-input">
                      <button class="sf-button sf-button-dark" type="submit"><span>提交</span></button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--// Account Page Area -->

</main>


<jsp:include page="foot.jsp"></jsp:include>
