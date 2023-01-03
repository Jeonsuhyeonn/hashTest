<%@page import="java.net.URLEncoder"%>
<%@page import="fileUpload.MyFileDAO"%>
<%@page import="fileUpload.MyFileDTO"%>
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
	MyFileDAO dao = new MyFileDAO();
	List<MyFileDTO> myFileList = dao.myFileList();
%>
<a href="uploadForm3.jsp">파일 작성하기</a>
<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>카테고리</td>
			<td>원본파일명</td>
			<td>저장파일명</td>
			<td>작성일</td>
		</tr>
		
		<% for(MyFileDTO dto : myFileList){ %>
		<tr>
			<td><%=dto.getIdx() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getTitle() %></td>
			<td><%=dto.getCate() %></td>
			<td><%=dto.getOfile() %></td>
			<td><a href="download.jsp?oName=<%=URLEncoder.encode(dto.getOfile(), "utf-8") %>&sName=<%=URLEncoder.encode(dto.getSfile(), "utf-8") %>"><%=dto.getSfile() %></a></td>
			<td><%=dto.getPostdate() %></td>
		</tr>
		<% } %>
</table>
</body>
</html>
