<%@page import="fileUpload.pwFileDAO"%>
<%@page import="fileUpload.pwFileDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/Uploads");
	int maxPostSize = 1024 * 1024 * 20;
	String encoding = "utf-8";
	
	try {
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		// 3. 다른 폼 값 받기
		String name = mr.getParameter("plainText");
		String title = mr.getParameter("algorithm");
		String [] cateArray = mr.getParameterValues("MessageDigest");
		StringBuffer cateBuf = new StringBuffer();
		
		if(cateArray != null) {
			for(String s : cateArray) {
				cateBuf.append(s);
			}
		}
		
		// 4. DTO 생성
		pwFileDTO dto = new pwFileDTO();
		dto.setPlainText(name);
		dto.setAlgorithm(title);
		dto.setMessageDigest(cateBuf.toString());
	
		
		// 5. DAO 사용하여 CRUD
		pwFileDAO dao = new pwFileDAO();
		dao.insertFile(dto);
		dao.close();
		
		response.sendRedirect("pwList.jsp");
		
	} catch(Exception e) {
		
	}
%>