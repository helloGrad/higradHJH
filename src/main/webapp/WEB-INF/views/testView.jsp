<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<title>Insert title here</title>
</head>
<body>
<h1>네이버 로그인 테스트 페이지</h1>

  		<div id="naver_id_login"></div>
<script type="text/javascript">
var naver_id_login = new naver_id_login("4XJQVjfPiPo3e5Xe23hL",
"http://127.0.0.1:8080/net/user/snslogin/");
naver_id_login.setDomain(".127.0.0.1:8080/net/");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 3, 40);
naver_id_login.setDomain("YOUR_SERVICE_URL");
naver_id_login.setState(state);
naver_id_login.init_naver_id_login();
</script>

</body>

</html>