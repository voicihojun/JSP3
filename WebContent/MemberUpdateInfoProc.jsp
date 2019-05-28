<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.MemberDAO, model.MemberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update Info Procedure</title>
<style>
	table, td {
		border: 1px solid blue;
		text-align: center;
		margin: 0 auto;
	}
	td {
		padding: 5px;
	}
</style>
</head>
<body>
	
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
	
<%
	String id = request.getParameter("id");	
	
	MemberDAO mdao = new MemberDAO();
	
	/* Using getPwd method, bring the password value into pwd */
	String pwd = mdao.getPwd(id);
	
	// compare password value before update.
	if(mbean.getPwd().equals(pwd)) {
		mdao.updateMember(mbean);
		response.sendRedirect("MemberList.jsp");
		
	} else {
%>
	<script>
		alert("!!!password invalide!!!");
		history.go(-1);
	</script>
<%	
	}
	
	
	
%>

</body>
</html>