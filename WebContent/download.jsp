<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/Uploads");
	String saveFilename = request.getParameter("sName");
	String oriFilename = request.getParameter("oName");
	// System.out.println(saveFilename + ", " + oriFilename);
	
	// 한글 파일명 깨짐 방지
	String client = request.getHeader("User-Agent");
	if(client.indexOf("WOW64") == -1){
		oriFilename = new String(oriFilename.getBytes("utf-8"), "ISO-8859-1");
	} else {
		oriFilename = new String(oriFilename.getBytes("KSC5601"),"ISO-8859-1");
	}
	
	try {
		File file = new File(saveDirectory, saveFilename);
		InputStream inStream = new FileInputStream(file);
		
		// 파일 다운로드를 위한 응답헤더 설정
		response.reset();
		response.setContentType("application/octet-stream");  //2진 형태임
		response.setHeader("Content-Disposition", 
						"attachment; filename=\"" + oriFilename + "\"");
		response.setHeader("Content-Length", "" + file.length());
		
		// 출력 스트림을 초기화
		out.clear();
		
		OutputStream outStream = response.getOutputStream();
		byte [] b = new byte[1024];
		int readBuffer = 0;
		while((readBuffer = inStream.read(b)) > 0) {
			outStream.write(b, 0, readBuffer);
		}
		inStream.close();
		outStream.close();
	} catch(Exception e) {
		System.out.println("Exception : " + e.getMessage());
		
	}
%>

