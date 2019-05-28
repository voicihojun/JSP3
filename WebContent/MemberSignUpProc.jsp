<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "model.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Sign Up Procedure</title>
<style>
	table,td {
		border: 1px solid black;
		text-align: center;
		margin: 0 auto;
	}
	
	td {
		padding: 5px;
	}
	
	h2 {
		text-align: center;
	}
</style>
</head>
<body>

	<!-- In using useBean, we can receive the data at once -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
		<!-- mapping all the data -->
	</jsp:useBean>
	
	<%
	String [] hobby = request.getParameterValues("hobby");
	String textHobby = "";
	
	for(int i=0; i < hobby.length; i++) {
		textHobby += hobby[i] + " ";
	}
	
	/* ************************ */
	/* important : we need to set hobby one more time with textHobby */
	/* if we didn't do this, the value of the hobbies will be first value checked in the checkbox */
	mbean.setHobby(textHobby);
	
	
	// Creating MemberDAO object
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	response.sendRedirect("MemberList.jsp");
	%>
	
	DB connection completion!
	
	
</body>
</html>