<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Delete Info Procedure</title>
</head>
<body>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

<%
	MemberDAO mdao = new MemberDAO();
	String pwd = mdao.getPwd(mbean.getId());
	
	if(mbean.getPwd().equals(pwd)) {
		mdao.deleteMember(mbean.getId());
		response.sendRedirect("MemberList.jsp");
	} else {
%>
	<script>
		alert("!!!password invalide!!!");
		history.go(-1);
	</script>	
		
	<%} %>
	 

%>


</body>
</html>