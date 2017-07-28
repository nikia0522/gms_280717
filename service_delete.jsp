<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="member_service.jsp" %>

<% 
int i=getDelete(request);
	if (i==1){
		%>
		<script>
		alert('회원 삭제 완료');
		location.href="<%=request.getContextPath()%>/member/member_list.jsp?action=list";
		</script>
		<% 
	}else {
		%>
		<script>
		alert('회원 삭제 실패');
		location.href="<%=request.getContextPath()%>/member/member_list.jsp?action=list";
		</script>
		<% 
	}
%>
