<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/theme.css">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendors/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/sb-admin-2.min.css"
	rel="stylesheet">
	
<!-- 카카오 로그인 -->
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	function login() {
		var form = document.user;
		var userid = $("#userid").val(); //태그의 value 속성값
		var passwd = $("#passwd").val();
		if (userid == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus(); //입력 포커스 이동
			return; //함수 종료
		}
		if (passwd == "") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		form.action = "${path}/member/login_check.do";
		form.submit();
	}
</script>


</head>
<body class="bg-gradient-primary">
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<a href="${path}/"><img alt="오독오독 로고"
											src="${path}/resources/assets/img/gallery/logo5.png"
											width="30%" height="auto"></a>
									</div>
									<form name="user" method="post">
										<div class="form-group">
											<input class="form-control form-control-user" id="userid"
												name="userid" placeholder="아이디를 입력해주세요">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
										</div>
										<c:if test="${param.message == 'nologin' }">
											<div style="color: red; text-align: center; padding-bottom: 10px;">로그인 하신 후 사용하세요.</div>
										</c:if>
										<c:if test="${message == 'error' }">
											<div style="color: red; text-align: center; padding-bottom: 10px;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
										</c:if>
										<c:if test="${message == 'logout' }">
											<div style="color: blue; text-align: center; padding-bottom: 10px;">로그아웃 처리되었습니다.</div>
										</c:if>
										<input type="button" id="Login"
											class="btn btn-primary btn-user btn-block" onclick="login()"
											value="로그인">
										<hr>
										<a id="kakao-login-btn" class="btn btn-warning btn-user btn-block" 
										 href="https://kauth.kakao.com/oauth/authorize?client_id=5e271ef689167248b66474ccae13b1e6&redirect_uri=http://localhost/finalproject/member/oauth_kakao&response_type=code">
											카카오톡 로그인
										</a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="${path}/member/findId.do">아이디 찾기</a> |
										<a class="small" href="${path}/member/findpw.do">비밀번호 찾기</a> |
										<a class="small" href="${path}/member/join.do">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/sb-admin-2.min.js"></script>
</body>
</html>