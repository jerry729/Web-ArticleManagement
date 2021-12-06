<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script charset="utf-8" src="/yonghuxitong/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/yonghuxitong/kindeditor/lang/zh-CN.js"></script>
<script>
  KindEditor.ready(function(K) {
    window.editor = K.create('#editor_id');
  });
</script>
<script>

  KindEditor.ready(function(K) {

    K.create('textarea[name="note"]', {

      uploadJson : '/yonghuxitong/kindeditor/jsp/upload_json.jsp',

      fileManagerJson : '/yonghuxitong/kindeditor/jsp/file_manager_json.jsp',

      allowFileManager : true,

      allowImageUpload : true,

      autoHeightMode : true,

      afterCreate : function() {this.loadPlugin('autoheight');},

      afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

    });

  });

</script>
<jsp:include page="top.jsp"></jsp:include>

<div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
  <div class="container">
    <div class="sf-breadcrumb">
      <ul>
        <li><a href="index.do">首页</a></li>
        <li>商品</li>
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
              <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">商品</a>
            </li>

          </ul>
        </div>

        <div class="col-lg-12">
          <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
            <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
              <div class="myaccount-details">
                <form class="sf-form" action="goodsAdd.do" onsubmit="return check();"  method="post"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                  <div class="sf-form-inner">
                    <div class="single-input single-input-half">
                      <label >商品名*</label>
                      <input type="text" name="name" id="username" required="required" placeholder="商品名" >
                      <span id='checku' class="spanInit" ></span>
                    </div>
                    <div class="single-input single-input-half">
                      <label >分类</label>
                      <select name="fid" style="z-index: 2000">
                        <c:forEach items="${tlist}" var="t">
                          <option value="${t.id}">${t.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="single-input single-input-half">
                      <label >状态</label>
                      <select name="status" style="z-index: 1000">
                        <option value="上架">上架</option>
                        <option value="下架">下架</option>
                      </select>
                    </div>
                    <div class="single-input single-input-half">
                      <label for="account-details-email">图片：</label>
                      <input type="file" id="account-details-email" name="file">
                    </div>
                    <div class="single-input single-input-half">
                      <label >单价*</label>
                      <input type="text" name="price" id="txtPhone"  required="required" >
                      <span id='prompt_phone' class="spanInit" ></span>
                    </div>
                    <div class="single-input ">
                      <label >商品详情</label>
                      <textarea name="note" id="editor_id" style="width:100%;height:200px;"  placeholder="请输入说明" class="layui-textarea"></textarea>
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
