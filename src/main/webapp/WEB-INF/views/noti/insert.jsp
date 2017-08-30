<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<div class="col-lg-4 centering">
				<button class="tablinks"
					onclick="openTab(event, 'notigrad','admin')" id="defaultOpen">모집공고
					대학원</button>
				<button class="tablinks" onclick="openTab(event, 'notilab','admin')"
					id="defaultOpen">모집공고 연구실</button>
			</div>
		</div>

		<hr class="nav-line">

		<div class="row">
			<div id="notigrad" class="col-lg-12">
				<h2>모집공고 대학원</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/noti/insert">
					<input type="hidden" name="tabnm" value="grad">
					<!--////////////////////// 제목 //////////////////////-->

					<!--/////////////////////////// main content ///////////////////////////////////// -->

					<div class=col-lg-8>
						<div class="form-group">
							<label for="inputlg"> ▣ 제목</label> <input
								class="form-control input-lg" id="slctnTitle" name="slctnTitle"
								type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1" name="orgnzNo"
								type="text" readonly>
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관명</label> <input
								class="form-control input-lg" id="organzinput" type="text" readonly>
							<input type="button" value="기관검색하기"
								onclick="openOrganzSearch('대학원')" >
						</div>

						<div class="form-group">
							<label> ▣ 모집내용 </label>
							<textarea class="form-control" rows="2" id="slctnText"
								name="slctnText" placeholder="원서접수 유의사항"></textarea>
						</div>
						<!--////////////////////// 모집공고URL //////////////////////-->
						<div class="form-group">
							<label for="inputlg"> ▣ 대학원 모집 url</label> <input
								class="form-control input-lg" id="slctnNotiUrl"
								name="slctnNotiUrl" type="text"">
						</div>
						<div class="row">
							<!--////////////////////// 모집시작일 //////////////////////-->
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 접수기간(시작) </label> <input
									class="form-control input-lg" id="slctnBeginDt"
									name="slctnBeginDt" type="text">
							</div>
							<!--////////////////////// 모집종료일 //////////////////////-->
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 접수기간(종료) </label> <input
									class="form-control input-lg" id="slctnEndDt" name="slctnEndDt"
									type="text">
							</div>
						</div>

						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 지원자격</label>
							<textarea class="form-control" rows="4" id="suprtQualf"
								name="suprtQualf"></textarea>
						</div>
						</p>

						<hr>

						<div class="form-group">
							<label for=""> ▣ 전형방법</label>
							<textarea class="form-control" rows="3" id="slsnMth"
								name="slsnMth" placeholder="서류 및 면접"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 제출서류</label>
							<textarea class="form-control" rows="2" id="sbmtDocText"
								name="sbmtDocText" placeholder="원서접수 유의사항"></textarea>
						</div>

						<hr>

						<div class="form-group">
							<label> ▣ 원서접수 </label>
							<!--////////////////////// 접수방법 //////////////////////-->
							<textarea class="form-control" rows="2" id="rcpMth" name="rcpMth"
								placeholder="접수방법"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 전형일 </label> <br>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">시작일</label> <input class="form-control"
										id="slsnBeginDd" name="slsnBeginDd" type="text"
										placeholder="2017/08/01">
								</div>

								<div class="col-xs-3">
									<label for="ex2">종료일</label> <input class="form-control"
										id="slsnEndDd" name="slsnEndDd" type="text"
										placeholder="2017/08/01">
								</div>
							</div>

							<Br>
							<textarea class="form-control" rows="2" id="slsnPlac"
								name="slsnPlac" placeholder="본 대학원 원우회실 (웨스트민스터홀 653호)"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 합격자 발표 </label>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">발표일</label> <input class="form-control"
										id="sccnAncmDd" name="sccnAncmDd" type="text"
										placeholder="2017/08/01">
								</div>
							</div>

							<br>

							<textarea class="form-control" rows="2" id="sccnAncmMth"
								name="sccnAncmMth" placeholder="한양대학교 입학처 홈페이지에서 발표"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 등록기간 </label>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">시작일</label> <input class="form-control"
										id="regstBeginDd" name="regstBeginDd" type="text"
										placeholder="2017/08/01">
								</div>

								<div class="col-xs-3">
									<label for="ex2">종료일</label> <input class="form-control"
										id="regstEndDd" name="regstEndDd" type="text"
										placeholder="2017/08/01">
								</div>
							</div>

							<br>

							<textarea class="form-control" rows="2" id="regstMth"
								name="regstMth" placeholder="한양대학교 지정은행에 등록금 차액 납부"></textarea>
						</div>
						<hr>
					</div>
					<!--/////////////////////////// side floating menu//////////////////////////////// -->
					<div class="col-lg-4">
						<p class="lead">추가 정보</p>
						<div class="form-group">
							<label for="inputlg"> ▣ 모집인원 </label> <input
								class="form-control input-sm" id="slctnNops" name="slctnNops"
								type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 담당자 </label> <input
								class="form-control input-sm" id="chrgrNm" name="chrgrNm"
								type="text">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 전화번호 </label> <input
								class="form-control input-sm" id="chrgrTelNo" name="chrgrTelNo"
								type="text">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ email </label> <input
								class="form-control input-sm" id="chrgrEmail" name="chrgrEmail"
								type="text">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 첨부파일 </label> <input
								class="form-control input-sm" id="" name="" type="text">
						</div>
						<button type="submit" class="btn btn-primary web-volunteer">모집공고
							등록</button>
					</div>
				</form>
			</div>
		</div>


		<div class="row">
			<div id="notilab" class="col-lg-12">
				<h2>모집공고 연구실</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/noti/insert">
					<input type="hidden" name="tabnm" value="lab">
					<!--/////////////////////////// main content ///////////////////////////////////// -->
					<div class=col-lg-8>
						<div class="form-group">
							<label for="inputlg"> ▣ 제목</label> <input
								class="form-control input-lg" id="slctnTitle" name="slctnTitle"
								type="text" placeholder="예) 하이브레인넷 연구실 모집">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 기관번호</label> <input
								class="form-control input-lg" id="orgnzlabNo" name="orgnzNo"
								type="text" readonly>
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관명</label> <input
								class="form-control input-lg" id="organzinputlab" type="text" readonly>
							<input type="button" value="기관검색하기"
								onclick="openOrganzSearch('연구실')">
						</div>
						<div class="row">
							<!--////////////////////// 모집시작일 //////////////////////-->
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 모집기간(시작) </label> <input
									class="form-control input-lg" id="slctnBeginDt"
									name="slctnBeginDt" type="text" placeholder="예) 2017/08/01">
							</div>
							<!--////////////////////// 모집종료일 //////////////////////-->
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 모집기간(종료) </label> <input
									class="form-control input-lg" id="slctnEndDt" name="slctnEndDt"
									type="text" placeholder="예) 2017/09/01">
							</div>
						</div>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 연구실 소개</label>
							<!--////////////////////// 주요 연구 분야 //////////////////////-->
							<textarea class="form-control" rows="4" id="" name="slctnText"
								placeholder=" 예) 1. MZnSnO 기반 박막트랜지스터 제작, 전기적 및 광학적 특성 분석, 소자 특성 연구
                              2. SrVO3 및 CaVO3 등의 신개념 전이금속 산화물 투명 전극 제작 및 응용연구
                              3. 플라즈마-표면 상호작용 및 플라즈마 반도체 공정에의 응용 연구"></textarea>
						</div>
						</p>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 주요 연구 분야</label>
							<!--////////////////////// 주요 연구 분야 //////////////////////-->
							<textarea class="form-control" rows="4" id=""
								name="prmryResrchField"
								placeholder=" 예) 1. MZnSnO 기반 박막트랜지스터 제작, 전기적 및 광학적 특성 분석, 소자 특성 연구
                              2. SrVO3 및 CaVO3 등의 신개념 전이금속 산화물 투명 전극 제작 및 응용연구
                              3. 플라즈마-표면 상호작용 및 플라즈마 반도체 공정에의 응용 연구"></textarea>
						</div>
						</p>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for=""> ▣ 모집대상</label>
							<!--////////////////////// 모집대 //////////////////////-->
							<textarea class="form-control" rows="3" id="slctnNops"
								name="slctnNops" placeholder="예) 석사과정, 박사과정, 석박사통합과정"></textarea>
						</div>
						</p>
						<hr>
						<div class="form-group">
							<div class="form-group">
								<label> ▣ 지원자격 </label>
								<!--////////////////////// 지원자격 //////////////////////-->
								<textarea class="form-control" rows="2" id="suprtQualf"
									name="suprtQualf"
									placeholder="물리학, 화학, 재료공학, 전자공학 등 관련 이공계열 학과에서 학/석사를 취득하거나 졸업 예정인 사람으로 반도체물리학 및 반도체소자에 관심과 흥미가 있는 자"></textarea>
							</div>
						</div>
						<hr>

						<p class="contents">
						<div class="form-group">
							<label for="">▣ 전형방법</label>
							<!--////////////////////// 주요 연구 분야 //////////////////////-->
							<textarea class="form-control" rows="4" id="slsnMth"
								name="slsnMth"></textarea>
						</div>
						</p>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 제출서류</label>
							<!--////////////////////// 주요 연구 분야 //////////////////////-->
							<textarea class="form-control" rows="4" id="sbmtDocText"
								name="sbmtDocText"></textarea>
						</div>
						</p>
						<div class="form-group">
							<div class="form-group">
								<label> ▣ 전공분야 </label>
								<textarea class="form-control" rows="2" id="" name=""
									placeholder="물리학, 화학, 재료공학, 전자공학"></textarea>
							</div>
						</div>
						<hr>
						<p class="lead">
							<span class="location"> 담당자 정보 등록 </span>
						</p>
						<div class="form-group">
							<label for="inputlg"> ▣ 담당자 </label>
							<!--////////////////////// 담당자명 //////////////////////-->
							<input class="form-control input-lg" id="chrgrNm" name="chrgrNm"
								type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 전화번호 </label>
							<!--////////////////////// 담당자 전화번호 //////////////////////-->
							<input class="form-control input-lg" id="chrgrTelNo"
								name="chrgrTelNo" type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ fax </label>
							<!--////////////////////// fax //////////////////////-->
							<input class="form-control input-lg" id="" name="" type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ email </label>
							<!--////////////////////// 지원자격 //////////////////////-->
							<input class="form-control input-lg" id="chrgrEmail"
								name="chrgrEmail" type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 첨부파일 </label>
							<!--////////////////////// 담당자 이메일 //////////////////////-->
							<input class="form-control input-lg" id="" name="" type="text">
						</div>
					</div>
					<!--/////////////////////////// side floating menu//////////////////////////////// -->
					<div class="col-lg-4">
						<div class="well">
							<p class="lead">지원 정보</p>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="bk21EorgnzSuprtYn" type="checkbox" value="Y">bk21
									지원
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="tuitionSuprtYn" type="checkbox" value="Y">등록금 지원
									여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="lvncSuprtYn" type="checkbox" value="Y">생활비 지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="incetSuprtYn" type="checkbox" value="Y">인센티브 지원
									여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="dormSuprtYn" type="checkbox" value="Y">기숙사 지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="internYn" type="checkbox" value="Y">인턴 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="lrstyJoingYn" type="checkbox" value="Y">학회 참가 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="lrstyJoingfeeSuprtYn" type="checkbox" value="Y">학회
									참가비 지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="resrchTaskJoingYn" type="checkbox" value="Y">연구
									과제 참가 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="stdtrOpptySuprtYn" type="checkbox" value="Y">연수기회
									지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="eduPgmJoingSuprtYn" type="checkbox" value="Y">교육프로그램지원
									여부
								</label>
							</div>
							<div class="form-group">
								<label for="inputlg"> ▣ 기타 지원 내역 </label>
								<!--////////////////////// bk21 여부 //////////////////////-->


								<input class="form-control input-lg" id="suprtFvrText"
									name="suprtFvrText" type="text">
							</div>


							<p class="lead">온라인 지원</p>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									type="checkbox" name="onlineSuprtYn" value="Y">온라인 지원
									신청
								</label>
							</div>

							<button type="submit" class="btn btn-primary web-volunteer">모집공고
								등록</button>
				</form>
			</div>
		</div>

	</div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/notijs/notiinsert.js"></script>
</body>
</html>