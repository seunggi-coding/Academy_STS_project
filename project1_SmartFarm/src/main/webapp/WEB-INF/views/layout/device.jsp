<%@page import="com.cos.farm.config.auth.PrincipalDetail"%>
<%@page import="com.cos.farm.config.auth.PrincipalDetailService"%>
<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Device</title>
<%@ include file="header.jsp"%>
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
<script src="/js/weather_control.js"></script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<%! int x = 0; %>
<style>
@media ( max-width : 767px) {
	#farm_contents {
		display: inline-block;
		width: 100%;
	}

	/* Banner */
	.farm_banner {
		width: 100%;
	}
	.farm_title {
		margin-top: 5px;
		margin-bottom: -5px;
		text-align: center;
		font-size: 17px;
	}
	#farm_controller {
		border: 1px solid #F2E5E5;
		background-color: #FFFBEB;
		width: 80%;
		height: 200px;
		margin: 0 auto;
		margin-top: 20px;
		border-radius: 4%;
	}
	.farm_switch {
		width: 80px;
		margin: 30px;
		margin-bottom: 5px;
		margin-right: 30px;
		height: 30px;
		display: block;
		position: relative;
		border-radius: 30px;
		background-color: #fff;
		box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
		cursor: pointer;
		height: 30px;
	}
	.farm_switch .toggleButton {
		width: 30px;
		height: 30px;
		position: absolute;
		top: 50%;
		left: 0px;
		transform: translateY(-50%);
		border-radius: 50%;
		background: #f03d3d;
	}
	.farm_switch.active {
		background: #f03d3d;
	}
	.farm_switch.active .toggleButton {
		left: calc(100% - 30px);
		background: #fff;
	}
	.farm_switch, .toggleButton {
		transition: all 0.2s ease-in;
	}
	.farm1_button1 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
	}
	.text_water {
		line-height: 7;
		margin-left: 30px;
		font-size: 13px;
	}
	.farm1_button2 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
	}
	.text_window {
		line-height: 7;
		margin-left: 30px;
		font-size: 13px;
	}
	.farm1_button3 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
	}
	.text_ceiling {
		line-height: 7;
		margin-left: 30px;
		font-size: 13px;
	}
	.farm_section1 {
		margin-bottom: 30px;
	}
}

/* Tablet CSS */
@media all and (min-width:768px) and (max-width:1023px) {
	#farm_contents {
		display: inline-block;
		width: 100%;
	}

	/* Banner */
	.farm_banner {
		width: 100%;
	}
	.farm_title {
		margin-top: 15px;
		margin-bottom: -5px;
		text-align: center;
	}
	#farm_controller {
		border: 1px solid #F2E5E5;
		background-color: #FFFBEB;
		width: 75%;
		height: 300px;
		margin: 0 auto;
		margin-top: 20px;
		border-radius: 6%;
	}
	.farm_switch {
		width: 130px;
		margin: 30px;
		height: 50px;
		display: block;
		position: relative;
		border-radius: 30px;
		background-color: #fff;
		box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
		cursor: pointer;
	}
	.farm_switch .toggleButton {
		width: 40px;
		height: 40px;
		position: absolute;
		top: 50%;
		left: 4px;
		transform: translateY(-50%);
		border-radius: 50%;
		background: #f03d3d;
	}
	.farm_switch.active {
		background: #f03d3d;
	}
	.farm_switch.active .toggleButton {
		left: calc(100% - 44px);
		background: #fff;
	}
	.farm_switch, .toggleButton {
		transition: all 0.2s ease-in;
	}
	.farm1_button1 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
		margin-bottom: 35px;
	}
	.text_water {
		line-height: 5;
		margin-left: 50px;
		font-size: 22px;
	}
	.farm1_button2 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
		margin-bottom: 35px;
	}
	.text_window {
		line-height: 5;
		margin-left: 50px;
		font-size: 22px;
	}
	.farm1_button3 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
	}
	.text_ceiling {
		line-height: 5;
		margin-left: 50px;
		font-size: 22px;
	}
	.farm_section1 {
		margin-bottom: 30px;
	}
	footer {
		margin-bottom: 50px;
	}
}

/* PC CSS */
@media ( min-width :1024px) {
	#farm_contents {
		display: inline-block;
		width: 100%;
		height: 100%;
		margin-bottom: 150px;
	}

	/* Banner */
	.farm_banner {
		width: 100%;
	}
	.farm_title {
		margin-top: 15px;
		margin-bottom: -5px;
		text-align: center;
	}
	#farm_controller {
		border: 1px solid #F2E5E5;
		background-color: #FFFBEB;
		width: 38%;
		height: 340px;
		margin: 0 auto;
		margin-top: 20px;
		border-radius: 7%;
	}
	.farm_switch {
		width: 130px;
		margin: 30px;
		height: 50px;
		display: block;
		position: relative;
		border-radius: 30px;
		background-color: #fff;
		box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
		cursor: pointer;
	}
	.farm_switch .toggleButton {
		width: 40px;
		height: 40px;
		position: absolute;
		top: 50%;
		left: 4px;
		transform: translateY(-50%);
		border-radius: 50%;
		background: #f03d3d;
	}
	.farm_switch.active {
		background: #f03d3d;
	}
	.farm_switch.active .toggleButton {
		left: calc(100% - 44px);
		background: #fff;
	}
	.farm_switch, .toggleButton {
		transition: all 0.2s ease-in;
	}
	.farm1_button1 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
		margin-bottom: 35px;
	}
	.text_water {
		line-height: 5;
		margin-left: 50px;
		font-size: 24px;
	}
	.farm1_button2 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
		margin-bottom: 35px;
	}
	.text_window {
		line-height: 5;
		margin-left: 50px;
		font-size: 24px;
	}
	.farm1_button3 {
		display: flex !important;
		justify-content: space-between;
		height: 50px;
	}
	.text_ceiling {
		line-height: 5;
		margin-left: 50px;
		font-size: 24px;
	}
	.farm_section1 {
		height: 80%;
		margin-top: 100px;
		display: flex;
		flex-flow: row wrap;
	}

	/* 날씨위젯 CSS */
	#ww_17450aa582262 div {
		font-size: 25px;
	}
	#ww_17450aa582262 .ww-box svg {
		height: 60px !important;
		width: 60px !important;
	}
}
</style>

</head>
<body>
	
	<!-- banner -->
	<img src="image/Farm_banner.png" class="farm_banner">

	<!-- 날씨 위젯 -->
	<%@ include file="weatherWidget.jsp"%>

	<div id="farm_contents">

		<div class="farm_section1">
			<div id="farm_controller">
				<h4 class="farm_title">딸기농장(1동)</h4>

				<div class="farm1_button1">
					<p class="text_water">
						<i class="fa-solid fa-droplet"></i>&nbsp;1동 관수
					</p>
					<label for="toggle" id="toggleSwitch1" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button2">
					<p class="text_window">
						<i class="fa-solid fa-fan"></i>&nbsp;1동 측창
					</p>
					<label for="toggle" id="toggleSwitch2" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button3">
					<p class="text_ceiling">
						<i class="fa-solid fa-sun"></i>&nbsp;1동 차광막
					</p>
					<label for="toggle" id="toggleSwitch3" class="farm_switch">
						<span class="toggleButton"></span>
					</label>

				</div>
			</div>
			<div id="farm_controller">
				<h4 class="farm_title">토마토농장(2동)</h4>

				<div class="farm1_button1">
					<p class="text_water">
						<i class="fa-solid fa-droplet"></i>&nbsp;2동 관수
					</p>
					<label for="toggle" id="toggleSwitch4" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button2">
					<p class="text_window">
						<i class="fa-solid fa-fan"></i>&nbsp;2동 측창
					</p>
					<label for="toggle" id="toggleSwitch5" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button3">
					<p class="text_ceiling">
						<i class="fa-solid fa-sun"></i>&nbsp;2동 차광막
					</p>
					<label for="toggle" id="toggleSwitch6" class="farm_switch">
						<span class="toggleButton"></span>
					</label>

				</div>
			</div>
			<div id="farm_controller">
				<h4 class="farm_title">고추농장(3동)</h4>

				<div class="farm1_button1">
					<p class="text_water">
						<i class="fa-solid fa-droplet"></i>&nbsp;3동 관수
					</p>
					<label for="toggle" id="toggleSwitch7" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button2">
					<p class="text_window">
						<i class="fa-solid fa-fan"></i>&nbsp;3동 측창
					</p>
					<label for="toggle" id="toggleSwitch8" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button3">
					<p class="text_ceiling">
						<i class="fa-solid fa-sun"></i>&nbsp;3동 차광막
					</p>
					<label for="toggle" id="toggleSwitch9" class="farm_switch">
						<span class="toggleButton"></span>
					</label>

				</div>
			</div>
			<div id="farm_controller">
				<h4 class="farm_title">오이농장(4동)</h4>

				<div class="farm1_button1">
					<p class="text_water">
						<i class="fa-solid fa-droplet"></i>&nbsp;4동 관수
					</p>
					<label for="toggle" id="toggleSwitch10" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button2">
					<p class="text_window">
						<i class="fa-solid fa-fan"></i>&nbsp;4동 측창
					</p>
					<label for="toggle" id="toggleSwitch11" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>
				<div class="farm1_button3">
					<p class="text_ceiling">
						<i class="fa-solid fa-sun"></i>&nbsp;4동 차광막
					</p>
					<label for="toggle" id="toggleSwitch12" class="farm_switch">
						<span class="toggleButton"></span>
					</label>
				</div>

			</div>
		</div>

	</div>
	<script src="/js/switch.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>