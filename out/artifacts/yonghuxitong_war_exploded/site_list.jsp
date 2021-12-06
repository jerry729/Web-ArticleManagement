<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




			<jsp:include page="top.jsp"></jsp:include>

			<!-- layui css -->
	<link rel="stylesheet" href="admin/layui/css/layui.css" media="all">
	<script type="text/javascript" src="admin/js/jquery-1.11.0.min.js"></script> 
	<!-- layui js -->
	<script src="admin/layui/layui.js"></script>
	<script type="text/javascript">
	//静态表格
    layui.use('table',function(){
    	var table = layui.table;
		//转换静态表格
		table.init('mylist', {
		  height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
		  ,count: 50 //数据总数 服务端获得
		  ,limit: 5 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
		  ,page:true //开启分页
		 /* ,toolbar: '#toolbarDemo'*///工具栏
		 /* ,defaultToolbar:['filter', 'exports']*/
		  ,limits:[ 5, 10, 15, 20, 30, 50]//分页显示每页条目下拉选择
		  ,cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
		}); 
	}); 

</script> 		
			  <!-- Bradcrumb Area -->
        <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li>我的地址</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

			<!-- Shopping Cart Area -->
            <div class="shop-grid-area section-padding-lg bg-white">
                <div class="container">
                   <%-- <script type="text/html" id="toolbarDemo">--%>

                    <%--</script>--%>
					
					<!-- Cart Products -->
					<div class="cart-table table-responsive">
            <div><a href="doAddSite.do" class="sf-button sf-button-dark sf-button-sm">发布地址</a></div>
                        <!-- 下面写内容 -->
                        <table class="layui-table" lay-filter="mylist" lay-size="lg">
                            <thead>
                            <tr>
                                <th lay-data="{field:'xh', align:'center',minWidth:160}">序号</th>
                                <th lay-data="{field:'mc', align:'center',width:160}">名称</th>
                                <th lay-data="{field:'mc1', align:'center',width:160}">发布人</th>
                                <th lay-data="{field:'addr2',align:'center',minWidth:100}">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list }" var="o" varStatus="num">

                                <tr>
                                    <td>${num.count }</td>
                                    <td>${o.name }</td>
                                    <td>
                                        <c:forEach items="${ulist}" var="y">
                                            <c:if test="${y.id==o.uid }">
                                                <a href="#"> ${y.tname }</a>
                                            </c:if>
                                        </c:forEach></td>

                                    <td>
                                        <a href="doUpdateSite.do?id=${o.id }" class="btn btn-info">修改</a>
                                        <a href="deleteSite.do?id=${o.id }" class="btn btn-info">删除</a>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
					</div>
					<!--// Cart Products -->

					

				</div>
			</div>
			<!--// Shopping Cart Area -->

		</main>
		<!--// Page Conttent -->

		
			 <jsp:include page="foot.jsp"></jsp:include>
		
