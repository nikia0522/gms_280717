<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.driver.DBConversion" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="javafx.scene.control.Alert" %>
<%@ include file="../member/member_head.jsp" %>
<%@ include file="../member/member_service.jsp" %>

<% Map<String, String> map=getAdd(request);%>

<script>
	alert('회원등록 완료');
	location.href="<%=request.getContextPath()%>/login.jsp";
</script>