<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
						<li>建议留言</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

        <!-- Page Conttent -->
		<main class="page-content">

            <!-- Shop Grid Area -->
            <div class="shop-grid-area section-padding-lg bg-white">
                <div class="container">
               <!--  <form class="header-searchbox" action="searchGoods.do" method="post">		
                    <div class="toolbox">
                        <div class="toolbox-view">
                            <button class="active" data-product-view="grid"><i class="ti ti-layout-grid3"></i></button>
                            <button data-product-view="list"><i class="ti ti-list"></i></button>
                            <input type="text" name="name" placeholder="输入建议留言名称">
                        </div>
                        <div class="toolbox-sorting" style="text-align:left; width: 200px;">
                            <select name="price" id="">
                                 <option value="">请选择单价</option>
                                <option value="1">50元以下</option>
                                <option value="2">50到100</option>
                                <option value="3">100到150元</option>
                                <option value="4">150元以上</option>
                            </select>
                            <button style="width: 100px; height: 50px; margin-left: 100px;background: #b18c8c;"><i class="ti ti-search"></i></button>
                        </div>
                    </div>
                    </form> -->

                    <div class="row products-wrapper shop-page-products">

                        <!-- Single product -->
                        <c:forEach items="${list }" var="g">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="product-item">
                                <div class="product-item-bottomside">
                                    <div class="ratting-box">
                                    </div>
                                    <h6><a href="showBbsx.do?id=${g.id }" style="display: block;float: left;">${g.name } </a> <b style="display: block;float: right;">发布时间：${g.pubtime }</b></h6>
                                </div>
                            </div>	
                        </div>
                        </c:forEach>
                        <!--// Single product -->


                    </div>

                    <div class="sf-pagination text-center">
                        <ul>
                        <c:if test="${sessionScope.p==1 }">
						<c:if test="${page.page>1}">
						    <li><a href="showGoods.do?page=${page.page-1 }"><<</a></li>
                            <li><a href="showGoods.do?page=1">首页</a></li>
                            <li><a >末页</a></li>
                            <li><a >>></a></li>
			             </c:if>
			    	     <c:if test="${page.page<page.totalPage}">
			    	     	<li><a ><<</a></li>
                            <li><a>首页</a></li>
                            <li><a href="showGoods.do?page=${page.totalPage }" >末页</a></li>
                            <li><a href="showGoods.do?page=${page.page+1 }">>></a></li>
					    </c:if>
					    </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <!--// Shop Grid Area -->

            <!-- Popular products -->
          
                        <!--// Single product -->

        </main>
        <!--// Page Conttent -->
			
		
			
			<jsp:include page="foot.jsp"></jsp:include>
			


