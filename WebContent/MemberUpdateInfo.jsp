<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO, model.MemberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update Information</title>
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
	<%
	String id = request.getParameter("id");
	
	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.selectOneMember(id);
	
	%>
	<h2>Update your information</h2>
	
	<table>
		<form action="MemberUpdateInfoProc.jsp" method="post">
			<tr>
				<td>ID</td>
				<td><%=mbean.getId() %></td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td><input type="email" name="email" value="<%=mbean.getEmail() %>" /></td>
			</tr>
			<tr>
				<td>TEL.NO</td>
				<td><input type="tel" name="tel" value="<%=mbean.getTel() %>" /></td>
			</tr>
			<tr>
				<td>PASSWORD</td>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="id" value="<%=mbean.getId()%>"/>
					<input type="submit" name="submit" value="update"/>
		</form>
					<button onclick="location.href='MemberList.jsp'">Member List</button>
				</td>
			</tr>	
	</table>
	
		
	

</body>
</html>