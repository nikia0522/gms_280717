<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>

<div id="container">
<table id="member_list_tab">
	<tr>
		<th style="width:5%">NO</th>
		<th style="width:10%">아이디</th>
		<th style="width:10%">이름</th>
		<th style="width:10%">이메일</th>
		<th style="width:15%">전화번호</th>
		<th style="width:10%">전공</th>
		<th style="width:10%">학점</th>
		<th style="width:10%">등록일</th>
		<th style="width:10%">수정/삭제</th>
	
	</tr>
	<%
	List<Map<String, String>>list=list(request);
	int count=list.size();
	for(int i=0; i<list.size(); i++){
	Map<String, String>temp=list.get(i);%>
	<tr>
		<td style="width:5%"><%=count--%></td>
		<td style="width:10%"><%=temp.get("id")%></td>
		<td style="width:10%"><%=temp.get("name")%></td>
		<td style="width:10%"><%=temp.get("email")%></td>
		<td style="width:15%"><%=temp.get("phone")%></td>
		<td style="width:10%"><%=temp.get("major")%></td>
		<td style="width:10%">A</td>
		<td style="width:10%"><%=temp.get("regdate")%></td>
		<td style="width:10%"><a href="<%=request.getContextPath()%>/member/member_detail.jsp?id=<%=temp.get("id")%>">수정</a>/<a href="<%=request.getContextPath()%>/member/service_delete.jsp?id=<%=temp.get("id")%>">삭제</a></td>
		
	</tr>
	<%} %>
	</table>
 </div>
<%@ include file="../common/footer.jsp" %>	