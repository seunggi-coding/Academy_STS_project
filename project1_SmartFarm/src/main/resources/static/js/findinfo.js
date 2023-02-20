let index = {
    init: function () {
        $("#btn-update").on("click", () => {
            this.check();
        });
    },
    check: function () {
        let p1 = $("#password").val();
        let p2 = $("#password1").val();

        if (p1 != p2) {
            alert("비밀번호가 일치하지 않습니다")
            return false;
        } else {
            this.update();
            return true;
        }
        },

    update: function () {
        let data = {
            id: $("#id").val(),
            userid : $("#userid").val(),
            password: $("#password").val(),
            username: $("#username").val(),
            email : $("#email").val(),
            phonenumber: $("#phonenumber").val(),
        };

        $.ajax({
            type: "PUT",
            url: "/user",
            data: JSON.stringify(data), //http body 데이터
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            alert("비밀번호 재설정이 완료되었습니다.");
            location.href = "/";
            //응답이 정상
        }).fail(function (error) {
            alert("비밀번호 재설정 실패");
        });
    }


}
//     init: function () {
//         $("#btn-search").on("click", () => {
//             this.idSearch();
//         });
//     },
//     idSearch: function () {
//         let data = {
//             email: $("#email").val(),
//             username: $("#username").val()
//         };
//         console.log(data.email);
//         console.log(data.username);
//         if(data.email == '') {
//             alert("이메일을 입력해주세요!")
//         }
//         if(data.username == '') {
//             alert("이름을 입력해주세요!")
//         }
//         $.ajax({
//             type: "POST",
//             url: "/findIdResult",
//             data: JSON.stringify(data), //http body 데이터
//             contentType: "application/json; charset=utf-8",
//             dataType: "json"
//         }).done(function (resp) {
//             location.href = "/findIdResult"
//             //응답이 정상
//         }).fail(function (error) {
//             alert("!!!");
//
//             //응답이 비정상
//         });
//         console.log();
//     }
// }
index.init();