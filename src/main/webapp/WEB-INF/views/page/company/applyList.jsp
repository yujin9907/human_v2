<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row m-3">
<%@ include file="../user/profile.jsp" %>
<div class="col-md-9 grid-margin stretch-card">
<div class="card ">
<div class="card-body my-5">

<c:forEach var="applyData" items="${apply}">
                <div class="card px-4 m-3 border">
                    <div class="card-body row">
                        <div class="col-2" style="width:200px">
                            <img src="/img/${applyData.resumePhoto}" class="img-thumbnail"
                                style="width:200px; height:150px" />
                        </div>
                        <div class="col-8 px-5">
                            <a href="../../resume/detail/${applyData.resumeId}/${applyData.resumeUserId}">
                                <p class="fs-30 text-black py-3">${applyData.resumeTitle}</p>
                            </a>
                            <p class="">학력 : ${applyData.resumeEducation}</p>
                            <p class="">경력 : ${applyData.resumeCareer}</p>
                            <p class="">${applyData.resumeCreatedAt}</p>
                        </div>
                        <div class="col-2 d-flex flex-wrap align-content-center">
                            <a href="resume/detail/${applyData.resumeId}/${applyData.resumeUserId}">
                                <button type="button" class="btn btn-outline-primary">상세보기</button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>


</div>
</div>
</div>
</div>
<%@ include file="../../layout/footer.jsp"%>