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
			
			
			
			 <!-- Bradcrumb Area -->
        <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li><a href="bbsListFore.do">论坛信息</a></li>
						<li>${bbs.name }</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

            <!-- Blog Area -->
            <div class="blog-details-area bg-white section-padding-lg">
				<div class="container">

					<div class="blog-details">
						<div class="blog-item">
							<div class="blog-item-content">
								<div class="blog-item-content-inner">
									<h3 class="blog-item-title">${bbs.name }</h3>
									<span class="blog-item-author">By: <a>
									<c:forEach items="${ulist }" var="u">
											<c:if test="${u.id==bbs.uid }"><b>${u.tname }</b></c:if>
											</c:forEach></a></span>
									<div class="blog-item-meta">
										<span>${bbs.pubtime }</span>
										<!-- <span><a href="#">Comment’s : 05</a></span>
										<span><a href="#">Like : 08</a></span> -->
									</div>
									<p>${bbs.note }</p>
									</div>
							</div>
						</div>
						<!-- <div class="blog-item-share">
							<h6>Share This Post: </h6>
							<div class="social-icons">
								<ul>
									<li class="facebook"><a href="#" data-toggle="tooltip" title="" data-original-title="Facebook"><i class="ti ti-facebook"></i></a></li>
									<li class="twitter"><a href="#" data-toggle="tooltip" title="" data-original-title="Twitter"><i class="ti ti-twitter"></i></a></li>
									<li class="pinterest"><a href="#" data-toggle="tooltip" title="" data-original-title="Pinterest"><i class="ti ti-pinterest"></i></a></li>
									<li class="google-plus"><a href="#" data-toggle="tooltip" title="" data-original-title="Google-plus"><i class="ti ti-google"></i></a></li>
									<li class="linkedin"><a href="#" data-toggle="tooltip" title="" data-original-title="Linkedin"><i class="ti ti-linkedin"></i></a></li>
								</ul>
							</div>
						</div> -->
						<!-- <div class="authorbox">
							<div class="authorbox-image">
								<img src="img/author-image/author-image-1.png" alt="author image">
							</div>
							<div class="authorbox-content">
								<h5>About the Author: <a href="blog-right-sidebar.html">Admin</a></h5>
								<p>Praesent pretium tellus in tortor viverra condimentum condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel</p>
							</div>
						</div> -->
						
						<div class="blog-details-comments-area">
							<div class="commentlist">
								<h6>建议留言评论</h6>
								<c:forEach items="${list  }" var="b">

								<div class="single-comment">
									<div class="single-comment-thumb">
									<c:forEach items="${ulist }" var="u">
											<c:if test="${u.id==b.uid }"><img src="upload/${u.img }" alt="hastech logo" width="50px;" height="50px;">
											</c:if>
											</c:forEach>
										
									</div>
									<div class="single-comment-content">
										<div class="single-comment-content-top">
											<h6><a href="#"><c:forEach items="${ulist }" var="u">
											<c:if test="${u.id==b.uid }">${u.tname }</c:if>
											</c:forEach> </a> – ${b.pubtime }</h6>
											<!-- <a href="#" class="reply-button">Reply</a> -->
										</div>
										<p>${b.note }</p>
									</div>
								</div>
								</c:forEach>

								<!-- <div class="single-comment single-comment-reply">
									<div class="single-comment-thumb">
										<img src="img/author-image/author-image-2.png" alt="hastech logo">
									</div>
									<div class="single-comment-content">
										<div class="single-comment-content-top">
											<h6><a href="blog-right-sidebar.html">DEMO</a> – February 17, 2015</h6>
											<a href="#" class="reply-button">Reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p>
									</div>
								</div> -->

								<!-- <div class="single-comment">
									<div class="single-comment-thumb">
										<img src="img/author-image/author-image-1.png" alt="hastech logo">
									</div>
									<div class="single-comment-content">
										<div class="single-comment-content-top">
											<h6><a href="blog-right-sidebar.html">ADMIN</a> – February 17, 2015</h6>
											<a href="#" class="reply-button">Reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p>
									</div>
								</div> -->

							</div>
							<c:if test="${sessionScope.user==null }">
									<a href="doLogin.do" class="sf-button sf-button-sm">
										<span>登录</span>
									</a>
									</c:if>
							<c:if test="${sessionScope.user!=null }">
							<hr>

							<div class="commentbox mt-5">
								<h6>评论建议留言</h6>
								<form action="addBbs_hf.do" class="sf-form">
									<div class="sf-form-inner">
										<div class="single-input">
											<label for="new-review-textbox">内容：</label>
											<textarea id="new-review-textbox" cols="30" rows="5" name="note" id="editor_id"></textarea>
											<input type="hidden" name="btype" value="评论">
											<input type="hidden" name="gid" value="${bbs.id }">
										</div>
										<!-- <div class="single-input single-input-half">
											<label for="new-review-name">Name*</label>
											<input type="text" id="new-review-name">
										</div>
										<div class="single-input single-input-half">
											<label for="new-review-email">Email*</label>
											<input type="email" id="new-review-email">
										</div> -->
										<div class="single-input">
											<button class="sf-button sf-button-dark" type="submit"><span>提交</span></button>
										</div>
									</div>
								</form>
							</div>
							</c:if>
						</div>
					</div>

				</div>
            </div>
            <!--// Blog Area -->

		</main>
		<!--// Page Conttent -->

		
					<jsp:include page="foot.jsp"></jsp:include>
		
		 
		 
		 