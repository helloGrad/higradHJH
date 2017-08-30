
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a id="gradBtn" class="btn btn-info"
	href="${pageContext.servletContext.contextPath }/noti/list">전체</a>
<a id="gradBtn" class="btn btn-info"
	href="${pageContext.servletContext.contextPath }/noti/grad">대학원 더보기</a>
<a id="labBtn" class="btn btn-info"
	href="${pageContext.servletContext.contextPath }/noti/lab">연구실 더보기</a>
<a id="insertBtn" class="btn btn-info"
	href="${pageContext.servletContext.contextPath }/noti/insert">+</a>