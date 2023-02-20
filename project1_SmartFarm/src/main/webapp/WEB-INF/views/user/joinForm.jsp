<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<link rel="stylesheet" href="/css/joinForm.css">
<link rel="stylesheet" href="/css/footer.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>NatureFARM 회원가입</title>
<body>
	<div class="joinf">
		<div class="joincontainer">
			<div class="logo">
				<a href="/"> <img src="../image/logo.png" alt="logo">
				</a>
			</div>
			<h1></h1>
			<div class="content">
				<form>
					<div class="user-details">
						<div class="input-box">
							<span class="details">이름</span> <input type="text"
								class="form-control" placeholder="홍길동" id="username" required>
						</div>
						<div class="input-box">
							<span class="details">아이디</span> <input type="text"
								class="form-control" placeholder="아이디" id="userid" required>
						</div>
						<div class="input-box">
							<span class="details">Email</span> <input type="email"
								class="form-control" placeholder="123@gmail.com" id="email"
								required>
						</div>
						<div class="input-box">
							<span class="details">전화번호</span> <input type="text"
								class="form-control" placeholder="01012345678" id="phonenumber"
								required>
						</div>
						<div class="input-box">
							<span class="details">비밀번호</span> <input type="password"
								class="form-control" placeholder="123!@" id="password" required>
						</div>
						<div class="input-box">
							<span class="details">비밀번호 확인</span> <input type="password"
								class="form-control" placeholder="123!@" id="password1" required>
						</div>
						<div class="input-box">
							<span class="details">회원 코드</span> <input type="password"
								class="form-control" placeholder="회원 코드입력" id="code" required>
						</div>
						<div class="input-box">
							<span class="details">권한</span>
							<div id="radio_select">
								<input type="radio" value="user" checked="checked" name="right"
									required> &nbsp;일반 회원 <input type="radio" value="admin"
									name="right" required> &nbsp;관리자
							</div>
						</div>
						<div class="input-box">
							<span class="details">설치 지역</span>
							<div id="location">
								<div>
									<select name="h_area1" onChange="cat1_change(this.value,h_area2)" class="h_area1">
										<option>-선택-</option>
										<option value='1'>서울특별시</option>
										<option value='2'>부산광역시</option>
										<option value='3'>대구광역시</option>
										<option value='4'>광주광역시</option>
										<option value='5'>인천광역시</option>
										<option value='6'>대전광역시</option>
										<option value='7'>울산광역시</option>
										<option value='8'>세종특별자치시</option>
										<option value='9'>경기도</option>
										<option value='10'>강원도</option>
										<option value='11'>충청북도</option>
										<option value='12'>충청남도</option>
										<option value='14'>전라북도</option>
										<option value='13'>전라남도</option>
										<option value='15'>경상북도</option>
										<option value='16'>경상남도</option>
										<option value='17'>제주특별자치도</option>
									</select> <select name="h_area2" onchange="changeValue(this)">
										<option>-선택-</option>
									</select>
								</div>

							</div>
						</div>
					</div>

				</form>
				<div class="button">
					<input type="button" class="btn btn-primary" id="btn-save"
						value="회원가입">
				</div>
				<div class="button">
					<input type="reset" class="btn btn-primary" value="취소"
						onclick="history.back()">
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>