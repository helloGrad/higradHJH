
// 네이버 아이디 로그인 설정
var naver_id_login = new naver_id_login("4XJQVjfPiPo3e5Xe23hL",
		"http://127.0.0.1:8080/net/user/snslogin/");
naver_id_login.setDomain(".127.0.0.1:8080/net/");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 3, 40);
naver_id_login.setDomain("YOUR_SERVICE_URL");
naver_id_login.setState(state);
naver_id_login.init_naver_id_login();

//페이스북 api 설정
window.fbAsyncInit = function() {
	FB.init({
		appId : '824595201040077',
		autoLogAppEvents : true,
		xfbml : true,
		version : 'v2.10'
	});
	FB.AppEvents.logPageView();
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// 페이스북 로그인 정보 가져오기
function getUserData(access_token) {
	FB.api('/me', {
		fields : 'name,email,gender,birthday'
	}, function(data) {
		// console.log(JSON.stringify(data));
		// document.getElementById('status').innerHTML = "<br> 이름 : "
		// + data.name
		// + "<br> 이메일 : "
		// + data.email
		// + "<br> 성별 : "
		// + data.gender
		// + "<br> 생년월일 : "
		// + data.birthday
		// + "<br> 아이디 : "
		// + data.id
		// + "<br> 토큰값 : "
		// + access_token;

		$.ajax({
			url : "/net/user/snslogin",
			type : "post",
			data : "name=" + data.name + "&email=" + data.email + "&gender="
					+ data.gender + "&birthday=" + data.birthday + "&token="
					+ data.id + "&sns=fb",
			// $.ajax({
			// url : "/net/user/snslogin",
			// type : "post",
			// data : data+"&sns=fb",
			success : function(response) {
				parent.window.location.href = "/net/orgnz";
				console.log("success");
				if (response.result === "fail") {
					console.error("dddd" + response.message);
					return;
				}
			},
			error : function(jqXHR, status, e) {
				console.log(jqXHR);
				console.error(status);
				console.error(e);
			}

		});
	});
}

// 페이스북 로그인 버튼 클릭 시 토큰을 이용한 사용자 정보 가져와서 통신

document.getElementById('facebookLogin').addEventListener('click', function() {
	// do the login
	FB.login(function(response) {
		if (response.authResponse) {
			access_token = response.authResponse.accessToken; // get access
			// token
			user_id = response.authResponse.userID; // get FB UID
			console.log('access_token = ' + access_token);
			console.log('user_id = ' + user_id);
			getUserData(access_token);
		}
	}, {
		scope : 'email,public_profile,user_birthday',
		return_scopes : true
	});

}, false);


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
