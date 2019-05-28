<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO, model.MemberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
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
	MemberBean bean = mdao.selectOneMember(id);
%>
	<h2>Member Information</h2>
	<table>
		<tr>
			<td>id</td>
			<td>password</td>
			<td>email</td>
			<td>tel.no</td>
			<td>hobby</td>
			<td>job</td>
			<td>age</td>
			<td>comment</td>
		</tr>
		<tr>
			<td><%=bean.getId() %></a></td>
			<td><%=bean.getPwd() %></a></td>
			<td><%=bean.getEmail() %></td>
			<td><%=bean.getTel() %></td>
			<td><%=bean.getHobby() %></a></td>
			<td><%=bean.getJob() %></a></td>
			<td><%=bean.getAge() %></a></td>
			<td><%=bean.getComment() %></a></td>
		</tr>
		
		<tr>
			<td colspan="8">
				<button onclick="location.href='MemberUpdateInfo.jsp?id=<%=bean.getId() %>'">Update</button>
				<button onclick="location.href='MemberDeleteInfo.jsp?id=<%=bean.getId() %>'">Delete</button>
				<button onclick="location.href='MemberList.jsp?id=<%=bean.getId() %>'">Member List</button>
				<button onclick="location.href='MemberSignUp.jsp?id=<%=bean.getId() %>'">Sign Up</button>
			</td>
		</tr>
	</table>
	
	

</body>
</html>