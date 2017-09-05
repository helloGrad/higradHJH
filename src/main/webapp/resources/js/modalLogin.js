/**
 * 
 */

var emptyPasswdMsg = "비밀번호를 입력해주세요";
var emptyEmailMsg = "이메일을 입력해주세요";
var regEmailMsg = "이메일 형식이 아닙니다";
var loginFailMsg = "로그인 정보가 틀립니다";
var emailRegExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;


$(function(){
	$("#login-form").submit(function(){
		
		
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		
		if(pwd===''){
			$("#passwdMsg").text(emptyPasswdMsg);
			$("#pwd").focus();
			event.preventDefault();
		}
		if(email===''){
			$("#emailMsg").text(emptyEmailMsg);
			$("#email").focus();
			event.preventDefault();
		}
		
		if(email!=''&&!email.match(emailRegExp)){
			$("#emailMsg").text(regEmailMsg);
			$("#email").focus();
			event.preventDefault();
		}
		
		$.ajax({
			url : "/admin/user/api/checklogin",
			type : "post",
			data : "iden=" + email + "&pw=" + pwd,
			
			success : function(response) {
				
				console.log(typeof(response.data), response.data)
				
				if(response.data===true){
					$("#loginMsg").text('로그인 성공');
					$.ajax({
						url : "/admin/user/api/setsession",
						type : "post",
						data : "iden=" + email + "&pw=" + pwd,
						
						success : function(response) {
							parent.window.location.href = "/admin/";
							console.log("세션성공")
						},
						error : function(jqXHR, status, e) {
							console.log(jqXHR);
							console.error(status);
							console.error(e);
						}

					});
					event.preventDefault();
				}else if(response.data===false){
					$("#loginMsg").text(loginFailMsg);
					event.preventDefault();
				}
				
				
			},
			
			error : function(jqXHR, status, e) {
				console.log(jqXHR);
				console.error(status);
				console.error(e);
			}
			

		});
		event.preventDefault();
		
		
	});
	
	$("#email").on('keypress',function(){
		$("#emailMsg").empty();
	})
	$("#pwd").on('keypress',function(){
		$("#pwdMsg").empty();
	})
	
	
})


