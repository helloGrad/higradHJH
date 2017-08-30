<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



<style> textarea {width:300px; overflow:visible} </style>


<script>
    function resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (20+obj.scrollHeight)+"px";
    }
</script>



</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<c:import url="/WEB-INF/views/organz/include/menu.jsp" />
			
		</div>
		<hr class="nav-line">
		
	
	
		<div class="row">
			<div id="lab" class="col-lg-12">
				<h2>연구실 - 연구실이름/연구내용으로 구분</h2>
				
				
				<form class="resrch-form" id="resrch-form" name="resrch-form"
					method="post"
					action="${pageContext.servletContext.contextPath }/organz/resrchupdate">
					<input type="hidden" id="resrchAcrsltNo" name="resrchAcrsltNo" value="${resrchAcrsltVo.resrchAcrsltNo }">
					<input type="hidden" id="regstDt" name="regstDt" value="${resrchAcrsltVo.regstDt }">
					연구실 번호 : <input type="text" class="form-control" id="orgnzNo"
						name="orgnzNo" value="${resrchAcrsltVo.orgnzNo }"> <br> 
						<c:if test="${resrchAcrsltVo.acrsltDstnct == '논문' }">
						실적구분 : <select
						name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문" selected="selected">논문</option>
						<option value="세미나">세미나</option>
						<option value="학회">학회</option>
						<option value="특허">특허</option>
						<option value="프로젝트">프로젝트</option>
						<option value="기타">기타</option>
					</select>
					</c:if>
						<c:if test="${resrchAcrsltVo.acrsltDstnct == '기타' }">
						실적구분 : <select
						name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문">논문</option>
						<option value="세미나">세미나</option>
						<option value="학회">학회</option>
						<option value="특허">특허</option>
						<option value="프로젝트">프로젝트</option>
						<option value="기타" selected="selected">기타</option>
					</select>
					</c:if>
						<c:if test="${resrchAcrsltVo.acrsltDstnct == '세미나' }">
						실적구분 : <select
						name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문">논문</option>
						<option value="세미나" selected="selected">세미나</option>
						<option value="학회">학회</option>
						<option value="특허">특허</option>
						<option value="프로젝트">프로젝트</option>
						<option value="기타">기타</option>
					</select>
					</c:if>
						<c:if test="${resrchAcrsltVo.acrsltDstnct == '학회' }">
						실적구분 : <select
						name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문">논문</option>
						<option value="세미나">세미나</option>
						<option value="학회" selected="selected">학회</option>
						<option value="특허">특허</option>
						<option value="프로젝트">프로젝트</option>
						<option value="기타">기타</option>
					</select>
					</c:if>
						<c:if test="${resrchAcrsltVo.acrsltDstnct == '특허' }">
						실적구분 : <select
						name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문">논문</option>
						<option value="세미나">세미나</option>
						<option value="학회">학회</option>
						<option value="특허" selected="selected">특허</option>
						<option value="프로젝트">프로젝트</option>
						<option value="기타">기타</option>
					</select>
					</c:if>
						<c:if test="${resrchAcrsltVo.acrsltDstnct == '프로젝트' }">
						실적구분 : <select
						name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문">논문</option>
						<option value="세미나">세미나</option>
						<option value="학회">학회</option>
						<option value="특허">특허</option>
						<option value="프로젝트" selected="selected">프로젝트</option>
						<option value="기타">기타</option>
					</select>
					</c:if>
					 <br> <br> 연구년도 :<input type="text" class="form-control"
						id="resrchYycl" name="resrchYycl" value="${resrchAcrsltVo.resrchYycl }"> <br> 
						연구내용:
					<textarea 
						class="form-control" onkeydown="resize(this)" onkeyup="resize(this)" id="resrchText" name="resrchText">${resrchAcrsltVo.resrchText }</textarea>
					<br>

					<button type="submit" class="form-control">수정</button>
				</form>
			</div>
		</div>


	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/list.js"></script>
	
		
</body>
</html>