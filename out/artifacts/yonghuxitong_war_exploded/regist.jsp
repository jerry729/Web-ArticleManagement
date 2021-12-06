<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<script type="text/javascript" src="js/userAdd.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<script src="js/main.js"></script>
<script src="js/emailCode.js"></script>
<%--<script type="text/javascript">
    $("#distpicker").distpicker();
</script>--%>
<jsp:include page="top.jsp"></jsp:include>

<div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
  <div class="container">
    <div class="sf-breadcrumb">
      <ul>
        <li><a href="index.do">首页</a></li>
        <li>注册</li>
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
              <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">注册</a>
            </li>

          </ul>
        </div>

        <div class="col-lg-12">
          <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
            <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
              <div class="myaccount-details">
                <form class="sf-form" action="reg.do" onsubmit="return check();"  method="post"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                  <div class="sf-form-inner">
                    <div class="single-input single-input-half">
                      <label >用户名*</label>
                      <input type="text" name="uname" id="username" required="required" placeholder="注册名" onblur="return checkuname()">
                      <span id='checku' class="spanInit" ></span>
                    </div>

                    <div class="single-input single-input-half">
                      <label for="account-details-lastname">姓名*</label>
                      <input type="text" id="account-details-lastname" name="tname" required="required">
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-lastname">年龄</label>
                      <input type="text"  name="age" >
                    </div>
                    <div class="single-input  single-input-half">
                      <label for="account-details-email">图片：</label>
                      <input type="file" id="account-details-email" name="file">
                    </div>

                    <div class="single-input  single-input-half" >
                      <label for="account-details-email">密码*</label>
                      <input name="pwd" id="txtPwd" type="password" placeholder="密码"  onblur="return checkpwd()" required="required">
                      <span id='prompt_pwd'  class="spanInit" ></span>
                    </div>
                    <div class="single-input  single-input-half">
                      <label for="account-details-email">确认密码*</label>
                      <input name="pwdc" id="txtConfirmPwd" type="password" placeholder="确认密码"  onblur="return checkpwdc()" required="required">
                      <span id='prompt_confirmpwd'  class="spanInit" ></span>
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-lastname">性别*</label>
                      <select name="sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                      </select>
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-lastname">角色*</label>
                      <select name="utype">
                        <option value="用户">用户</option>
                      </select>
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-lastname">标签</label>
                      <select name="status">
                        <option value="女性">女性</option>
                        <option value="男性">男性</option>
                        <option value="白领">白领</option>
                        <option value="年轻男性">年轻男性</option>
                      </select>
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-lastname">电话*</label>
                      <input type="text" name="tel" id="txtPhone" onblur="return checktel()" required="required" >
                      <span id='prompt_phone' class="spanInit" ></span>
                    </div>

                    <div class="single-input single-input-half" data-toggle="distpicker">
                      <label for="account-details-lastname">地址*</label>
                      <input type="text" name="address" id="address" placeholder="详细地址" required="required" >
                      <span  class="spanInit" ></span>
                    </div>
                    <div class="single-input single-input-half" data-toggle="distpicker">
                      <label for="account-details-lastname">身份证号*</label>
                      <input type="text" name="bankcard"  placeholder="身份证号" required="required" >
                      <span  class="spanInit" ></span>
                    </div>
                    <div class="single-input single-input-half">
                      <label >qq邮箱*</label>
                      <input type="email" name="email" id="email"  placeholder="请正确填写qq邮箱" >
                      <span id='checkEmail' class="spanInit" style="color: #f00;" ></span>
                    </div>
                    <div class="single-input">
                      <button class="sf-button sf-button-dark" type="submit" onclick="return checkAll()"><span>提交</span></button>
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
