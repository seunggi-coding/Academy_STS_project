function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);

	return year + month + day;
}
function getTimes() {
	var date = new Date();
	var hours = (date.getHours() - 1);
	var hours_result;

	if (hours < 10) {
		hours_result = '0' + hours.toString();
	} else {
		hours_result = hours.toString();
	}

	console.log(hours_result + '00');
	return hours_result + '00';
}
var nx = String(61);
var ny = String(121);

var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'Or8eOwEYi6lEWVN3C%2BajdpImKDgc%2FEb28WROF5Q886ajPx3RP92WzzOrew85pMUsDTDP1ACEcrgROTKTXoQonQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /**/
queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(getToday()); /**/
queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent(getTimes()); /**/
queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(nx);
queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(ny);
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function() {
	console.log("nx : " + nx);
	console.log("ny : " + ny);
	
	if (this.readyState == 4) {

		var xml = this.responseXML;
		var items = xml.getElementsByTagName('item');
		var temp, humidity, rainfall, precipitation_form, windspeed;
		var num = 0;
		let test = $("#farm").text();

		for (var i = 0; i < items.length; i++) {

			if (items[i].childNodes[2].textContent == 'T1H') {	//기온
				temp = items[i].childNodes[5].textContent;
			}
			if (items[i].childNodes[2].textContent == 'REH') {	//습도
				humidity = items[i].childNodes[5].textContent;
			}
			if (items[i].childNodes[2].textContent == 'RN1') {	//1시간 강수량
				rainfall = items[i].childNodes[5].textContent;

				if (rainfall == '0') {
					rainfall = '0';
				} else if (rainfall > 0 && rainfall < 1.0) {
					rainfall = '1.0mm미만';
				} else if (rainfall >= 1.0 && rainfall < 30.0) {
					rainfall = '1.0~29.0mm';
				} else if (rainfall >= 30.0 && rainfall < 50.0) {
					rainfall = '30.0~50.0mm';
				} else if (rainfall >= 50.0) {
					rainfall = '50.0mm이상';
				}

			}
			if (items[i].childNodes[2].textContent == 'PTY') {	//강수형태 [없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)]
				precipitation_form = items[i].childNodes[5].textContent;

				if (precipitation_form == '0') {
					precipitation_form = '강수는 없습니다.';
				} else if (precipitation_form == '1') {
					precipitation_form = '비가 올 예정이며';
				} else if (precipitation_form == '2') {
					precipitation_form = '비나 눈이 올 예정이며';
				} else if (precipitation_form == '3') {
					precipitation_form = '눈이 올 예정이며';
				} else if (precipitation_form == '5') {
					precipitation_form = '빗방울이 내릴 예정이며';
				} else if (precipitation_form == '6') {
					precipitation_form = '빗방울이나 눈이 날릴 예정이며';
				} else if (precipitation_form == '7') {
					precipitation_form = '눈이 날릴 예정이며';
				}
			}
			if (items[i].childNodes[2].textContent == 'WSD') {	//풍속
				windspeed = items[i].childNodes[5].textContent;

				if (windspeed == 0) {
					windspeed = '바람이 아주 약하게 불 예정입니다.';
				} else if (windspeed > 0 && windspeed < 4) {
					windspeed = '바람이 약하게 불 예정입니다.';
				} else if (windspeed >= 4 && windspeed < 9) {
					windspeed = '바람이 약간 강하게 불 예정입니다.';
				} else if (windspeed >= 9 && windspeed < 14) {
					windspeed = '바람이 강하게 불 예정입니다.';
				} else if (windspeed >= 14) {
					windspeed = '바람이 매우 강하게 불 예정입니다.';
				}
			}

		}

		//토글스위치1 - 딸기
		const toggle1 = document.getElementById('toggleSwitch1');
		strawberry_water = function() {
			num = 1;
			toggle1.addEventListener('click', strawberry_water2, { once: true });
			console.log(num);

			Swal.fire({
				title: '관수 장치를 작동시키겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 17℃ ~ 20℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle1.classList.remove('active');
					toggle1.addEventListener('click', strawberry_water, { once: true });
				}
			});
		}

		strawberry_water2 = function() {
			Swal.fire({
				title: "관수장치",
				html: '작동을 중지합니다.',
				icon: 'success'
			});
			num = 0;
			toggle1.addEventListener('click', strawberry_water, { once: true });
			console.log(num);
		}

		const toggle2 = document.getElementById('toggleSwitch2');
		strawberry_window = function() {
			num = 1;
			toggle2.addEventListener('click', strawberry_window2, { once: true });
			console.log(num);

			Swal.fire({
				title: '측면을 개방시키겠습니까?',
				html: '현재 온도는 ' + temp + '℃이고,<br>' + windspeed + '<br>' + precipitation_form + '<br>적정 온도: 17℃ ~ 20℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle2.classList.remove('active');
					toggle2.addEventListener('click', strawberry_window, { once: true });
				}
			});
		}

		strawberry_window2 = function() {
			Swal.fire({
				title: "측면 제어장치",
				html: '측면을 폐쇄합니다.',
				icon: 'success'
			});
			num = 0;
			toggle2.addEventListener('click', strawberry_window, { once: true });
			console.log(num);
		}

		const toggle3 = document.getElementById('toggleSwitch3');
		strawberry_sun = function() {
			num = 1;
			toggle3.addEventListener('click', strawberry_sun2, { once: true });
			console.log(num);

			Swal.fire({
				title: '차광막을 펼치겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 17℃ ~ 20℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle3.classList.remove('active');
					toggle3.addEventListener('click', strawberry_sun, { once: true });
				}
			});
		}

		strawberry_sun2 = function() {
			Swal.fire({
				title: "차광막 제어 장치",
				html: '차광막을 접습니다.',
				icon: 'success'
			});
			num = 0;
			toggle3.addEventListener('click', strawberry_sun, { once: true });
			console.log(num);
		}



		//토글스위치2 - 토마토
		const toggle4 = document.getElementById('toggleSwitch4');
		tomato_water = function() {
			num = 1;
			toggle4.addEventListener('click', tomato_water2, { once: true });
			console.log(num);

			Swal.fire({
				title: '관수 장치를 작동시키겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 17℃ ~ 27℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle4.classList.remove('active');
					toggle4.addEventListener('click', tomato_water, { once: true });
				}
			});
		}

		tomato_water2 = function() {
			Swal.fire({
				title: "관수장치",
				html: '작동을 중지합니다.',
				icon: 'success'
			});
			num = 0;
			toggle4.addEventListener('click', tomato_water, { once: true });
			console.log(num);
		}

		const toggle5 = document.getElementById('toggleSwitch5');
		tomato_window = function() {
			num = 1;
			toggle5.addEventListener('click', tomato_window2, { once: true });
			console.log(num);

			Swal.fire({
				title: '측면을 개방시키겠습니까?',
				html: '현재 온도는 ' + temp + '℃이고,<br>' + windspeed + '<br>' + precipitation_form + '<br>적정 온도: 17℃ ~ 27℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle5.classList.remove('active');
					toggle5.addEventListener('click', tomato_window, { once: true });
				}
			});
		}

		tomato_window2 = function() {
			Swal.fire({
				title: "측면 제어장치",
				html: '측면을 폐쇄합니다.',
				icon: 'success'
			});
			num = 0;
			toggle5.addEventListener('click', tomato_window, { once: true });
			console.log(num);
		}

		const toggle6 = document.getElementById('toggleSwitch6');
		tomato_sun = function() {
			num = 1;
			toggle6.addEventListener('click', tomato_sun2, { once: true });
			console.log(num);

			Swal.fire({
				title: '차광막을 펼치겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 17℃ ~ 27℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle6.classList.remove('active');
					toggle6.addEventListener('click', tomato_sun, { once: true });
				}
			});
		}

		tomato_sun2 = function() {
			Swal.fire({
				title: "차광막 제어 장치",
				html: '차광막을 접습니다.',
				icon: 'success'
			});
			num = 0;
			toggle6.addEventListener('click', tomato_sun, { once: true });
			console.log(num);
		}



		//토글스위치3 - 고추
		const toggle7 = document.getElementById('toggleSwitch7');
		chili_water = function() {
			num = 1;
			toggle7.addEventListener('click', chili_water2, { once: true });
			console.log(num);

			Swal.fire({
				title: '관수 장치를 작동시키겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 23℃ ~ 28℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle7.classList.remove('active');
					toggle7.addEventListener('click', chili_water, { once: true });
				}
			});
		}

		chili_water2 = function() {
			Swal.fire({
				title: "관수장치",
				html: '스프링클러 작동을 멈춥니다.',
				icon: 'success'
			});
			num = 0;
			toggle7.addEventListener('click', chili_water, { once: true });
			console.log(num);
		}

		const toggle8 = document.getElementById('toggleSwitch8');
		chili_window = function() {
			num = 1;
			toggle8.addEventListener('click', chili_window2, { once: true });
			console.log(num);

			Swal.fire({
				title: '측면을 개방시키겠습니까?',
				html: '현재 온도는 ' + temp + '℃이고,<br>' + windspeed + '<br>' + precipitation_form + '<br>적정 온도: 23℃ ~ 28℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle8.classList.remove('active');
					toggle8.addEventListener('click', chili_window, { once: true });
				}
			});
		}

		chili_window2 = function() {
			Swal.fire({
				title: "비닐하우스 측면 제어 장치",
				html: '작동을 멈춥니다.',
				icon: 'success'
			});
			num = 0;
			toggle8.addEventListener('click', chili_window, { once: true });
			console.log(num);
		}

		const toggle9 = document.getElementById('toggleSwitch9');
		chili_sun = function() {
			num = 1;
			toggle9.addEventListener('click', chili_sun2, { once: true });
			console.log(num);

			Swal.fire({
				title: '차광막을 펼치겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 13℃ ~ 28℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle9.classList.remove('active');
					toggle9.addEventListener('click', chili_sun, { once: true });
				}
			});
		}

		chili_sun2 = function() {
			Swal.fire({
				title: "차광막 제어 장치",
				html: '차광막을 접습니다.',
				icon: 'success'
			});
			num = 0;
			toggle9.addEventListener('click', chili_sun, { once: true });
			console.log(num);
		}



		//토글스위치4 - 오이
		const toggle10 = document.getElementById('toggleSwitch10');
		cucumber_water = function() {
			num = 1;
			toggle10.addEventListener('click', cucumber_water2, { once: true });
			console.log(num);

			Swal.fire({
				title: '관수 장치를 작동시키겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 20℃ ~ 26℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle10.classList.remove('active');
					toggle10.addEventListener('click', cucumber_water, { once: true });
				}
			});
		}

		cucumber_water2 = function() {
			Swal.fire({
				title: "관수장치",
				html: '스프링클러 작동을 멈춥니다.',
				icon: 'success'
			});
			num = 0;
			toggle10.addEventListener('click', cucumber_water, { once: true });
			console.log(num);
		}

		const toggle11 = document.getElementById('toggleSwitch11');
		cucumber_window = function() {
			num = 1;
			toggle11.addEventListener('click', cucumber_window2, { once: true });
			console.log(num);

			Swal.fire({
				title: '측면을 개방시키겠습니까?',
				html: '현재 온도는 ' + temp + '℃이고,<br>' + windspeed + '<br>' + precipitation_form + '<br>적정 온도: 20℃ ~ 26℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle11.classList.remove('active');
					toggle11.addEventListener('click', cucumber_window, { once: true });
				}
			});
		}

		cucumber_window2 = function() {
			Swal.fire({
				title: "비닐하우스 측면 제어 장치",
				html: '작동을 멈춥니다.',
				icon: 'success'
			});
			num = 0;
			toggle11.addEventListener('click', cucumber_window, { once: true });
			console.log(num);
		}

		const toggle12 = document.getElementById('toggleSwitch12');
		cucumber_sun = function() {
			num = 1;
			toggle12.addEventListener('click', cucumber_sun2, { once: true });
			console.log(num);

			Swal.fire({
				title: '차광막을 펼치겠습니까?',
				html: '현재 온도: ' + temp + '℃<br>적정 온도: 20℃ ~ 26℃',
				icon: 'question',

				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				cancelButtonText: '취소', // cancel 버튼 텍스트 지정

			}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					Swal.fire({
						title: '작동을 시작합니다.',
						icon: 'success'
					});
				} else {
					toggle12.classList.remove('active');
					toggle12.addEventListener('click', cucumber_sun, { once: true });
				}
			});
		}

		cucumber_sun2 = function() {
			Swal.fire({
				title: "차광막 제어 장치",
				html: '차광막을 접습니다.',
				icon: 'success'
			});
			num = 0;
			toggle12.addEventListener('click', cucumber_sun, { once: true });
			console.log(num);
		}

		toggle1.addEventListener('click', strawberry_water, { once: true }); // 이벤트 연결
		toggle2.addEventListener('click', strawberry_window, { once: true }); // 이벤트 연결
		toggle3.addEventListener('click', strawberry_sun, { once: true }); // 이벤트 연결
		toggle4.addEventListener('click', tomato_water, { once: true }); // 이벤트 연결
		toggle5.addEventListener('click', tomato_window, { once: true }); // 이벤트 연결
		toggle6.addEventListener('click', tomato_sun, { once: true }); // 이벤트 연결
		toggle7.addEventListener('click', chili_water, { once: true }); // 이벤트 연결
		toggle8.addEventListener('click', chili_window, { once: true }); // 이벤트 연결
		toggle9.addEventListener('click', chili_sun, { once: true }); // 이벤트 연결
		toggle10.addEventListener('click', cucumber_water, { once: true }); // 이벤트 연결
		toggle11.addEventListener('click', cucumber_window, { once: true }); // 이벤트 연결
		toggle12.addEventListener('click', cucumber_sun, { once: true }); // 이벤트 연결

	}
};
xhr.send('/');

$(window).on('beforeunload', function() {
    return '페이지를 벗어나면 설정이 초기화됩니다.';
});