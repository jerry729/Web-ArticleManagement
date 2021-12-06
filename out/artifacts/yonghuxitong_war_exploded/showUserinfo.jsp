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
        <li>修改个人信息</li>
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
              <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">修改个人信息</a>
            </li>

          </ul>
        </div>

        <div class="col-lg-12">
          <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
            <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
              <div class="myaccount-details">
                <form class="sf-form" action="addShowInfo.do" onsubmit="return check();"  method="post"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                  <div class="sf-form-inner">
                    <div class="single-input single-input-half">
                      <label>用户名*</label>
                      <input type="text" name="uname" id="username" value="${user.uname }" readonly="readonly"  >
                      <input type="hidden" name="id" value="${user.id }">
                    </div>
                    <c:if test="${user.utype=='用户'}">
                      <div class="single-input single-input-half">
                        <label >余额：</label>
                        <input type="text" name=""   readonly="readonly" value="${user.money }" >
                        <span  class="spanInit" ></span>
                      </div>
                    </c:if>
                   <%-- <div class="single-input single-input-half">
                      <label >积分：</label>
                      <input type="text" name=""   readonly="readonly" value="${user.jf }" >
                      <span  class="spanInit" ></span>
                    </div>--%>

                    <div class="single-input single-input-half">
                      <label >姓名*</label>
                      <input type="text"  value="${user.tname }" name="tname" required="required">
                    </div>
                    <div class="single-input single-input-half">
                      <label >年龄</label>
                      <input type="text"  name="age" value="${user.age }" >
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-email">密码*</label>
                      <input name="pwd" id="txtPwd" type="password" value="${user.pwd }" placeholder="密码"  onblur="return checkpwd()" required="required">
                      <span id='prompt_pwd'  class="spanInit" ></span>
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-email">图片：</label>
                      <img alt="" src="upload/${user.img }" width="50px" height="50px;">
                      <input type="file" id="account-details-email" name="file">
                    </div>
                    <div class="single-input single-input-half">
                      <label >性别*</label>
                      <select name="sex">
                        <option value="${user.sex }">${user.sex }</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                      </select>
                    </div>
                      <div class="single-input single-input-half">
                          <label >标签</label>
                          <select name="status">
                              <option value="${user.status}">${user.status}</option>
                              <option value="女性">女性</option>
                              <option value="男性">男性</option>
                              <option value="白领">白领</option>
                              <option value="年轻男性">年轻男性</option>
                          </select>
                      </div>
                    <div class="single-input single-input-half">
                      <label >电话*</label>
                      <input type="text" name="tel" id="txtPhone" onblur="return checktel()" value="${user.tel }" required="required" >
                      <span id='prompt_phone' class="spanInit" ></span>
                    </div>

                    <div class="single-input single-input-half" data-toggle="distpicker">
                      <label >身份证号*</label>
                      <input type="text" name="bankcard"  placeholder="身份证号" required="required" value="${user.bankcard}" >
                      <span  class="spanInit" ></span>
                    </div>

                    <div class="single-input single-input-half">
                      <label >地址*</label>
                      <input type="text" name="address" id="address"  required="required" value="${user.address }" >
                      <span  class="spanInit" ></span>
                    </div>
                    <div class="single-input">
                      <button class="sf-button sf-button-dark" type="submit" onclick="return checkAll2()"><span>提交</span></button>
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
	
	
