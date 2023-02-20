<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--헤더에 넣을것--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link rel="stylesheet" href="/css/findId.css">
<link rel="stylesheet" href="/css/footer.css">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<title>스마트팜>아이디찾기</title>
<div class="findId">
	<div class="findcontainer">
		<div class="logo">
			<img src="../image/logo.png" alt="logo">
		</div>
		<h1></h1>
		<div class="content">
			<form name="idfindscreen" action="/auth/findIdResult" method="POST"
				content="application/x-www-form-urlencoded;charset=UTF-8">
				<div class="user-details">
					<div class="input-box find-name">
						<span class="details">이름</span> <input type="text"
							class="btn-name" name="username" id="username"
							placeholder="가입하신 이름을 입력해주세요" required
							value="${principal.user.username}">
					</div>

					<div class="input-box find-phone">
						<span class="details">이메일</span> <input type="email" name="email"
							id="email" class="btn-email" placeholder="이메일을 입력해주세요"
							value="${principal.user.email}" required>
					</div>
					<div class="input-box">
						<span class="details">도움이 필요하신가요? <a href="/auth/inquiry">문의게시판</a></span>
					</div>
				</div>
				<div class="button-sub">
					<div class="button">
						<input type="submit" name="enter" value="아이디 찾기">
					</div>
					<div class="button">
						<input type="button" name="cancle" value="취소"
							onclick="history.back()">
					</div>
				</div>
			</form>


		</div>
	</div>
</div>
</body>
<%@ include file="../layout/footer.jsp"%>