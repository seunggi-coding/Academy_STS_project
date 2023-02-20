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
<link rel="stylesheet" href="/css/crop_info.css">
<link rel="stylesheet" href="/css/base_button.css">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<%@ include file="../layout/header.jsp"%>
</head>
<body>
	<div id="crop_info_container">
		<div id="crop_info_head">
			<h2>재배작물 정보</h2>
		</div>
		<div id="card_box">
			<ul class="grid cs-style-1">
				<li class="card_box_undo">
					<figure>
						<div>
							<img src="/image/Chili.jpg" alt="고추">
							<div class="img_undo_text">
								<p>고추</p>
							</div>
						</div>
						<figcaption class="mobile_tablet_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1개씩 밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장과로 8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
						<figcaption class="pc_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 1개씩 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 장과로 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
					</figure>
				</li>
				
				<li class="card_box_undo">
					<figure>
						<div>
							<img src="/image/Cucumber.jpg" alt="오이">
							<div class="img_undo_text">
								<p>오이</p>
							</div>
						</div>
						<figcaption class="mobile_tablet_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1개씩 밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장과로 8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
						<figcaption class="pc_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 1개씩 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 장과로 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
					</figure>
				</li>
				
				<li class="card_box_undo">
					<figure>
						<div>
							<img src="/image/Strawberry.jpg" alt="딸기">
							<div class="img_undo_text">
								<p>고추</p>
							</div>
						</div>
						<figcaption class="mobile_tablet_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1개씩 밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장과로 8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
						<figcaption class="pc_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 1개씩 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 장과로 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
					</figure>
				</li>
				
				<li class="card_box_undo">
					<figure>
						<div>
							<img src="/image/Tomato.jpg" alt="토마토">
							<div class="img_undo_text">
								<p>고추</p>
							</div>
						</div>
						<figcaption class="mobile_tablet_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1개씩 밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장과로 8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
						<figcaption class="pc_card">
							<ul class="card-text">
								<li>밭에서 재배한다.</li>
								<li>여름에 잎겨드랑이에서 흰 꽃이 1개씩 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;밑을 향해 달린다.</li>
								<li>열매는 수분이 적은 원뿔 모양 장과로 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8∼10월에 익는다.</li>
							</ul>
							<a href="/crop_detail">상세보기</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
<%@ include file="../layout/footer.jsp"%>