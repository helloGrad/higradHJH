
// 회원가입 폼 유효성 검사

$("#join-form")
		.submit(
				function() {

					empty();
					var inputName = $("#nickname").val();
					if (inputName === "") {
						$("#nickname-check p").text("닉네임은 필수 입력 항목입니다.");
						$("#nickname").focus;
						return false;
					} else if (inputName.length <= 1) {
						$("#nickname-check p").text("닉네임은 2~8자 입니다.");
						$("#nickname").focus();
						return false;
					}

					var inputEmail = $("#remail").val();
					var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
					if (inputEmail === "") {
						$("#email-check p").text("이메일은 필수 입력 항목입니다.");
						$("#remail").focus();
						return false;
					} else if (!regEmail.test(inputEmail)) {
						$("#email-check p").text("@를 포함한 올바른 이메일 형식으로 입력바랍니다.");
						$("#remail").focus();
						return false;
					}

					var inputPwd = $("#rpwd").val();
					console.log(inputPwd);
					if (inputPwd === "") {
						$("#pwd-check p").text("비밀번호는 필수 입력 항목입니다.");
						$("#rpwd").focus();
						return false;
					}

					var $inputCheck = $("#agree-prov");
					if ($inputCheck.is(":checked") === false) {
						$("#agree-prov p").text("약관에 동의하여 주십시오.");
						return false;
					}
					return true;
				});

var empty = function() {
	$("#nickname-check p").empty();
	$("#email-check p").empty();
	$("#pwd-check p").empty();
}

// 이메일 부분이 바뀌면 중복체크 버튼이 보이도록 설정
$("#remail").change(function() {
	var $imageCheck = $("#check-image");
	var $checkButton = $("#check-button");
	$imageCheck.hide();
	$checkButton.show();
});

// 이메일 중복 검사
$("#check-button").click(function() {

	$.ajax({
		url : "/net/api/checkemail?email=" + $("#remail").val(),
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			console.log(response);
			if (response.data == true) {
				alert("이미 존재하는 이메일 입니다. 다른 이메일을 사용해주세요.");
				console.log("이메일 중복");

			} else {
				var $imageCheck = $("#check-image");
				var $checkButton = $("#check-button");
				$imageCheck.show();
				$checkButton.hide();
			}
		},
		error : function(jqXHR, status, error) {
			console.error(status + " : " + error);
		}
	});

});
