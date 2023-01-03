<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="security.Hash"%>
<%
	String algorithm = request.getParameter("algorithm");
	String plainText = request.getParameter("plainText");
	Hash hash = new Hash();
	String md = hash.getHash(plainText, algorithm);
%>
<font size=5>
plainText : <%=plainText %><br>
algorithm : <%=algorithm %><br>
Message Digest : <%=md %>
</font>
