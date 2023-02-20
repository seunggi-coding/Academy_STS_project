<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/crop_info_detail.css">
<%@ include file="../layout/header.jsp"%>
</head>
<body>
	<div id="crop_info_container">
		<div id="crop_info_head">
			<h2>재배작물 고추의 상세정보</h2>
		</div>
		<div id="card_box">
			<div id="card_box_inner">
				<div class="card">
					<img class="card-img-top" src="/image/Chili.jpg" alt="고추"
						style="width: 100%">
					<div class="card-body">
						<h4 class="card-title"
							style="text-align: center; padding-top: 5px;">고추</h4>
					</div>
				</div>


				<div class="mt-3" id="slide_text">
					<div class="buttons">
						<button type="button" class="btn btn-primary"
							data-toggle="collapse" data-target="#demo1">특징</button>
						<div id="demo1" class="collapse">
							<ul>
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 1개씩 밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 장과로 8∼10월에 익는다.</li>
							</ul>
						</div>
					</div>

					<div class="buttons">
						<button type="button" class="btn btn-primary"
							data-toggle="collapse" data-target="#demo2">재배 환경</button>
						<div id="demo2" class="collapse">
							<ul>
								<li>생육적온 : 낮 25~28℃, 밤 18~22℃</li>
								<li>개화결실의 적온 : 20~25℃</li>
							</ul>
						</div>
					</div>

					<div class="buttons">
						<button type="button" class="btn btn-primary"
							data-toggle="collapse" data-target="#demo3">관수 주기</button>
						<div id="demo3" class="collapse">
							<ul>
								<li>관수점 : pF 2.0~2.5</li>
								<li>관수량 : 150cm이랑에서 3일 1cm2당 15L</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>
<%@ include file="../layout/footer.jsp"%>