<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.flexbox.min.js"></script>
<style type="text/css">
#organzinfo {
	visibility: hidden;
	
	
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
    * html .ui-autocomplete {
        heigh
</style>
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

			<form class="updateform" id="updateform" name="updateform"
				method="post" enctype="multipart/form-data"
				action="${pageContext.servletContext.contextPath }/organz/insert">

				<div class="form-group">
				<input type="hidden" id="type" name="type" value="${param.type }">
					<label>기관구분:</label> <select id="hmnbrdDstnct" name="hmnbrdDstnct">
						<option value="국내">국내</option>
						<option value="국외">국외</option>
					</select> <select id="orgnzDstnct" name="orgnzDstnct"
						onchange="changFrom(this.value)">
						<option value="대학교">대학교</option>
						<option value="대학원">대학원</option>
						<option value="학과">학과</option>
					</select> 
					<c:if test="${param.type=='대학원'}">
						<br>
						<label>대학원구분:</label>
						<select id="grschDstnct" name="grschDstnct">
							<option value="일반대학원">일반대학원</option>
							<option value="전문대학원">전문대학원</option>
							<option value="특수대학원">특수대학원</option>
						</select> 
					</c:if>
					<br> <br> <label>기관명:</label> <input type="text"
						class="form-control" id="orgnzNm" name="orgnzNm"> <label>기관영문명:</label>
					<input type="text" class="form-control" id="engOrgnzNm"
						name="engOrgnzNm"> <label>홈페이지주소:</label> <input
						type="text" class="form-control" id="hmpageUrl" name="hmpageUrl">
					<label>전화번호:</label> <input type="text" class="form-control"
						id="telNo" name="telNo"> <label>팩스번호:</label> <input
						type="text" class="form-control" id="faxNo" name="faxNo">
					<label>주소:</label> <input type="text" class="form-control"
						id="addr" name="addr"> <label>상세주소:</label> <input
						type="text" class="form-control" id="detailAddr" name="detailAddr">
					<div id="organzinfo">
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1" name="prntsOrgnzStr"
								type="text" readonly>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관명</label> <input
								class="form-control input-lg" id="organzinput"
								name="orgnzFullNm" type="text" readonly>
							<div id="search"></div>
						</div>
					</div>

					<!--  <button type="button" onclick="addFile()">파일 추가</button>-->
					<table id="filetable" cellpadding="5" cellspacing="0">
						<tr name="tr_attach_file">
							<th>첨부파일</th>
							<td><input id="file" type="file" name="attachFile" multiple /></td>
						</tr>

						<!-- 추가 버튼을 누르면 위 숨겨진 테이블의 tr 을 가져다가 추가할 겁니닷 -->
					</table>
					<div id='apndngfiles'></div>
					
					<!-- 맞춤정보 입력란 -->
					<div class="ui-widget">
  					<label for="tags">Tags: </label>
  					<input id="tags"> 
  					</div>
  					<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
  					<div id="cdNmList">
  					</div>
					
				</div>

				<button type="submit" class="btn btn-primary btn-lg">입력</button>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/file.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad3.js"></script>

</body>
</html>