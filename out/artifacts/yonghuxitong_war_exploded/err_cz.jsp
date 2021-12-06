<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<script src="js/jquery-1.8.3.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<script src="js/main.js"></script>
<%--<script type="text/javascript">
    $("#distpicker").distpicker({
        province: '330000',
        city: '330200',
        district: '330206'
    });
</script>--%>
<jsp:include page="top.jsp"></jsp:include>
<%--
<div  id="distpicker" >
    <select></select>
    <select></select>
    <select></select>
</div>
--%>

    <div class="" align="center">
    
    <h1>对不起！操作失败</h1>
    
    <div class="reindex"><a href="index" target="_parent">返回</a></div>

    
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
