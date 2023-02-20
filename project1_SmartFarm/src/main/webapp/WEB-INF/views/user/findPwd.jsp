<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--헤더에 넣을것--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>


<link rel="stylesheet" href="/css/findId.css">
<link rel="stylesheet" href="/css/footer.css">

<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>스마트팜>비밀번호 재설정</title>
<div class="findId">
	<div class="findcontainer">
		<div class="logo">
			<img src="../image/logo.png" alt="logo">
		</div>
		<h1></h1>
		<div class="content">
			<form name="pwdfindscreen" >
				<div class="user-details">
					<div class="input-box find-id">
						<span class="details">아이디</span> <input type="text"
							name="member_id" class="btn-id" id="userid" placeholder="가입하신 아이디를 입력해주세요."
							value="${principal.user.userid}" required>
					</div>
					<div class="input-box">
						<span class="details find-name">이메일</span> <input type="text"
							name="member_name" class="btn-name" id="useremail"
							placeholder="가입하신 이메일을 입력해주세요." value="${principal.user.email}"
							required>
					</div>
				</div>
				<div class="input-box">
					<span class="details">도움이 필요하신가요? <a href="/auth/inquiry">문의게시판</a></span>
				</div>
				<div class="button">
					<input type="button" value="비밀번호 재설정" id="btn-resetting_pwd">
				</div>
				<div class="button">
					<input type="reset" name="cancle" value="취소"
						onclick="history.back()">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>