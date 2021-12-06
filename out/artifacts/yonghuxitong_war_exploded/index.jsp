<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--<jsp:forward page="admin/login.jsp"></jsp:forward>--%>
<script type="text/javascript">
    window.location.href='<%=basePath%>/admin/login.jsp';
</script>