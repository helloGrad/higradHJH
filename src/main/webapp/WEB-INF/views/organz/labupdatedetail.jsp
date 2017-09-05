<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("space", " ");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminform.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
textarea {
	width: 300px;
	overflow: visible
}
    /* autocomplete 스크롤 관련 css*/
.ui-autocomplete {
            max-height: 100px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
    }
    /* IE 6 doesn't support max-height
     * we use height instead, but this forces the menu to always be this tall
     */
</style>


<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20 + obj.scrollHeight) + "px";
	}
</script>


<script type="text/javascript">
var index=0;
var codeList = JSON.parse('${codeList}');
</script>




</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/organz/list">기관
				목록으로 가기</a>
		</div>
		<hr class="nav-line">

		<div class="row">
			<div id="lab" class="col-lg-12">
				<h2>연구실 - 연구실이름/연구내용으로 구분</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/organz/update">
					<div class="form-group">
						<input type="hidden" id="type" name="type" value="${param.type }">
						<input type="hidden" id="orgnzNo" name="orgnzNo"
							value="${organzLabList.orgnzNo }"> 연구실 이름: <input
							type="text" class="form-control" id="orgnzNm" name="orgnzNm"
							value="${organzLabList.orgnzNm }"><br> 연구실 영문명 이름 :
						<input type="text" class="form-control" id="engOrgnzNm"
							name="engOrgnzNm" value="${organzLabList.engOrgnzNm }"> <br>
						기관구분 : <input type="text" class="form-control" id="orgnzDstnct"
							name="orgnzDstnct" value="${organzLabList.orgnzDstnct }" readonly>
						<br> 연구실 url 주소 : <input type="text" class="form-control"
							id="hmpageUrl" name="hmpageUrl"
							value="${organzLabList.hmpageUrl }"> <br> 연구실 전화번호 :
						<input type="text" class="form-control" id="telNo" name="telNo"
							value="${organzLabList.telNo }"> <br> 연구실 팩스번호 : <input
							type="text" class="form-control" id="faxNo" name="faxNo"
							value="${organzLabList.faxNo }"> <br> 주소 : <input
							type="text" class="form-control" id="addr" name="addr"
							value="${organzLabList.addr }"> <br> 세부주소 : <input
							type="text" class="form-control" id="detailAddr"
							name="detailAddr" value="${organzLabList.detailAddr }"> <br>
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1"
								name="prntsOrgnzNo" type="text" value="${organzLabList.prntsOrgnzNo }"
								readonly>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관명</label> <input
								class="form-control input-lg" id="organzinput" type="text" name="orgnzFullNm"
								value="${organzLabList.orgnzFullNm }" readonly> <input
								type="button" value="기관검색하기" onclick="openOrganzSearch('연구실업데이트')">
						</div>
						<br> 교수님 성명: <input type="text" class="form-control"
							id="mapProfNm" name="mapProfNm"
							value="${organzLabList.mapProfNm}"> <br> 연구실 소개:
						<textarea class="form-control" onkeydown="resize(this)"
							onkeyup="resize(this)" id="labIntro" name="labIntro">${organzLabList.labIntro}</textarea>
						<br> 연구원 수(박사/석박사/석사): <input type="text"
							class="form-control" id="rsrchrInfoText" name="rsrchrInfoText"
							value="${organzLabList.rsrchrInfoText}"><br>



						<c:if test="${organzLabList.hmnbrdDstnct == '국내' }">
							국내외 구분: <select name="hmnbrdDstnct">
								<option value=""> 국내외구분</option>
								<option value="국내" selected="selected">국내</option>
								<option value="국외">국외</option>
							</select>
						</c:if>
						<c:if test="${organzLabList.hmnbrdDstnct == '국외' }">
							국내외 구분: <select name="hmnbrdDstnct">
								<option value=""> 국내외구분</option>
								<option value="국내">국내</option>
								<option value="국외" selected="selected">국외</option>
							</select>
						</c:if>
						
						<br> <br>
						지역: <input type="checkbox" id="AR00001" name="cdlist" value="AR00001" />서울 &nbsp;
							<input type="checkbox" id="AR00002" name="cdlist" value="AR00002" />세종 &nbsp;
							<input type="checkbox" id="AR00003" name="cdlist" value="AR00003" />인천 &nbsp;
							<input type="checkbox" id="AR00004" name="cdlist" value="AR00004" />대전 &nbsp;
							<input type="checkbox" id="AR00005" name="cdlist" value="AR00005" />대구 &nbsp;
							<input type="checkbox" id="AR00006" name="cdlist" value="AR00006" />부산 &nbsp;
							<input type="checkbox" id="AR00007" name="cdlist" value="AR00007" />울산 &nbsp;
							<input type="checkbox" id="AR00008" name="cdlist" value="AR00008" />광주 &nbsp;
							<input type="checkbox" id="AR00009" name="cdlist" value="AR00009" />경기 &nbsp;
							<input type="checkbox" id="AR00010" name="cdlist" value="AR00010" />충북 &nbsp;
							<input type="checkbox" id="AR00011" name="cdlist" value="AR00011" />충남 &nbsp;
							<input type="checkbox" id="AR00012" name="cdlist" value="AR00012" />강원 &nbsp;
							<input type="checkbox" id="AR00013" name="cdlist" value="AR00013" />경북 &nbsp;
							<input type="checkbox" id="AR00014" name="cdlist" value="AR00014" />경남 &nbsp;
							<input type="checkbox" id="AR00015" name="cdlist" value="AR00015" />전북 &nbsp;
							<input type="checkbox" id="AR00016" name="cdlist" value="AR00016" />전남 &nbsp;
							<input type="checkbox" id="AR00017" name="cdlist" value="AR00017" />제주 &nbsp;
							<input type="checkbox" id="AR00018" name="cdlist" value="AR00018" />국외 &nbsp;
						<br> <br>
						
						학위: <input type="checkbox" id="DE00001" name="cdlist" value="DE00001" />석사 &nbsp;
							<input type="checkbox" id="DE00002" name="cdlist" value="DE00002" />박사&nbsp;
							<input type="checkbox" id="DE00003" name="cdlist" value="DE00003" />석박사통합 &nbsp;
							
						<br> <br>
						 <!-- 맞춤정보 입력란 -->
						<div class="ui-widget">
	  					<label for="tags">연구분야 : </label>
	  					<input id="tags">
	  					<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
	  					<div id="cdNmList">
	  					</div>
						</div>
						<br> <br>
						
					</div>
					<hr>
					<button type="submit" class="form-control">수정</button>
				</form>
				<hr>
			</div>
		</div>


	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
 	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/labdetail.js"></script>  
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script> 
			<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/autoCompleteSroll.js"></script>
		 

</body>
</html>