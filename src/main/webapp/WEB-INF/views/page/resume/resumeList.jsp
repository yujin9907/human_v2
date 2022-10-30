<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>

        <div class=" m-3">
            <div class="d-flex justify-content-between">
                <div class="btn-group">
                    <c:forEach var="category" items="${resumeData.category}">
                        <button onclick='btnCategory("${category.categoryName}", ${sessionScope.principal})'
                            class="btn btn-primary">${category.categoryName}</button>
                    </c:forEach>
                </div>
                <div class="dropdown">
                    <select id="btnOrder" onchange="orderDo(this.value, ${sessionScope.companyPrincipal.companyId})"
                        class="form-select dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        <option selected>정렬</option>
                        <option value="recent">최신순</option>
                        <option value="career">경력순</option>
                        <option value="education">학력순</option>
                        <option value="recommend">추천순</option>
                    </select>
                </div>
            </div>
        </div>

        <div id="resumeCard" class="">
            <c:forEach var="resume" items="${resumeData.resume}">
                <div class="card px-4 m-3">
                    <div class="card-body row">
                        <div class="col-2" style="width:200px">
                            <img src="/img/${resume.resumePhoto}" class="img-thumbnail"
                                style="width:200px; height:150px" />
                        </div>
                        <div class="col-8 px-5">
                            <p class="fs-30 text-black py-3">${resume.resumeTitle}</p>
                            <p class="">학력 : ${resume.resumeEducation}</p>
                            <p class="">경력 : ${resume.resumeCareer}</p>
                            <p class="">${resume.resumeCreatedAt}</p>
                        </div>
                        <div class="col-2 d-flex flex-wrap align-content-center">
                            <a href="resume/detail/${resume.resumeId}/${resume.resumeUserId}">
                                <button type="button" class="btn btn-outline-primary">상세보기</button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="d-flex justify-content-center">
                <ul class="pagination">
                    <li class='page-item'><a class="page-link text-black"
                            href="/resume?page=${resumeData.paging.currentPage -1}">previous</a></li>
                    <c:forEach var="num" begin="${resumeData.paging.startPageNum}"
                        end="${resumeData.paging.lastPageNum}" step="1">
                        <a class="page-link text-black" href='/resume?page=${num-1}'>${num}</a>
                    </c:forEach>
                    <li class='page-item'><a class="page-link text-black"
                            href="/resume?page=${resumeData.paging.currentPage+1}">Next</a></li>
                </ul>
            </div>
        </div>



        <script>
            function btnCategory(title) {
                let data = {
                    categoryName: title,
                };

                $.ajax("/resume", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    $("#resumeCard").empty();
                    $("#resumeCard").append(makeList(res.data));
                }).fail(function (error) {
                    console.log(error);
                    alert("에러");
                });
            }

            function orderDo(listOption, companyId) {
                let data = {
                    companyId: companyId,
                };
                $.ajax({
                    type: "POST",
                    url: "/resume/list?order=" + listOption,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    $("#resumeCard").empty();
                    $("#resumeCard").append(makeList(res.data));
                }).fail(function (error) {
                    console.log(error);
                    alert("오류");
                });
            }

            function makeList(x) {
                let item = ``;
                for (let list of x) {
                    item += `<div class="card px-4 m-3"><div class="card-body row"><div class="col-2" style="width:200px">`;
                    item += `<img src="/img/` + list.resumePhoto + `" class="img-thumbnail" style="width:200px; height:150px"/></div>`;
                    item += `<div class="col-8 px-5">`
                    item += `<a href="resume/detail/${resume.resumeId}/${resume.resumeUserId}"><p class="fs-30 text-black py-3">` + list.resumeTitle + `</p></a>`;
                    item += `<p>학력 : ` + list.resumeEducation + `</p>`;
                    item += `<p>경력 : ` + list.resumeCareer + `</p>`;
                    item += `<p class="">` + list.resumeCreatedAt + `</p>`;
                    item += `</div><div class="col-2 d-flex flex-wrap align-content-center">`;
                    item += `<a href="resume/detail/` + list.resumeId + `/` + list.resumeUserId + `">`;
                    item += `<button type="button" class="btn btn-outline-primary">` + `상세보기` + `</button></a>`
                    item += `</div></div></div>`
                }
                return item;
            }
        </script>
        <%@ include file="../../layout/footer.jsp" %>