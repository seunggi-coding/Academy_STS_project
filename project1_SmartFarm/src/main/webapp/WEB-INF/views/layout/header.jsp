<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<!-- <title>Header</title> -->

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/headers/">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/footer.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@700&display=swap"
	rel="stylesheet">

<script src="https://kit.fontawesome.com/983b1b1bfd.js"
	crossorigin="anonymous"></script>

<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

#icon-size {
	width: 15px !important;
	height: 15px !important;
}

#txt-color {
	margin-left: -19px;
	font-size: 12px;
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100%;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

#txt-color1, #txt-color2, #txt-color3, #txt-color4, #txt-color5,
	#txt-color6, #txt-color7 {
	color: white !important;
	padding: 10px 10px !important;
}

.nav_names {
	font-size: 8px;
}

#main-logo {
	font-size: 30px;
}

/* 테블릿 이상 CSS */
@media all and (min-width:768px) and (max-width:1023px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
	#txt-color1, #txt-color2, #txt-color3, #txt-color4, #txt-color5,
		#txt-color6, #txt-color7 {
		padding: 20px 18px !important;
	}
	.nav_names {
		font-size: 16px;
	}
	#icon_font {
		font-size: 20px !important;
	}
}

@media ( min-width : 1024px) {
	#smartfarm_name {
		font-size: 48px;
		padding-top: 10px;
	}
	.container {
		height: 150px;
	}
	#main-logo {
		line-height: 3;
	}
	.nav_names {
		font-size: 30px;
	}
	.nav_link {
		font-size: 25px !important;
	}
	#icon_font {
		font-size: 28px !important;
	}
}
</style>

</head>
<body>
<div id="headerjsp">

	<main>
		<header>
			<div class="px-3 py-2 text-bg-dark"
				style="background-color: #344D67 !important;">
				<div class="container"
					style="padding: 0 !important; max-width: 100% !important;">
					<div
						class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
						<a href="/"
							class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none"
							id="main-logo"> <i class="fa-solid fa-tractor"
							style="font-size: 40px"></i>&nbsp;<span
							style="font-family: 'Sunflower', sans-serif;" id="smartfarm_name">Nature
								FARM</span>
						</a>

						<ul
							class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small"
							id="icon_font" style="padding: 0; text-align: center;">
						
							<li><a href="/device" class="nav-link text-white"
								id="txt-color2"> <i class="fa-solid fa-mobile-screen-button"
									id="icon-size2"></i><br> <span
									style="font-family: 'Sunflower', sans-serif;" class="nav_names">Device</span>
							</a></li>
							<li><a href="/auth/notice" class="nav-link text-white"
								id="txt-color3"> <i class="fa-solid fa-volume-high"
									id="icon-size3"></i><br> <span
									style="font-family: 'Sunflower', sans-serif;" class="nav_names">Notice</span>
							</a></li>
							<li><a href="/auth/inquiry" class="nav-link text-white"
								id="txt-color4"> <i class="fa-brands fa-quora"
									id="icon-size4"></i><br> <span
									style="font-family: 'Sunflower', sans-serif;" class="nav_names">FAQs</span>
							</a></li>
							<li><a href="/crop" class="nav-link text-white"
								id="txt-color5"> <i class="fa-solid fa-info" id="icon-size5"></i><br>
									<span style="font-family: 'Sunflower', sans-serif;"
									class="nav_names">Info </span>
							</a></li>

							<c:choose>
								<c:when test="${empty principal}">
									<li><a href="/auth/loginForm" class="nav-link text-white"
										id="txt-color6"> <i class="fa-solid fa-circle-user"
											id="icon-size6"></i><br> <span
											style="font-family: 'Sunflower', sans-serif;"
											class="nav_names">Sign in</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/user/updateForm" class="nav-link text-white"
										id="txt-color6"> <i class="fa-solid fa-circle-user"
											id="icon-size6"></i><br> <span
											style="font-family: 'Sunflower', sans-serif;"
											class="nav_names">Member</span>
									</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${empty principal}">
									<li><a href="/auth/joinForm" class="nav-link text-white"
										id="txt-color6"> <i class="fa-solid fa-circle-user"
											id="icon-size6"></i><br> <span
											style="font-family: 'Sunflower', sans-serif;"
											class="nav_names">Sign up</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/logout" class="nav-link text-white"
										id="txt-color6"> <i class="fa-solid fa-lock"
											id="icon-size6"></i><br> <span
											style="font-family: 'Sunflower', sans-serif;"
											class="nav_names">Logout</span>
									</a></li>
								</c:otherwise>
							</c:choose>


						</ul>
					</div>
				</div>
			</div>

		</header>
	</main>
</div>