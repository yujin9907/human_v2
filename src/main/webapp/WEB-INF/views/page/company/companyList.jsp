<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../../layout/header.jsp" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<div id="recruitCard" class="">
				<c:forEach var="company" items="${companyList.list}">
					<div class="card mb-3 mt-3" style="height:150px">
						<div class="card-body row">
							<div class="col-10 row ">
								<img class="col-2" src="/img/${company.companyLogo}"
									style="width: 100px; height:40px; margin: auto 0;" alt="${company.companyName}">
								<p class="col-3 text-primary display-4 py-4 font-weight-bold" style="margin: auto 0;">
									${company.companyName}</p>
								<p class=" col-2 m-5"><span class=" text-primary" style="margin: auto 0;">현재 채용중</span>
								</p>
							</div>
							<div class="col-2 d-flex flex-wrap align-content-center">
								<a href="/company/${company.companyId}">
									<button type="button" class="btn btn-outline-primary">상세보기</button>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="d-flex justify-content-center">
				<ul class="pagination">
					<li class='page-item'><a class="page-link text-black"
							href="/companys?page=${companyList.paging.currentPage -1}">previous</a></li>
					<c:forEach var="num" begin="${companyList.paging.startPageNum}"
						end="${companyList.paging.lastPageNum}" step="1">
						<a class="page-link text-black" href='/companys?page=${num-1}'>${num}</a>
					</c:forEach>
					<li class='page-item'><a class="page-link text-black"
							href="/companys?page=${companyList.paging.currentPage+1}">Next</a></li>
				</ul>
			</div>


			<%@ include file="../../layout/footer.jsp" %>