<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--헤더에 넣을것--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/css/findResult.css">
<link rel="stylesheet" href="/css/footer.css">
<head>
</head>
<title>스마트팜>아이디확인</title>
<form>
	<div class="findId">
		<div class="findcontainer">
			<div class="logo">
				<img src="../image/logo.png" alt="logo">
			</div>
			<h1></h1>
			<div class="content">
				<h4>회원님의 아이디는</h4>
				<h2>${checkuser}</h2>
				<h4>입니다.</h4>
			</div>
			<div class="button">
				<input type="button" id="btn-login" class="btn btn-primary"
					value="로그인" onclick="location.href='/auth/loginForm'">
			</div>
		</div>
	</div>


</form>

<%@ include file="../layout/footer.jsp"%>