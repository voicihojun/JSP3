<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Delete</title>
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
	
	<h2>Delete</h2>
	
	<table>
		<form action="MemberDeleteInfoProc.jsp" method="post">
			<tr>
				<td>ID</td>
				<td><%=request.getParameter("id") %></td>
			</tr>
			<tr>
				<td>PASSWORD</td>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
					<input type="submit" name="submit" value="delete"/>
		</form>
					<button onclick="location.href='MemberList.jsp'">Member List</button>
				</td>
			</tr>	
	</table>
	
	
	

</body>
</html>