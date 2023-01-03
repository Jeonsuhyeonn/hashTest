<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원가입</h3>
	<form action="hashProc.jsp">
	아이디 : <input type=text name="plainText"><br><br>
	비밀번호 암호화 : <input type=text name="plainText"><br><br>
    	<input type=radio name=algorithm value="MD5">MD5
	    <input type=radio name=algorithm value="SHA-1">SHA-1
	    <input type=radio name=algorithm checked value="SHA-256">SHA-256
	    <input type=radio name=algorithm value="SHA-384">SHA-384
	    <input type=radio name=algorithm value="SHA-512">SHA-512 <br>
		<input type="submit" value="암호화 결과">
	
	</form>

</body>
</html>