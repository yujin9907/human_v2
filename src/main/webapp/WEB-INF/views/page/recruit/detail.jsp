<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>

        <!-- 기업사진 명 등-->
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img class="stretch-card" src="/img/${Recruit.company.companyLogo}" alt="people">
                </div>
            </div>

            <div class="col-md-8  transparent">
                <div>
                    <p class="card-title"></p>${Recruit.company.companyName}</p>
                    <h2 class="text-primary">${Recruit.recruitTitle}
                    </h2>
                </div>

                <div>
                    <div class="mt-2">
                        <p class="text-primary">
                            <c:forEach var="category" items="${Recruit.category}">
                                <span>#${category.categoryName}</span>
                            </c:forEach>
                        </p>
                        <p><span>근무지 : ${Recruit.recruitLocation}</span></p>
                    </div>
                </div>
            </div>
            <c:choose>
                <c:when test="${empty sessionScope.companyPrincipal}">
                    <div class="row">
                        <div class="d-flex">
                            <div class="ml-auto">
                                <button type="button" class="btn btn-outline-primary btn-icon-text"
                                    data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="ti-file btn-icon-prepend"></i>
                                    즉시지원하기
                                </button>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div></div>
                </c:otherwise>
            </c:choose>
        </div>
        <hr />

        <div class="row">
            <div class="col-md-6 col-xl-6  stretch-card pricing-card ">
                <div class="card border border-primary ">
                    <h3 class="mt-3 text-center">지원 자격</h3>
                    <hr class="border-primary" />

                    <p class="m-3 text-center plan-cost text-primary">경력 :${Recruit.recruitCareer} </p>
                    <p class="m-3 text-center plan-cost text-primary">연봉 :${Recruit.recruitSalary} </p>
                </div>
            </div>

            <div class="col-md-6 col-xl-6  stretch-card pricing-card">
                <div class="card border border-primary">
                    <h3 class="mt-3 text-center">회사 소개</h3>
                    <hr class="border-primary" />

                    <p class="m-3 text-center plan-cost text-primary">${Recruit.company.companyName} 의 소개 내용</p>

                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="card align-items-center">
                <div class="card-body">
                    <p class="font-weight-500">
                        ${Recruit.recruitContent}
                    </p>

                </div>

            </div>

            <c:choose>
                <c:when test="${sessionScope.companyPrincipal.companyId == Recruit.recruitCompanyId}">
                    <div class="m-2">
                        <button style="font-style: white;" type="button" class="btn btn-primary btn-icon-text"
                            onclick="location.href='/recruit/update/${Recruit.recruitId}'">
                            <i class="ti-file btn-icon-prepend"></i>
                            수정하기
                        </button>
                        <button style="font-style: white;" type="button" class="btn btn-outline-primary btn-icon-text"
                            onclick="recruitDelete()">
                            <i class="ti-file btn-icon-prepend"></i>
                            삭제하기
                        </button>
                    </div>
                </c:when>
            </c:choose>

        </div>

        <hr />
        <div class="row">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <p class="card-title">${Recruit.company.companyName} 기업의 다른 공고</p>

                    <div class="">

                        <table class="display expandable-table dataTable no-footer" style="width: 100%;">
                            <thead>
                                <tr role="row">
                                    <!-- sorting_desc / sorting_asc 으로 해가지고 Ajax 로 ORDER BY 하는거 하면 리스트 정렬 가능-->
                                    <!-- 이름순, 추천순, 작성일자 순 -->
                                    <th onclick="order()" class="select-checkbox sorting_desc" rowspan="1" colspan="1">
                                        No
                                        <!-- recruitId -->
                                    </th>
                                    <th class="select-checkbox sorting_asc" rowspan="1" colspan="3">
                                        공고
                                        <!-- recruitId -->
                                    </th>

                                    <th class="select-checkbox sorting_desc" rowspan="1" colspan="2">
                                        연봉
                                        <!-- recruitId -->
                                    </th>
                                    <th class="select-checkbox sorting_desc" rowspan="1" colspan="1">
                                        공고 시작 일자
                                        <!-- recruitId -->
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <!-- class = odd / even -->
                                <c:forEach var="lists" items="${Recruit.recruitListByCompanyId}">
                                    <tr role="row">
                                        <td rowspan="1" colspan="1">추천 수...?</td>
                                        <td rowspan="1" colspan="3">
                                            <a href="/recruit/detail/${lists.recruitId}" class="text-dark">
                                                ${lists.recruitTitle}
                                            </a>
                                        </td>
                                        <td rowspan="1" colspan="2">${lists.recruitSalary} 만원</td>
                                        <td rowspan="1" colspan="1">${lists.recruitStartDay}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">이력서를 선택해주세요</h5>
                        <button type="button" class=" btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.principal}">
                            <div class="modal-body">
                                <form class="forms-sample">
                                    <div class="align-center">
                                        <p>로그인 먼저 해주세요</p>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary"
                                    data-bs-dismiss="modal">Close</button>
                                <button id="btnLogin" type="button" class="btn btn-primary">Login</button>
                            </div>
                        </c:when>

                        <c:when test="${!empty sessionScope.principal}">
                            <div class="modal-body">
                                <form class="forms-sample">
                                    <c:forEach var="apply" items="${apply}">
                                        <div class="form-check">
                                            <div class="m-5 p-5 col-5 border">
                                                <div style="position: absolute; top:0px; left:-50px;">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input"
                                                            name="applyByResumeId" value="${apply.resumeId}">
                                                        <i class="input-helper"> </i></label>
                                                </div>
                                                <h3>${apply.resumeTitle}</h3>
                                                <p>${apply.resumeReadCount}</p>
                                                <p>${apply.resumeCreatedAt}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary"
                                    data-bs-dismiss="modal">Close</button>
                                <button id="btnSave" type="button" class="btn btn-primary">Save changes</button>
                            </div>

                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>

        <input id="recruitId" value="${Recruit.recruitId}" type="hidden">
        <script>
            let resumeId = "";

            function recruitDelete() {
                let id = $('#recruitId').val();

                $.ajax("/recruit/delete/" + id, {
                    type: "DELETE"
                }).done((res) => {
                    if (res.code == 1) {
                        alert("삭제 성공하였습니다");
                        location.href = "/recruit/list";
                    } else {
                        alert("삭제에 실패했습니다");
                    }
                });

            }

            function order() {
                alert("솔트 합니다");
            }

            $("#btnLogin").click(() => {
                login();
            });

            function login() {
                location.href = '/login';
            }

            $("#btnSave").click(() => {
                save();
            });

            function save() {

                $('input[type=radio][name=applyByResumeId]').each(function () {
                    if ($(this).is(":checked") == true) {
                        resumeId = $(this).val();
                    }
                });

                let data = {
                    applyResumeId: resumeId,
                    applyRecruitId: $("#recruitId").val()
                }
                console.log(data);
                $.ajax("/apply/save", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    if (res.code == 1) {
                        alert("이력서를 지원하셨습니다.");
                        location.href = "/";
                    }
                });

            }
        </script>

        <%@ include file="../../layout/footer.jsp" %>