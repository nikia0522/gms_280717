<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.*"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.sql.*"%>
<%@ include file="../constants/db.jsp" %>

<%! 
public String root(HttpServletRequest request){
return request.getContextPath();
} 

public Map<String, String> getDetail(HttpServletRequest request){
	Map<String, String>map= new HashMap<>();
	try{
	  	Class.forName(ORACLE_DRIVER);
		String id=request.getParameter("id");
		String sql="SELECT * FROM Member WHERE id=?";
		PreparedStatement pstmt=DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs=pstmt.executeQuery();
	
	if(rs.next()){
		map.put("id", rs.getString("id"));
		map.put("name", rs.getString("name"));
		map.put("ssn", rs.getString("ssn"));
		map.put("phone", rs.getString("phone"));
		map.put("email", rs.getString("email"));
		map.put("major", rs.getString("major_id"));
		map.put("regdate", rs.getString("regdate"));
		map.put("profile", rs.getString("profile"));
		}
	}catch(Exception ex){
	  	
	}
	return map;
}

public List<Map<String, String>> list(HttpServletRequest request){
	String action = request.getParameter("action");
	List<Map<String, String>>list=new ArrayList<>();
	Map<String, String> map=null;
	try{
		Class.forName(ORACLE_DRIVER);
		PreparedStatement pstmt=null;
		if (action.equals("list")){
			pstmt=DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("SELECT * FROM Member");
		}else{
			String id=request.getParameter("id");
			pstmt=DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("SELECT * FROM Member WHERE id=?");
			pstmt.setString(1,id);
			
		}
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			map=new HashMap<>();
			map.put("id", rs.getString("id"));
			map.put("name", rs.getString("name"));
			map.put("email", rs.getString("email"));
			map.put("phone", rs.getString("phone"));
			map.put("major", rs.getString("major_id"));
			map.put("regdate", rs.getString("regdate"));

			list.add(map);
			}
			

			} catch(Exception ex){
		
	}
	return list;
}
	
public Map<String, String> getAdd(HttpServletRequest request){
	Map<String, String>map= new HashMap<>();
	
	try{
		Class.forName(ORACLE_DRIVER);
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String ssn=request.getParameter("ssn");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String major_id=request.getParameter("major_id");
		String regdate=request.getParameter("regdate");
		
		String sql="INSERT INTO Member(id, name, password, ssn, regdate, phone, email, major_id, profile) VALUES (?,?,?,?,SYSDATE,?,?,?,'defaultimg.jpg')";
		PreparedStatement pstmt = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement(sql);

		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, ssn);
		pstmt.setString(5, phone);
		pstmt.setString(6, email);
		pstmt.setString(7, major_id);
		ResultSet rs=pstmt.executeQuery();

		if(rs.next()){
			map.put("id", rs.getString("id"));
			map.put("name", rs.getString("name"));
			map.put("password", rs.getString("password"));
			map.put("ssn", rs.getString("ssn"));
			map.put("regdate", rs.getString("regdate"));
			map.put("phone", rs.getString("phone"));
			map.put("email", rs.getString("email"));
			map.put("major_id", rs.getString("major_id"));
			map.put("profile", rs.getString("profile"));

			
		}
	}catch(Exception ex){
		
	}
	return map;
}

public int getUpdate(HttpServletRequest request){
	int rs=0;
	try{
	Map<String, String>temp=new HashMap<>();
		String id=request.getParameter("id");
		Class.forName(ORACLE_DRIVER);
		temp=getDetail(request);
		PreparedStatement pstmt=DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("UPDATE Member SET phone=?, major_id=? WHERE id=?");
		pstmt.setString(1, request.getParameter("phone").equals("")?temp.get("phone"):request.getParameter("phone"));
		pstmt.setString(2, request.getParameter("major_id").equals("")?temp.get("major_id"):request.getParameter("major_id"));
		pstmt.setString(3, request.getParameter("id"));
		rs=pstmt.executeUpdate();
		
	}catch(Exception ex){
		
	}
	return rs;
}

public int getDelete(HttpServletRequest request){
	int i=0;
	try{
		Class.forName(ORACLE_DRIVER);
		PreparedStatement pstmt=DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD).prepareStatement("DELETE FROM Member WHERE id=?");
		pstmt.setString(1, request.getParameter("id"));	
		i=pstmt.executeUpdate();
		
	}catch(Exception ex){
		
	}
	return i;
}
 %>