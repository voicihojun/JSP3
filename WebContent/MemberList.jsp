<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO, model.MemberBean"%>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
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
	MemberDAO mdao = new MemberDAO();
	
	Vector<MemberBean> vec = mdao.selectAllMember();
	
	%>
	
	
	<table>
		<tr>
			<td>id</td>
			<td>email</td>
			<td>tel.no</td>
		</tr>
		<%
		for(int i=0; i < vec.size(); i++) {
			MemberBean bean = vec.get(i);
		%>
		
		<tr>
			<td><a href="MemberInfo.jsp?id=<%=bean.getId()%>"><%=bean.getId() %></a></td>
			<td><%=bean.getEmail() %></td>
			<td><%=bean.getTel() %></td>
		</tr>
		
		<%} %>
		
		
	
	</table>

</body>
</html>