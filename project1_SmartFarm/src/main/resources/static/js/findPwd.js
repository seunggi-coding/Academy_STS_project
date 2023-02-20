let index = {

    init: function () {
        $("#btn-search").on("click", () => {
            this.idSearch();
        });
    },
    idSearch: function () {
        let data = {
            email: $("#email").val(),
            username: $("#username").val()
        };
        console.log(data.email);
        console.log(data.username);
        if(data.email == '') {
            alert("이메일을 입력해주세요!")
        }
        if(data.username == '') {
            alert("이름을 입력해주세요!")
        }
        $.ajax({
            type: "POST",
            url: "/findIdResult",
            data: JSON.stringify(data), //http body 데이터
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            location.href = "/findIdResult"
            //응답이 정상
        }).fail(function (error) {
            alert("!!!");

            //응답이 비정상
        });
        console.log();
    }
}
index.init();