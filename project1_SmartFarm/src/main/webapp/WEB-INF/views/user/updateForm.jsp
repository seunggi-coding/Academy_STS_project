<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--헤더에 넣을것--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal" />
</sec:authorize>
<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


<link rel="stylesheet" href="/css/updateForm.css">
<link rel="stylesheet" href="/css/footer.css">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<title>스마트팜>회원정보 수정</title>
<div class="joinf">
    <div class="joincontainer">
        <div class="logo">
            <img src="../image/logo.png" alt="logo">
        </div>
        <h1></h1>
        <div class="content">

            <form>
                <input type="hidden" id="id" value="${principal.user.id}">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">전화번호</span>
                        <input type="text" class="form-control" placeholder="01012345678" id="phonenumber"
                               value="${principal.user.phonenumber}">
                    </div>
                    <div class="input-box">
                        <span class="details">이메일</span>
                        <input type="email" class="form-control" placeholder="새 이메일" id="email"
                               value="${principal.user.email}">
                    </div>
                    <div class="input-box">
                        <span class="details">새 비밀번호</span>
                        <input type="password" class="form-control" placeholder="새 비밀번호" id="password">
                    </div>
                </div>
            </form>
            <div class="button">
                <input type="button" class="btn btn-primary" id="btn-update" value="회원정보 수정">
            </div>
            <div class="button">
                <input type="reset" class="btn btn-primary" value="취소" onclick="history.back()">
            </div>

        </div>
    </div>
</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>
