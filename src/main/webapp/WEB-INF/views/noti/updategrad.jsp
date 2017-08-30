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

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<!-- ///// filter (대분류) //////-->
		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/noti/list">모집공고
				목록으로 가기</a>
		</div>

		<hr class="nav-line">

		<div class="row">
			<div id="notigrad" class="col-lg-12">
				<h2>모집공고 대학원</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/noti/update">
					<input type="hidden" name="tabnm" value="grad"> <input
						type="hidden" name="slctnNotiNo" value="${vo.slctnNotiNo }">
					<input type="hidden" name="adminNo" value="${authUser.mbNo }">
					<!--////////////////////// 제목 //////////////////////-->

					<!--/////////////////////////// main content ///////////////////////////////////// -->

					<div class=col-lg-8>
						<div class="form-group">
							<label for="inputlg"> ▣ 제목</label> <input
								class="form-control input-lg" id="slctnTitle" name="slctnTitle"
								type="text" value="${vo.slctnTitle }">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1" name="orgnzNo"
								type="text" value="${vo.orgnzNo }" readonly>
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관명</label> <input
								class="form-control input-lg" id="organzinput" type="text"
								value="${vo.orgnzFullNm }" readonly>
							<input type="button" value="기관검색하기"
								onclick="openOrganzSearch('대학원')">
						</div>

						<div class="form-group">
							<label> ▣ 모집내용 </label>
							<textarea class="form-control" rows="2" id="slctnText"
								name="slctnText">${vo.slctnText }</textarea>
						</div>
						<!--////////////////////// 모집공고URL //////////////////////-->
						<div class="form-group">
							<label for="inputlg"> ▣ 대학원 모집 url</label> <input
								class="form-control input-lg" id="slctnNotiUrl"
								name="slctnNotiUrl" type="text" " value="${vo.slctnNotiUrl }">
						</div>
						<div class="row">
							<!--////////////////////// 모집시작일 //////////////////////-->
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 접수기간(시작) </label> <input
									class="form-control input-lg" id="slctnBeginDt"
									name="slctnBeginDt" type="text" value="${vo.slctnBeginDt }">
							</div>
							<!--////////////////////// 모집종료일 //////////////////////-->
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 접수기간(종료) </label> <input
									class="form-control input-lg" id="slctnEndDt" name="slctnEndDt"
									type="text" value="${vo.slctnEndDt }">
							</div>
						</div>

						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 지원자격</label>
							<textarea class="form-control" rows="4" id="suprtQualf"
								name="suprtQualf">${vo.suprtQualf }</textarea>
						</div>
						</p>

						<hr>

						<div class="form-group">
							<label for=""> ▣ 전형방법</label>
							<textarea class="form-control" rows="3" id="slsnMth"
								name="slsnMth">${vo.slsnMth }</textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 제출서류</label>
							<textarea class="form-control" rows="2" id="sbmtDocText"
								name="sbmtDocText">${vo.sbmtDocText }</textarea>
						</div>

						<hr>

						<div class="form-group">
							<label> ▣ 원서접수 </label>
							<!--////////////////////// 접수방법 //////////////////////-->
							<textarea class="form-control" rows="2" id="rcpMth" name="rcpMth">${vo.rcpMth }</textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 전형일 </label> <br>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">시작일</label> <input class="form-control"
										id="slsnBeginDd" name="slsnBeginDd" type="text"
										value="${vo.slsnBeginDd }">
								</div>

								<div class="col-xs-3">
									<label for="ex2">종료일</label> <input class="form-control"
										id="slsnEndDd" name="slsnEndDd" type="text"
										value="${vo.slsnEndDd }">
								</div>
							</div>

							<Br>
							<textarea class="form-control" rows="2" id="slsnPlac"
								name="slsnPlac">${vo.slsnPlac }</textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 합격자 발표 </label>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">발표일</label> <input class="form-control"
										id="sccnAncmDd" name="sccnAncmDd" type="text"
										value="${vo.sccnAncmDd }">
								</div>
							</div>

							<br>

							<textarea class="form-control" rows="2" id="sccnAncmMth"
								name="sccnAncmMth">${vo.sccnAncmMth }</textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 등록기간 </label>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">시작일</label> <input class="form-control"
										id="regstBeginDd" name="regstBeginDd" type="text"
										value="${vo.regstBeginDd }">
								</div>

								<div class="col-xs-3">
									<label for="ex2">종료일</label> <input class="form-control"
										id="regstEndDd" name="regstEndDd" type="text"
										value="${vo.regstEndDd }">
								</div>
							</div>

							<br>

							<textarea class="form-control" rows="2" id="regstMth"
								name="regstMth">${vo.regstMth }</textarea>
						</div>
						<hr>
					</div>
					<!--/////////////////////////// side floating menu//////////////////////////////// -->
					<div class="col-lg-4">
						<p class="lead">추가 정보</p>
						<div class="form-group">
							<label for="inputlg"> ▣ 모집인원 </label> <input
								class="form-control input-sm" id="slctnNops" name="slctnNops"
								type="text" value="${vo.slctnNops }">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 담당자 </label> <input
								class="form-control input-sm" id="chrgrNm" name="chrgrNm"
								type="text" value="${vo.chrgrNm }">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 전화번호 </label> <input
								class="form-control input-sm" id="chrgrTelNo" name="chrgrTelNo"
								type="text" value="${vo.chrgrTelNo }">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ email </label> <input
								class="form-control input-sm" id="chrgrEmail" name="chrgrEmail"
								type="text" value="${vo.chrgrEmail }">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 첨부파일 </label> <input
								class="form-control input-sm" id="" name="" type="text">
						</div>
						<button type="submit" class="btn btn-primary web-volunteer">모집공고
							수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
</body>
</html>