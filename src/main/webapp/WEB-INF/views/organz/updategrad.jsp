<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminform.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<c:if test="${vo.orgnzDstnct=='학과' }">
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad2.js"></script>
</c:if>



<script type="text/javascript">
	$(function() {
		$("#hmnbrdDstnct").val("${vo.hmnbrdDstnct}").attr("selected",
				"selected");
		$("#orgnzDstnct").val("${vo.orgnzDstnct}").attr("selected", "selected");

		$("textarea.autosize").on('keydown keyup', function() {
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
		});
	})
</script>




<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20 + obj.scrollHeight) + "px";
	}
</script>


<script type="text/javascript">
	
	
	//박가혜 2017-08-30
	$(function() {

		var codeList = JSON.parse('${codeList}');
		codeList1 = JSON.parse('${codeList1}'); 
		codeList2 = JSON.parse('${codeList2}'); 
		var type2 = $("#type").val();

		//하나를 선택하면 지워지고 다시 선택되어지게 수정!!!!!!!!!!

		if (type2 === '학과') {

			$("#cdNmList")
			.append(
					"<div id='"
							+ codeList1[0].cdId
							+ "'><span id='cdNm' name='cdNm' val='"
							+ codeList1[0].cdNm
							+ "'>"
							+ codeList1[0].cdNm
							+ "</span>"
							+ "<button id='deleteBtn' type='button' onclick='clickDelete(\""
							+ codeList1[0].cdId
							+ "\");' class='btn'>X</button>"
							+ "<input type='hidden' name='codes[" + 0
							+ "].cdId' value='" + codeList1[0].cdId + "'>"
							+ "<input type='hidden' name='codes[" + 0
							+ "].cdNm' value='" + codeList1[0].cdNm + "'>"
							+ "</div>")
				index++;
				checkList.push(codeList1[0].cdNm);
				
			for (var i = 0; i < codeList2.length; i++) {
				$("#cdNmList2")
						.append(
								"<div id='"
										+ codeList2[i].cdId
										+ "'><span id='cdNm' name='cdNm' val='"
										+ codeList2[i].cdNm
										+ "'>"
										+ codeList2[i].cdNm
										+ "</span>"
										+ "<button id='deleteBtn' type='button' onclick='clickDelete(\""
										+ codeList2[i].cdId
										+ "\");' class='btn'>X</button>"
										+ "<input type='hidden' name='codes2["
										+ index2 + "].cdId' value='"
										+ codeList2[i].cdId + "'>"
										+ "<input type='hidden' name='codes2["
										+ index2 + "].cdNm' value='"
										+ codeList2[i].cdNm + "'>"
										+ "</div>")
				checkList.push(codeList2[i].cdNm);
				index2++;
			}

		} else {
			$('input:checkbox[name="cdlist"]').each(function() {
				console.log(codeList.length);

				for (var i = 0; i < codeList.length; i++) {
					if (codeList[i].cdId == this.value) {
						console.log(codeList[i].cdId);
						this.checked = true; //checked 처리
					}
				}
			});
		}

	});
</script>

<style>
textarea.autosize {
	min-height: 50px;
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
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<!-- ///// filter (대분류) //////-->
		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/organz/list">기관
				목록으로 가기</a>
		</div>
		<div class="row">
			<c:forEach items="${fileList }" var="list" varStatus="status">
				<a id="down"
					href="${pageContext.servletContext.contextPath }/download?no=${list.apndngFileNo}">${list.apndngFileNm }</a>
			</c:forEach>
		</div>

		<hr class="nav-line">

		<div class="row">


			<form class="updateform" id="updateform" name="updateform"
				method="post"
				action="${pageContext.servletContext.contextPath }/organz/update">
				<input type="hidden" id="type" name="type"
					value="${vo.orgnzDstnct }"> <input type="hidden"
					id="orgnzNo" name="orgnzNo" value="${vo.orgnzNo }">

				<div class="form-group">

					<label>기관구분:</label> <select id="hmnbrdDstnct" name="hmnbrdDstnct">
						<option value="국내">국내</option>
						<option value="국외">국외</option>
					</select> <input type="text" class="form-control" id="orgnzDstnct"
						name="orgnzDstnct" value="${vo.orgnzDstnct }" readonly> <br>

					<c:if test="${vo.orgnzDstnct == '대학원' }">
						<br>
						<label>대학원구분:</label>
						<select id="grschDstnct" name="grschDstnct">
							<c:if test="${vo.grschDstnct=='일반대학원' }">
								<option value="일반대학원" selected="selected">일반대학원</option>
								<option value="전문대학원">전문대학원</option>
								<option value="특수대학원">특수대학원</option>
							</c:if>
							<c:if test="${vo.grschDstnct=='전문대학원' }">
								<option value="일반대학원">일반대학원</option>
								<option value="전문대학원" selected="selected">전문대학원</option>
								<option value="특수대학원">특수대학원</option>
							</c:if>
							<c:if test="${vo.grschDstnct=='특수대학원' }">
								<option value="일반대학원">일반대학원</option>
								<option value="전문대학원">전문대학원</option>
								<option value="특수대학원" selected="selected">특수대학원</option>
							</c:if>

						</select>
					</c:if>



					<br> <label>기관명:</label> <input type="text"
						class="form-control" id="orgnzNm" name="orgnzNm"
						value="${vo.orgnzNm }"> <label>기관영문명:</label> <input
						type="text" class="form-control" id="engOrgnzNm" name="engOrgnzNm"
						value="${vo.engOrgnzNm }"> <label>홈페이지주소:</label> <input
						type="text" class="form-control" id="hmpageUrl" name="hmpageUrl"
						value="${vo.hmpageUrl }"> <label>전화번호:</label> <input
						type="text" class="form-control" id="telNo" name="telNo"
						value="${vo.telNo }"> <label>팩스번호:</label> <input
						type="text" class="form-control" id="faxNo" name="faxNo"
						value="${vo.faxNo }"> <label>주소:</label> <input
						type="text" class="form-control" id="addr" name="addr"
						value="${vo.addr }"> <label>상세주소:</label> <input
						type="text" class="form-control" id="detailAddr" name="detailAddr"
						value="${vo.detailAddr }">

					<div class="form-group">
						<label for="inputlg"> ▣ 부모번호</label> <input
							class="form-control input-lg" id="orgnzNo1" name="prntsOrgnzStr"
							type="text" value="${vo.prntsOrgnzNo }" readonly>
					</div>

					<c:choose>
						<c:when test="${vo.orgnzDstnct=='대학원' }">
							<div class="form-group">
								<label for="inputlg"> ▣ 부모기관명</label> <input
									class="form-control input-lg" id="organzinput"
									name="orgnzFullNm" type="text" value="${vo.orgnzFullNm }"
									readonly> <input type="button" value="기관검색하기"
									onclick="openOrganzSearch('대학교')">
							</div>

							<br>
							<br>
						지역: <input type="checkbox" id="AR00001" name="cdlist"
								value="AR00001" />서울 &nbsp;
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
						<br>
							<br>
						
						학위: <input type="checkbox" id="DE00001" name="cdlist"
								value="DE00001" />석사 &nbsp;
							<input type="checkbox" id="DE00002" name="cdlist" value="DE00002" />박사&nbsp;
							<input type="checkbox" id="DE00003" name="cdlist" value="DE00003" />석박사통합 &nbsp;
						</c:when>
						<c:when test="${vo.orgnzDstnct=='학과' }">
							<div class="form-group">
								<label for="inputlg"> ▣ 부모기관명</label> <input
									class="form-control input-lg" id="organzinput"
									name="orgnzFullNm" type="text" value="${vo.orgnzFullNm }"
									readonly> <input type="button" value="기관검색하기"
									onclick="openOrganzSearch('대학원')">
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>

					<c:if test="${vo.orgnzDstnct == '학과' }">
						<br>
						<!-- 맞춤정보 입력란 -->
						<div class="ui-widget">
							<label for="tags">학과/학부 코드 : </label> <input id="tags">
							<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
							<div id="cdNmList"></div>
						</div>
						<div class="ui-widget">
							<label for="tags2">전공코드 : </label> <input id="tags2">
							<div id="duplicateMsg2" style="display: none">중복입니다 !!</div>
							<div id="cdNmList2"></div>
						</div>
						<div class="checkbox">
							<c:choose>
								<c:when test="${vo.aboltYn=='Y' }">
									<label class="btn-lg btn-default btn-block"> <input
										name="aboltYn" type="checkbox" checked="checked" value="Y">폐지여부
									</label>
								</c:when>
								<c:otherwise>
									<label class="btn-lg btn-default btn-block"> <input
										name="aboltYn" type="checkbox" value="Y">폐지여부
									</label>
								</c:otherwise>
							</c:choose>

						</div>
						<br>
					</c:if>


				</div>

				<button type="submit" class="btn btn-primary btn-lg">수정</button>
			</form>

		</div>

	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
			<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/autoCompleteSroll.js"></script>



</body>
</html>