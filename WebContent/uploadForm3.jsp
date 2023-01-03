<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>파일 업로드</h3>
	<form action="uploadProc3.jsp" enctype="multipart/form-data" method="post">
		작성자 : <input type="text" name="name"> <br>
		제목 : <input type="text" name="title"> <br>
		카테고리 : <input type="checkbox" name="cate" checked value="사진">사진
				<input type="checkbox" name="cate" value="과제">과제
				<input type="checkbox" name="cate" value="문서">문서
				<input type="checkbox" name="cate" value="음원">음원 <br>
		첨부파일 : <input type="file" name="attachedFile"> <br>
		<input type="submit" value="파일 업로드">
	</form>


	<h3>회원가입</h3>
	<form action="hashProc.jsp" enctype="multipart/form-data" method="post">
	아이디 : <input type=text name="plainText"><br>
	비밀번호 암호화 : <input type=text name="plainText"><br>
    	<input type=radio name=algorithm value="MD5">MD5
	    <input type=radio name=algorithm value="SHA-1">SHA-1
	    <input type=radio name=algorithm checked value="SHA-256">SHA-256
	    <input type=radio name=algorithm value="SHA-384">SHA-384
	    <input type=radio name=algorithm value="SHA-512">SHA-512 <br>
		<input type="submit" value="암호화 결과">
	
	</form>
</body>
</html>