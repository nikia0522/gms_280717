<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>      
<%@ page import="java.sql.*"%> 
<%@ include file="member_service.jsp" %>
	
<%
int rs=getUpdate(request);
	String id=request.getParameter("id");
if(rs==1){
	%>
	<script>
	location.href="<%=request.getContextPath()%>/member/member_detail.jsp?id=<%=id%>&action=list";
	</script>
	<%
}else{%>
	<script>
	location.href="<%=request.getContextPath()%>/member/member_detail.jsp?id=<%=id%>&action=list";
	</script>
	<%
}
%>
