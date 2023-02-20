<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ include file="../layout/header.jsp"%>--%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<link rel="stylesheet" href="/css/loginForm.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%--헤더에 넣을것--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/css/footer.css">
<div class="cn1">
	<div class="container1">
		<div class="logo">
			<img src="../image/logo.png" alt="logo">
		</div>
		<h1></h1>
		<form action="/auth/loginProc" method="POST">
			<div class="text_field form-group">
				<input type="text" class="form-control" id="username"
					name="username" required> <span></span> <label>ID</label>
			</div>
			<div class="text_field form-group">
				<input type="password" class="form-control" id="password"
					name="password" required> <span></span> <label>비밀번호</label>
			</div>
			<p id="alertMsg">${loginFailMsg}</p>
			<button>
				<input type="submit" id="btn-login" class="btn btn-primary"
					value="로그인">
			</button>
		</form>

		<div class="signup">
			<a href="/auth/findId">아이디찾기</a> | <a href="/auth/findPwd">비밀번호
				변경</a> | <a href="/auth/joinForm">회원가입</a>
		</div>


	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
