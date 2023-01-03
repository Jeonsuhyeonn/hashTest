<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="fileUpload.MyFileDAO"%>
<%@page import="fileUpload.MyFileDTO"%>
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
		
		// 1. 새로운 파일명 생성
		String fileName = mr.getFilesystemName("attachedFile");
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName= now + ext;
		
		// 2. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		// 3. 다른 폼 값 받기
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String [] cateArray = mr.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		
		if(cateArray != null) {
			for(String s : cateArray) {
				cateBuf.append(s);
			}
		}
		
		// 4. DTO 생성
		MyFileDTO dto = new MyFileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		// 5. DAO 사용하여 CRUD
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
		
		response.sendRedirect("myFileList.jsp");
		
	} catch(Exception e) {
		
	}
%>