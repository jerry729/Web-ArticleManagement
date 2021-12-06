<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

		
			<jsp:include page="top.jsp"></jsp:include>
			
			
			
			
			 <!-- Bradcrumb Area -->
        <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li><a href="goodsListFore.do">商品信息</a></li>
						<li>${goods.name }</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

            <!-- Product Page Wrapper -->
            <div class="product-page-wrapper section-padding-lg">
                <div class="container">

                    <!-- Product Details Inner -->
                    <div class="row product-details">

                        <!-- Product Details Left -->
						<div class="col-lg-5 col-md-6">
							<div class="product-details-left">
								<div class="product-details-images slider-navigation-2">
									<a href="upload/${goods.img }">
										<img src="upload/${goods.img }" alt="product image" width="470px;" height="624px;">
									</a>
									<!-- <a href="img/product/large-size/product-image-2.jpg">
										<img src="img/product/thumbnail-size/product-image-2.jpg" alt="product image">
									</a>
									<a href="img/product/large-size/product-image-3.jpg">
										<img src="img/product/thumbnail-size/product-image-3.jpg" alt="product image">
									</a>
									<a href="img/product/large-size/product-image-4.jpg">
										<img src="img/product/thumbnail-size/product-image-4.jpg" alt="product image">
									</a> -->
								</div>
							<%-- 	<div class="product-details-thumbs slider-navigation-2">										
									<img src="upload/${goods.img }" alt="product image thumb"  width="105px" height="140px;">
									<!-- <img src="img/product/small-size/product-image-3.jpg" alt="product image thumb">
									<img src="img/product/small-size/product-image-4.jpg" alt="product image thumb"> -->
								</div> --%>
							</div>
						</div>
                        <!--// Product Details Left -->

                        <!-- Product Details Right -->
                        <div class="col-lg-7 col-md-6">
							<div class="product-details-right">
								<h5 class="product-title">${goods.name }</h5>
								
								<div class="ratting-stock-availbility">
									<div class="ratting-box">
										<!-- <span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span> -->
									</div>
									<span class="stock-available">订单量：${goods.xnum }</span>
								</div>
								<p></p>
								
								<span class="pricebox"><!-- <del>$60.00</del>  -->￥：${goods.price }</span>

								<div class="product-details-quantity">
									<!-- <div class="quantity-select">
										<input type="text" value="1">
									</div> -->
									 <c:if test="${sessionScope.user!=null }">

                                        <%-- <c:if test="${sessionScope.user.id!=goods.uid}">--%>
                                             <c:if test="${goods.kcstatus=='正常'}">
                                                 <a href="addshop.do?fid=${goods.id }" class="sf-button sf-button-sm">
                                                     <span>加入购物车</span>
                                                 </a>
                                             </c:if>

                                       <%--  </c:if>--%>
                     <a href="addKeep.do?fid=${goods.id }" class="sf-button sf-button-sm">
                       <span>收藏</span>
                     </a>
                                         <c:if test="${sessionScope.user.id==goods.uid}">
                                             <span class="sf-button sf-button-sm">自己发布的商品</span>
                                         </c:if>


									</c:if>
									<c:if test="${sessionScope.user==null }">
									<a href="doLogin.do" class="sf-button sf-button-sm">
										<span>登录</span>
									</a>
									</c:if>
									<c:if test="${sessionScope.user==null }">
									<a href="regist.jsp" class="sf-button sf-button-sm">
										<span>注册</span>
									</a>
									</c:if>
                 <%-- <c:if test="${sessionScope.user!=null }">
                    <a href="doAddBbs.do?gid=${goods.uid }" class="sf-button sf-button-sm">
                      <span>建议留言</span>
                    </a>
                  </c:if>--%>
								</div>
                                <div class="product-details-color">
                                    <span>库存量:</span>
                                    <ul>
                                        <li>${goods.kcnum} </li>
                                    </ul>
                                </div>
                                <div class="product-details-color">
                                    <span>库存状态:</span>
                                    <ul>
                                        <li>${goods.kcstatus} </li>
                                    </ul>
                                </div>
								<div class="product-details-color">
                <span>商家:</span>
                <ul>
                  <li><c:forEach items="${ulist }" var="a">
                    <c:if test="${a.id==goods.uid }">
                      <a href="showUserx.do?id=${a.id }"><img src="upload/${a.img}" height="50px;" width="50px;">${a.tname }</a>

                    </c:if> </c:forEach>
                  </li>
                </ul>
              </div>
                <div class="product-details-color">
                  <span>信誉:</span>
                  <ul>
                    <li><c:forEach items="${ulist }" var="a">
                      <c:if test="${a.id==goods.uid }">
                        ${a.xinyu }
                      </c:if>
                    </c:forEach>
                    </li>
                  </ul>
                </div>
								<div class="product-details-categories">
									<span>所属类型：</span>
									<ul>
										<li><c:forEach items="${tlist }" var="a">
												<c:if test="${a.id==goods.fid }">
													<a href="showGoodsType.do?fid=${a.id }">${a.name }</a>
												</c:if>
											  </c:forEach></li>
									</ul>
								</div>
                <div class="product-details-categories">
                  <span>品牌：</span>
                  <ul>
                    <li>${goods.pname}</li>
                  </ul>
                </div>
                <div class="product-details-categories">
                  <span>类型：</span>
                  <ul>
                    <li>${goods.gtype}</li>
                  </ul>
                </div>
                <div class="product-details-categories">
                  <span>颜色：</span>
                  <ul>
                    <li>${goods.yanse}</li>
                  </ul>
                </div>

								<!-- <div class="product-details-tags">
									<span>Tags :</span>
									<ul>
										<li><a href="shop.html">Electronic</a></li>
										<li><a href="shop.html">Television</a></li>
									</ul>
								</div>

								<div class="product-details-socialshare">
									<span>Share :</span>
									<ul>
										<li><a href="#"><i class="ti ti-facebook"></i></a></li>
										<li><a href="#"><i class="ti ti-twitter"></i></a></li>
										<li><a href="#"><i class="ti ti-google"></i></a></li>
										<li><a href="#"><i class="ti ti-linkedin"></i></a></li>
										<li><a href="#"><i class="ti ti-instagram"></i></a></li>
									</ul>
								</div>  -->
							</div>
                        </div>
                        <!--// Product Details Right -->
        
                    </div>
                    <!--// Product Details Inner -->
                    
                    <!-- Product Details Review -->
                    <div class="product-descripton-review">

                        <ul class="nav" id="product-description-review" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="product-description-tab" data-toggle="tab" href="#product-description" role="tab" aria-controls="product-description" aria-selected="true">说明</a>
                            </li>
                        <li class="nav-item">
                                <a class="nav-link" id="product-reviews-tab" data-toggle="tab" href="#product-reviews" role="tab" aria-controls="product-reviews" aria-selected="false">查看评价</a>
                            </li>
                        </ul>

                        <div class="tab-content" id="product-description-review-content">
                            <div class="tab-pane fade show active" id="product-description" role="tabpanel" aria-labelledby="product-description-tab">
                                <div class="product-description">
                                    <p>${goods.note }</p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="product-reviews" role="tabpanel" aria-labelledby="product-reviews-tab">
                                <div class="product-review">
                                    <div class="commentlist">
                                        <h6>用户评价</h6>
                                      <c:forEach items="${list}" var="p">
                                        <div class="single-comment">
                                          <div class="single-comment-thumb">
                                            <c:forEach items="${ulist}" var="u">
                                              <c:if test="${u.id==p.uid}">
                                                <img src="upload/${u.img}" width="100px;">
                                              </c:if>
                                            </c:forEach>
                                           <%-- <img src="img/author-image/author-image-1.png" alt="hastech logo">--%>
                                            <%--<img src="img/author-image/author-image-1.png" alt="hastech logo">--%>
                                          </div>
                                          <div class="single-comment-content">
                                            <div class="single-comment-content-top">
                                              <h6><c:forEach items="${ulist}" var="u">
                                                <c:if test="${u.id==p.uid}">
                                                  ${u.tname}
                                                </c:if>
                                              </c:forEach> –${p.etime} </h6>
                                              <div class="ratting-box">
                                               <%-- <span class="active"><i class="ti ti-star"></i></span>
                                                <span class="active"><i class="ti ti-star"></i></span>
                                                <span class="active"><i class="ti ti-star"></i></span>
                                                <span class="active"><i class="ti ti-star"></i></span>
                                                <span><i class="ti ti-star"></i></span>--%>
                                              </div>
                                            </div>
                                            <p>${p.pj}</p>
                                              <h6 style="color: #f00;">回复评价：${p.mark}</h6>
                                          </div>
                                        </div>
                                      </c:forEach>

                                    </div>

                                   <%-- <div class="commentbox mt-5">
                                        <h6>ADD A REVIEW</h6>
                                        <form action="#" class="sf-form">
                                            <div class="sf-form-inner">
												<div class="single-input">
													<label>Your Rating</label>
													<div class="ratting-box hover-action">
														<span class="active"><i class="ti ti-star"></i></span>
														<span class="active"><i class="ti ti-star"></i></span>
														<span class="active"><i class="ti ti-star"></i></span>
														<span class="active"><i class="ti ti-star"></i></span>
														<span><i class="ti ti-star"></i></span>
													</div>
												</div>
												<div class="single-input">
													<label for="new-review-textbox">Your Review</label>
													<textarea id="new-review-textbox" cols="30" rows="5"></textarea>
												</div>
												<div class="single-input">
													<label for="new-review-name">Name*</label>
													<input type="text" id="new-review-name">
												</div>
												<div class="single-input">
													<label for="new-review-email">Email*</label>
													<input type="email" id="new-review-email">
												</div>
												<div class="single-input">
													<button class="sf-button sf-button-dark" type="submit"><span>Submit</span></button>
												</div>
                                            </div>
                                        </form>
                                    </div>--%>

                                </div>
                            </div>
                        </div>

                    </div>
                    <!--// Product Details Review -->

                </div>
                                        
            </div>
			<!--// Product Page Wrapper -->

		</main>
		<!--// Page Conttent -->
			
			
			

				<jsp:include page="foot.jsp"></jsp:include>
	