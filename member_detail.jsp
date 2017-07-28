<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.driver.DBConversion" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="javafx.scene.control.Alert" %>
<%@ include file="member_service.jsp" %>
<%@ include file="member_head.jsp" %>
	<% Map<String, String>map= getDetail(request);%>
	<div id="container">			
	<table id="member_detail_tab">
		<tr>		
			<td colspan="2" rowspan="3"> <img src="<%=headroot(request)%>/img/defaultimg.jpg" style=width:100px;></td>
			<td> 이름</td>
			<td> <%=map.get("name") %></td>
		</tr>
		<tr>
			<td>ID</td>
			<td> <%=map.get("id") %></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td> <%=map.get("ssn") %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="3"> <%=map.get("phone") %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td colspan="3"> <%=map.get("email") %></td>
		</tr>
		<tr>
			<td>학점</td>
			<td colspan="3">A</td>
		</tr>
		<tr>
			<td>전공</td>
			<td colspan="3"> <%=map.get("major") %></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td colspan="3"> <%=map.get("regdate") %></td>
		</tr> 
	</table>
	<button id="list-btn" onclick="javascript:goList()">목록</button>
	<button id="update_btn" onclick="javascript:goUpdate()">수정</button>
	</div>
	<br /><br /><br /><br />
	<script>
    function goList(){
        location.href="<%=headroot(request)%>/member/member_list.jsp?action=list";
   	}
   	function goUpdate(){
        location.href="<%=headroot(request)%>/member/member_update.jsp?id=<%=map.get("id") %>";
   	}

	</script>
<%@ include file= "../common/footer.jsp"%>

	