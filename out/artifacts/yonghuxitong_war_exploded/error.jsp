<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>








			<jsp:include page="top.jsp"></jsp:include>
			<h1 style="    text-align: center;margin: 50px;">${sessionScope.info}</h1>
			<%session.removeAttribute("info");%>
			<jsp:include page="foot.jsp"></jsp:include>
