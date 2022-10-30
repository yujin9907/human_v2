<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>

        <div class=" m-3">
            <div class="d-flex justify-content-between">
                <div class="btn-group">
                    <c:forEach var="category" items="${recruits.category}">
                        <button onclick='btnCategory("${category.categoryName}")'
                            class="btn btn-primary">${category.categoryName}</button>
                    </c:forEach>
                </div>
                <div class="dropdown">
                    <select id="btnOrder" onchange="orderDo(this.value, '${sessionScope.principal.userId}')"
                        class="form-select dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        <option selected>정렬</option>
                        <option value="recent">최신순</option>
                        <option value="career">경력순</option>
                        <option value="recommend">추천순</option>
                    </select>
                </div>
            </div>
        </div>

        <div id="recruitCard" class="">
            <c:forEach var="recruit" items="${recruits.recruit}">
                <div class="card mb-3 mt-3">
                    <div class="card-body row">
                        <div class="col-10 px-5">
                            <p class="fs-30 mb-4 text-primary">${recruit.recruitTitle}</p>
                            <p class=""><span class=" text-primary"> 경력 : </span>${recruit.recruitCareer} / <span
                                    class=" text-primary"> 연봉 : </span>${recruit.recruitSalary} 만원</p>
                            <p class=""><span class="text-primary"> 근무지 : </span>${recruit.recruitLocation}</p>
                            <p class=""><span class=" text-primary"> 공고 일 : </span>${recruit.recruitStartDay}</p>
                        </div>
                        <div class="col-2 d-flex flex-wrap align-content-center">
                            <c:choose>
                                <c:when test="${empty sessionScope.principal.userId}">
                                    <a href="/recruit/detail/${recruit.recruitId}/0">
                                        <button type="button" class="btn btn-outline-primary">상세보기</button>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/recruit/detail/${recruit.recruitId}/${sessionScope.principal.userId}">
                                        <button type="button" class="btn btn-outline-primary">상세보기</button>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="d-flex justify-content-center">
                <ul class="pagination">
                    <li class='page-item'><a class="page-link text-black"
                            href="/recruit/list?page=${recruits.paging.currentPage -1}">previous</a></li>
                    <c:forEach var="num" begin="${recruits.paging.startPageNum}" end="${recruits.paging.lastPageNum}"
                        step="1">
                        <a class="page-link text-black" href='/recruit/list?page=${num-1}'>${num}</a>
                    </c:forEach>
                    <li class='page-item'><a class="page-link text-black"
                            href="/recruit/list?page=${recruits.paging.currentPage+1}">Next</a></li>
                </ul>
            </div>
        </div>
        <input hidden value="${sessionScope.companyPrincipal.companyId}" id="companyId" />
        <script>
            $("#btnGoSave").click(() => {
                recruitSave();
            });
            function recruitSave() {
                let id = $('#companyId').val();
                location.href = "/recruit/saveForm/" + id;
            }

            function btnCategory(title) {
                let data = {
                    categoryName: title,
                };

                $.ajax("/recruit/category", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    $("#recruitCard").empty();
                    $("#recruitCard").append(makeList(res.data));
                }).fail(function (error) {
                    console.log(error);
                    alert("오류");
                });
            }

            function orderDo(listOption, userId) {
                let checkUser = userId;
                let data = {
                    userId: userId,
                };

                $.ajax({
                    type: "POST",
                    url: "/recruit/list?order=" + listOption,
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8"
                    }
                }).done((res) => {
                    $("#recruitCard").empty();
                    $("#recruitCard").append(makeList(res.data));
                }).fail(function (error) {
                    console.log(error);
                    alert("오류");
                });
            }


            function makeList(x, checkUser) {
                let pathDetail = checkUser;
                if (checkUser == null) {
                    pathDetail = 0;
                }

                let item = ``;
                for (let list of x) {
                    item += `<div class="card mb-3 mt-3"> <div class="card-body row"> <div class="col-10 px-5">`;
                    item += `<p class="fs-30 mb-4 text-primary">` + list.recruitTitle + `</p>`;
                    item += `<p class=""><span class=" text-primary"> 경력 : </span>` + list.recruitCareer + `/ <span class=" text-primary">`
                    item += `연봉 : </span>` + list.recruitSalary + ` 만원</p>`;
                    item += `<p class=""><span class="text-primary"> 근무지 : </span>` + list.recruitLocation + `</p>`;
                    item += `<p class=""><span class=" text-primary"> 공고 일 : </span>` + list.recruitStartDay + `</p></div>`;
                    item += `<div class="col-2 d-flex flex-wrap align-content-center">`;
                    item += `<a href="/recruit/detail/` + list.recruitId + `/` + pathDetail + `">`;
                    item += ` <button type="button" class="btn btn-outline-primary ">상세보기</button>`;
                    item += `</a></div></div></div>`;
                }
                return item;
            }
        </script>
        <%@ include file="../../layout/footer.jsp" %>