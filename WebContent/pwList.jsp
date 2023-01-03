<%@page import="fileUpload.pwFileDTO"%>
<%@page import="fileUpload.pwFileDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	pwFileDAO dao = new pwFileDAO();
	List<pwFileDTO> pwList = dao.pwList();
%>
<a href="uploadForm3.jsp">파일 작성하기</a>
<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
		</tr>
		
		<% for(pwFileDTO dto : pwList){ %>
		<tr>
			<td><%=dto.getIdx() %></td>
			<td><%=dto.getPlainText() %></td>
			<td><%=dto.getAlgorithm() %></td>
			<td><%=dto.getMessageDigest() %></td>
		</tr>
		<% } %>
</table>
</body>
</html>
