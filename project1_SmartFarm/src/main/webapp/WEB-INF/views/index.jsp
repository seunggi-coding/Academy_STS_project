<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>
<title>Index</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Nanum+Pen+Script&family=Yeon+Sung&display=swap"
	rel="stylesheet">



<!-- Notice, QNA board -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Fontawesome -->
<script src="https://kit.fontawesome.com/983b1b1bfd.js"
	crossorigin="anonymous"></script>

<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- weather.js -->
<script src="/js/weather.js"></script>

<style>
@media ( max-width : 767px) {
	#farm_contents {
		display: inline-block;
		width: 100%;
		height: 100%;
	}

	/* 메인페이지 비디오 */
	.main_video {
		width: 100%;
		height: 220px;
		object-fit: fill;
		margin-bottom: -7px;
	}

	/* 공지사항, QNAs */
	.farm_section2 {
		margin-top: 50px;
		margin-bottom: 60px;
	}
	.notice {
		padding: 0;
	}
	.notice a {
		text-decoration: none;
		color: black;
		font-size: 11px;
	}
	.notice li {
		list-style: none;
		line-height: 2;
		border-bottom: 1px solid #d1d3d4;
	}
	.qna {
		padding: 0;
	}
	.qna a {
		text-decoration: none;
		color: black;
		font-size: 11px;
	}
	.qna li {
		list-style: none;
		line-height: 2;
		border-bottom: 1px solid #d1d3d4;
	}

	/* 참고영상 */
	.farm_section3 {
		margin-bottom: 60px;
	}
	.video_text {
		margin-bottom: 20px;
		text-align: center;
		font-size: 15px;
		font-weight: bold;
	}
	.farm_video {
		width: 100%;
		height: 200px;
	}
	#demo {
		margin: 0 auto;
		width: 80% !important;
	}
	#version_pc {
		display: none;
	}
	.video_section {
		display: none;
	}
	.carousel-control-next-icon {
		background-image:
			url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%2fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
	}
	.carousel-control-prev-icon {
		background-image:
			url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%2fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");
	}

	/* Technology CSS */
	.farm_tech {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
		width: 80%;
		margin: 0 auto;
	}
	.tech_section {
		width: 100%;
		margin-bottom: 45px;
	}
	.technology {
		text-align: center;
		margin-bottom: 20px;
		font-size: 15px;
	}
	.farm_hr {
		height: 2px;
		background-color: green;
		width: 90%;
		margin: 0 auto;
		margin-bottom: 40px;
	}
	.tech_image {
		margin: 0 auto;
		display: block;
		width: 30%;
	}
	.tech_title {
		text-align: center;
		margin-top: 30px;
		font-weight: bold;
		font-size: 15px;
	}
	.tech_contents {
		text-align: center;
		margin-top: 20px;
		font-size: 11px;
	}
	.swal2-container.swal2-center>.swal2-popup {
		background-color: rgb(248, 248, 248);
	}
}

/* Tablet CSS */
@media all and (min-width:768px) and (max-width:1023px) {
	#farm_contents {
		display: inline-block;
		width: 100%;
		height: 100%;
	}

	/* index video */
	.main_video {
		width: 100%;
		height: 400px;
		object-fit: fill;
		margin-bottom: -10px;
	}

	/* 공지사항, QNAs */
	.farm_section2 {
		margin-top: 60px;
		margin-bottom: 60px;
	}
	.container {
		margin: 0 auto !important;
		width: 90% !important;
	}
	.tab-content {
		width: 100%;
	}
	.container, .container-md, .container-sm {
		max-width: 1024px !important;
	}
	#menu1 {
		margin: 0 !important;
		width: 100% !important;
	}
	#menu2 {
		margin: 0 !important;
		width: 100% !important;
	}
	.nav-link {
		font-size: 20px;
	}
	#version_pc {
		display: none;
	}
	.notice {
		padding: 0;
		width: 100%;
	}
	.notice a {
		text-decoration: none;
		color: black;
		font-size: 18px;
	}
	.notice li {
		list-style: none;
		line-height: 3;
		border-bottom: 1px solid #d1d3d4;
	}
	.qna {
		padding: 0;
	}
	.qna a {
		text-decoration: none;
		color: black;
		font-size: 18px;
	}
	.qna li {
		list-style: none;
		line-height: 3;
		border-bottom: 1px solid #d1d3d4;
	}

	/* 참고영상 */
	.farm_section3 {
		margin-bottom: 60px;
	}
	.farm_video {
		width: 100%;
		height: 350px;
	}
	.video_text {
		margin-bottom: 40px;
		text-align: center;
		font-size: 23px;
		font-weight: bold;
	}
	#demo {
		margin: 0 auto;
		width: 70% !important;
	}
	.video_section {
		display: none;
	}
	.carousel-control-next-icon {
		background-image:
			url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%2fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
	}
	.carousel-control-prev-icon {
		background-image:
			url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%2fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");
	}

	/* Technology CSS */
	.form_section4 {
		margin-bottom: 65px;
	}
	.farm_tech {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
		width: 80%;
		margin: 0 auto;
	}
	.tech_section {
		width: 30%;
	}
	.technology {
		text-align: center;
		margin-bottom: 40px;
		font-size: 23px;
	}
	.farm_hr {
		height: 2px;
		background-color: green;
		width: 90%;
		margin: 0 auto;
		margin-bottom: 40px;
	}
	.tech_image {
		margin: 0 auto;
		display: block;
		width: 50%;
	}
	.tech_title {
		text-align: center;
		margin-top: 30px;
		font-weight: bold;
		font-size: 18px;
	}
	.tech_contents {
		text-align: center;
		margin-top: 25px;
		font-size: 14.1px;
	}
	.swal2-container.swal2-center>.swal2-popup {
		background-color: rgb(248, 248, 248);
	}
}

/* PC CSS */
@media ( min-width :1024px) {
	#farm_contents {
		display: inline-block;
		width: 100%;
		height: 100%;
	}

	/* index video */
	.main_video {
		width: 100%;
		height: 750px;
		object-fit: fill;
		margin-bottom: -7px;
	}

	/* 날씨위젯 CSS */
	#ww_17450aa582262 div {
		font-size: 25px;
	}
	#ww_17450aa582262 .ww-box svg {
		height: 60px !important;
		width: 60px !important;
	}

	/* 공지사항, 문의게시판 */
	.farm_section2 {
		margin-top: 150px;
		margin-bottom: 150px;
	}
	.container {
		margin: 0 auto !important;
		width: 95% !important;
	}
	.tab-content {
		width: 100%;
	}
	.container, .container-md, .container-sm {
		max-width: 1024px !important;
	}
	#menu1 {
		margin: 0 !important;
		width: 100% !important;
	}
	#menu2 {
		margin: 0 !important;
		width: 100% !important;
		color: black;
		height: 100%;
	}
	.nav-link {
		font-size: 25px;
		color: black;
	}
	#version_mo_ta {
		display: none;
	}
	#version_pc {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
		max-width: 100% !important;
		height: 100%;
	}
	.board_section1 {
		width: 47.5%;
		justify-content: flex-start;
	}
	.board_section2 {
		width: 47.5%;
		justify-content: flex-end;
	}
	.notice {
		padding: 0;
		width: 100%;
	}
	.notice a {
		text-decoration: none;
		color: black;
		font-size: 20px;
	}
	.notice li {
		list-style: none;
		line-height: 3;
		border-bottom: 1px solid #d1d3d4;
	}
	.qna {
		padding: 0;
	}
	.qna a {
		text-decoration: none;
		color: black;
		font-size: 20px;
	}
	.qna li {
		list-style: none;
		line-height: 3;
		border-bottom: 1px solid #d1d3d4;
	}

	/* 참고영상 */
	.farm_section3 {
		margin-top: 150px;
		margin-bottom: 50px;
	}
	.video_text {
		margin-bottom: 40px;
		text-align: center;
		font-weight: bold;
		font-size: 27px;
	}
	.farm_video {
		width: 100%;
	}
	#demo {
		margin: 0 auto;
		width: 90% !important;
		display: none;
	}
	.video_section {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
		width: 90%;
		margin: 0 auto;
	}
	.video_01 {
		width: 30%;
	}
	.video_02 {
		width: 30%;
	}
	.video_03 {
		width: 30%;
	}
	.video_01 a, .video_02 a, .video_03 a {
		display: block;
		width: 100%;
		height: 100%;
		overflow: hidden;
		position: relative;
	}
	.video_01 figcaption, .video_02 figcaption, .video_03 figcaption {
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.7);
		color: #fff;
		text-align: center;
		line-height: 200px;
		position: absolute; /* 기본기준 : body */
		top: 0;
		left: 0;
		opacity: 0; /* 처음에 안보이게 처리 */
		transition: 0.3s; /* 변화되는 CSS에 시간차를 줌 */
	}
	.video_01 figcaption:after, .video_02 figcaption:after, .video_03 figcaption:after
		{
		content: ''; /* 비워둠 */
		display: block;
		width: calc(100% - 40px);
		height: calc(100% - 40px);
		border: 1px solid #fff;
		box-sizing: border-box;
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		margin: auto; /* 기준에서 정가운데 오도록 처리 */
	}
	.video_01 a:hover figcaption, .video_01 a:focus figcaption, .video_02 a:hover figcaption,
		.video_02 a:focus figcaption, .video_03 a:hover figcaption, .video_03 a:focus figcaption
		{
		opacity: 1;
	}

	/* Technology CSS */
	.form_section4 {
		margin-bottom: 100px;
	}
	.farm_tech {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
		width: 80%;
		margin: 0 auto;
	}
	.tech_section {
		width: 30%;
	}
	.technology {
		text-align: center;
		margin-bottom: 40px;
	}
	.farm_hr {
		height: 2px;
		background-color: green;
		width: 90%;
		margin: 0 auto;
		margin-bottom: 40px;
	}
	.tech_contents {
		text-align: center;
		margin-top: 25px;
		font-size: 20px;
	}
	.tech_title {
		text-align: center;
		margin-top: 30px;
		font-weight: bold;
		font-size: 28px;
	}
	.tech_image {
		margin: 0 auto;
		display: block;
		width: 50%;
	}
	.swal2-container.swal2-center>.swal2-popup {
		background-color: rgb(248, 248, 248);
	}
}
</style>

</head>
<body onload="weather_alert();">

	<!-- index video -->
	<video class="main_video" autoplay="autoplay" muted="muted" loop="loop"
		playsinline="">
		<source src="video/mainvideo.mp4">
	</video>

	<!-- 날씨 위젯 -->
	<%@ include file="layout/weatherWidget.jsp"%>

	<div id="farm_contents">


		<div class="farm_section2">
			<div class="container mt-3" id="version_mo_ta">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs">

					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#menu1">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#menu2">문의게시판</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="menu1" class="container tab-pane active">
						<br>
						<ul class="notice">
							<c:forEach var="notice" items="${notices.content}">
								<li><i class="fa-solid fa-volume-high"></i>&nbsp;<a
									href="/notice/${notice.id}">${notice.title}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div id="menu2" class="container tab-pane fade">
						<br>
						<ul class="qna">
							<c:forEach var="inquiry" items="${inquirys.content}">
								<li><i class="fa-brands fa-quora"></i>&nbsp;<a
									href="/inquiry/${inquiry.id}">${inquiry.title}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<div class="container mt-3" id="version_pc">

				<!-- Nav tabs -->
				<div class="board_section1">
					<ul class="nav nav-tabs">
						<li class="nav-item" onclick="location.href='auth/notice';"><a
							class="nav-link active" data-toggle="tab" href="#">공지사항</a></li>
					</ul>
					<div class="tab-content">
						<div id="menu1" class="container tab-pane active">
							<br>
							<ul class="notice">
								<c:forEach var="notice" items="${notices.content}">
									<li><i class="fa-solid fa-volume-high"></i>&nbsp;<a
										href="/notice/${notice.id}">${notice.title}</a></li>
								</c:forEach>
							</ul>

						</div>
					</div>
				</div>

				<!-- Tab panes -->
				<div class="board_section2">
					<ul class="nav nav-tabs">
						<li class="nav-item" onclick="location.href='auth/inquiry';"><a
							href="#" class="nav-link active" data-toggle="tab">문의게시판</a></li>
					</ul>

					<div class="tab-content">
						<div id="menu2" class="container tab-pane active">
							<br>
							<ul class="qna">
								<c:forEach var="inquiry" items="${inquirys.content}">
									<li><i class="fa-brands fa-quora"></i>&nbsp;<a
										href="/inquiry/${inquiry.id}">${inquiry.title}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="farm_section3">
			<h3 class="video_text">참고영상</h3>
			<hr class="farm_hr">

			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://img.youtube.com/vi/8dD6e0Jy8Dc/0.jpg"
							alt="image" class="farm_video" data-toggle="modal"
							data-target="#myModal1">
					</div>
					<div class="carousel-item">
						<img src="https://img.youtube.com/vi/GTOrUdkA8NM/0.jpg"
							alt="image" class="farm_video" data-toggle="modal"
							data-target="#myModal2">
					</div>
					<div class="carousel-item">
						<img src="https://img.youtube.com/vi/9qlqN3Cfly4/0.jpg"
							alt="image" class="farm_video" data-toggle="modal"
							data-target="#myModal3">
					</div>
				</div>

				<!-- Left and right controls -->

				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon" style="color: black;"></span>

				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>


			<!-- PC version 참고영상 div -->

			<div class="video_section">

				<div class="video_01">
					<a data-toggle="modal" data-target="#myModal1">
						<figure>
							<img src="https://img.youtube.com/vi/8dD6e0Jy8Dc/0.jpg"
								alt="image" class="farm_video">
							<figcaption>자세히 보기</figcaption>
						</figure>
					</a>
				</div>

				<div class="video_02">
					<a data-toggle="modal" data-target="#myModal2">
						<figure>
							<img src="https://img.youtube.com/vi/GTOrUdkA8NM/0.jpg"
								alt="image" class="farm_video">
							<figcaption>자세히 보기</figcaption>
						</figure>
					</a>
				</div>

				<div class="video_03">
					<a data-toggle="modal" data-target="#myModal3">
						<figure>
							<img src="https://img.youtube.com/vi/9qlqN3Cfly4/0.jpg"
								alt="image" class="farm_video">
							<figcaption>자세히 보기</figcaption>
						</figure>
					</a>
				</div>

			</div>

			<div class="container">
				<!-- The Modal -->

				<div class="modal fade" id="myModal1">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title"></h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<iframe width="100%" height="400"
									src="https://www.youtube.com/embed/8dD6e0Jy8Dc?autoplay=1&mute=1"
									title="YouTube video player" frameborder="0"
									allow="accelerometer;  clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>

						</div>
					</div>
				</div>

				<div class="modal fade" id="myModal2">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title"></h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<iframe width="100%" height="400"
									src="https://www.youtube.com/embed/GTOrUdkA8NM?autoplay=1&mute=1"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="myModal3">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title"></h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<iframe width="100%" height="400"
									src="https://www.youtube.com/embed/9qlqN3Cfly4?autoplay=1&mute=1"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="form_section4">

			<h3 class="technology">Technology</h3>

			<hr class="farm_hr">

			<div class="farm_tech">

				<div class="tech_section">
					<img src="image/watering.png" class="tech_image">
					<h4 class="tech_title">자동 관수 시스템</h4>
					<p class="tech_contents">
						토양 수분 센서를 이용하여 <br>설정 기준에 따라 자동으로 펌프를 제어
					</p>

				</div>

				<div class="tech_section">
					<img src="image/drone.png" class="tech_image">
					<h4 class="tech_title">첨단 드론 활용</h4>
					<p class="tech_contents">
						효율적인 농약 살포 방식으로<br> 노동력 감소 및 생산비 절감
					</p>
				</div>

				<div class="tech_section">
					<img src="image/device.png" class="tech_image">
					<h4 class="tech_title">최적화된 재배 환경</h4>
					<p class="tech_contents">
						온도 센서를 이용하여<br> 설정 기준에 따라 자동으로<br> 채광막, 비닐하우스 측면 제어
					</p>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="layout/footer.jsp"%>