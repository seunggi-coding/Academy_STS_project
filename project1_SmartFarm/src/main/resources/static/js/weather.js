function getToday() {
	var date = new Date();
	var year = date.getFullYear();
	var month = ("0" + (1 + date.getMonth())).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);

	return year + month + day;
}
function getTimes() {
	var date = new Date();
	var hours = (date.getHours()-1);
	var hours_result;
	
	if(hours < 10) {
		hours_result = '0' + hours.toString();		
	} else {
		hours_result = hours.toString();		
	}
	
	console.log(hours_result+'00');
	return hours_result+'00';
}

var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'Or8eOwEYi6lEWVN3C%2BajdpImKDgc%2FEb28WROF5Q886ajPx3RP92WzzOrew85pMUsDTDP1ACEcrgROTKTXoQonQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /**/
queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(getToday()); /**/
queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent(getTimes()); /**/
queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('61');
queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('121');
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function() {
	if (this.readyState == 4) {
		console.log(this.responseXML); 

		var xml = this.responseXML;
		var items = xml.getElementsByTagName('item');
		var temp, humidity, rainfall, precipitation_form, windspeed;
		
		
		for (var i = 0; i < items.length; i++) {

			if (items[i].childNodes[2].textContent == 'T1H') {	//기온
				console.log(items[i].childNodes[2].textContent);
				console.log(items[i].childNodes[5].textContent);
				temp = items[i].childNodes[5].textContent;
			}
			if (items[i].childNodes[2].textContent == 'REH') {	//습도
				console.log(items[i].childNodes[2].textContent);
				console.log(items[i].childNodes[5].textContent);
				humidity = items[i].childNodes[5].textContent;
			}
			if (items[i].childNodes[2].textContent == 'RN1') {	//1시간 강수량
				console.log(items[i].childNodes[2].textContent);
				console.log(items[i].childNodes[5].textContent);
				rainfall = items[i].childNodes[5].textContent;
				
				if(rainfall == '0') {
					rainfall = '0';
				} else if(rainfall > 0 && rainfall < 1.0) {
					rainfall = '1.0mm미만';
				} else if(rainfall >= 1.0 && rainfall < 30.0) {
					rainfall = '1.0~29.0mm';
				} else if(rainfall >= 30.0 && rainfall < 50.0) {
					rainfall = '30.0~50.0mm';
				} else if(rainfall >= 50.0) {
					rainfall = '50.0mm이상';
				}
				console.log(rainfall);
				
			}
			if (items[i].childNodes[2].textContent == 'PTY') {	//강수형태 [없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)]
				console.log(items[i].childNodes[2].textContent);
				console.log(items[i].childNodes[5].textContent);
				precipitation_form = items[i].childNodes[5].textContent;
				
				if(precipitation_form == '0') {
					precipitation_form = '강수는 없습니다.';
				} else if(precipitation_form == '1') {
					precipitation_form = '비가 올 예정이며';
				} else if(precipitation_form == '2') {
					precipitation_form = '비나 눈이 올 예정이며';
				} else if(precipitation_form == '3') {
					precipitation_form = '눈이 올 예정이며';
				} else if(precipitation_form == '5') {
					precipitation_form = '빗방울이 내릴 예정이며';
				} else if(precipitation_form == '6') {
					precipitation_form = '빗방울이나 눈이 날릴 예정이며';
				} else if(precipitation_form == '7') {
					precipitation_form = '눈이 날릴 예정이며';
				}
				console.log(precipitation_form);
			}
			if (items[i].childNodes[2].textContent == 'WSD') {	//풍속
				console.log(items[i].childNodes[2].textContent);
				console.log(items[i].childNodes[5].textContent);
				windspeed = items[i].childNodes[5].textContent;
				
				if(windspeed == 0) {
					windspeed = '바람이 아주 약하게 불 예정입니다.';
				} else if(windspeed > 0 && windspeed < 4) {
					windspeed = '바람이 약하게 불 예정입니다.';
				} else if(windspeed >= 4 && windspeed < 9) {
					windspeed = '바람이 약간 강하게 불 예정입니다.';
				} else if(windspeed >= 9 && windspeed < 14) {
					windspeed = '바람이 강하게 불 예정입니다.';
				} else if(windspeed >= 14) {
					windspeed = '바람이 매우 강하게 불 예정입니다.';
				}
				console.log(windspeed);
			}

		}
		
		weather_alert = function() {			
			if(precipitation_form == '강수는 없습니다.') {
				Swal.fire({
					title: "오늘의 날씨",
					html: '기온은 ' + temp + '℃ 이며 습도는 ' + humidity + '% 입니다.<br>비나 눈은 오지 않을 예정이며 <br>' + windspeed,
					imageUrl: 'image/weather.png',
					imageWidth: 300,
					imageHeight: 200,
					imageAlt: 'Custom image'
				});
			} else {
				Swal.fire({
					title: "오늘의 날씨",
					html: '기온은 ' + temp + '℃ 이며 습도는 ' + humidity + '% 입니다.<br>오늘 ' + precipitation_form + '<br>강수량은 ' + rainfall + '이 되겠습니다.\n' 
							+ '그리고 ' + windspeed,
					imageUrl: 'image/weather.png',
					imageWidth: 300,
					imageHeight: 200,
					imageAlt: 'Custom image'
				});
			}
		}
		
	}	
};
xhr.send('/');
