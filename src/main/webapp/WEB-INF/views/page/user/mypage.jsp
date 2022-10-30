<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>
        <%@ include file="subscribeModal.jsp" %>
            <div class="row">
                <%@ include file="profile.jsp" %>
                    <div class="col-md-9 grid-margin stretch-card">
                        <div class="card ">
                            <div class="card-body my-5">
                                <h4 class="m-3 text-primary font-weight-bold">지원 현황</h4>
                                <div class="row rounded m-2 p-5 text-center  border">

                                    <c:choose>
                                        <c:when
                                            test="${!empty sessionScope.principal.userId && empty sessionScope.companyPrincipal.companyId}">
                                            <div class="col border-right">
                                                <div class="display-2">0</div>
                                                <div>지원 완료</div>
                                            </div>
                                            <div class="col border-right">
                                                <div class="display-2">${resume.readCount}</div>
                                                <div>이력서 열람</div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col border-right">
                                                <a href="/company/${sessionScope.companyPrincipal.companyId}/applyList">
                                                    <div class="display-2 text-black">${countApply}</div>
                                                </a>
                                                <div>지원 이력서</div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="col border-right">
                                        <div class="display-2">0</div>
                                        <div>최종합격</div>
                                    </div>
                                    <div class="col">
                                        <div class="display-2">0</div>
                                        <div>불합격</div>
                                    </div>
                                </div>
                                <c:if
                                    test="${!empty sessionScope.principal.userId && empty sessionScope.companyPrincipal.companyId}">
                                    <div class="my-5">
                                        <h4 class="m-3 text-primary font-weight-bold">이력서</h4>
                                        <div class="row d-flex justify-content-center">
                                            <c:choose>
                                                <c:when test="${empty resume.resume}">
                                                    <div class="m-3 p-3 col-2 border rounded"
                                                        onchange='viewResume("${r.resumeId}")'>
                                                        <a href="/resume/saveForm/${sessionScope.principal.userId}">
                                                            <h1 style="text-align:center; " class="text-primary">+
                                                            </h1>
                                                        </a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="r" items="${resume.resume}" begin="0" end="2">
                                                        <div class="m-3 p-3 col-2 border rounded"
                                                            onchange='viewResume("${r.resumeId}")'>
                                                            <a href="/resume/detail/${r.resumeId}/${r.resumeUserId}">
                                                                <h3 class="m-1 text-primary text-center">
                                                                    ${r.resumeTitle}</h3>
                                                            </a>
                                                            <div class="text-center">${r.resumeReadCount}</div>
                                                            <div class="text-center">${r.resumeCreatedAt}</div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="m-3 p-3 col-2 border rounded"
                                                        onchange='viewResume("${r.resumeId}")'>
                                                        <a href="/resume/saveForm/${sessionScope.principal.userId}">
                                                            <h1 style="text-align:center;" class="text-primary">+
                                                            </h1>
                                                        </a>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if
                                    test="${!empty sessionScope.companyPrincipal.companyId && empty sessionScope.principal.userId}">
                                    <div class="my-5">
                                        <h4 class="m-3 text-primary">채용공고</h4>
                                        <div class="row d-flex justify-content-center">
                                            <c:choose>
                                                <c:when test="${empty recruitList}">
                                                    <div class="m-3 p-3 col-2 border rounded"
                                                        onchange='viewResume("${r.resumeId}")'>
                                                        <a
                                                            href="/recruit/saveForm/${sessionScope.companyPrincipal.companyId}">
                                                            <h1 style="text-align:center; " class="text-primary">+
                                                            </h1>
                                                        </a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="recruit" items="${recruitList}" begin="0" end="2">
                                                        <div class="m-3 p-3 col-2 border rounded"
                                                            onchange='viewRecruit("${recruit.recruitId}")'>
                                                            <a
                                                                href="/recruit/detail/${recruit.recruitId}/${sessionScope.companyPrincipal.companyId}">
                                                                <h3 class="m-1 text-primary text-center">
                                                                    ${recruit.recruitTitle}</h3>
                                                            </a>
                                                            <div class="text-center">${recruit.recruitReadCount}</div>
                                                            <div class="text-center">${recruit.recruitCreatedAt}</div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="m-3 p-3 col-2 border rounded"
                                                        onchange='viewResume("${r.resumeId}")'>
                                                        <a
                                                            href="/recruit/saveForm/${sessionScope.companyPrincipal.companyId}">
                                                            <h1 style="text-align:center;" class="text-primary">+
                                                            </h1>
                                                        </a>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if
                                    test="${!empty sessionScope.principal.userId && empty sessionScope.companyPrincipal.companyId}">
                                    <div class="my-5">
                                        <h4 class="m-3 text-primary font-weight-bold">추천</h4>
                                        <div class="row d-flex justify-content-center">
                                            <c:forEach var="company" items="${companyList}" begin="0" end="3">
                                                <div class="m-3 p-3 col-2 border rounded">
                                                    <div class="card row">
                                                        <div class="card-people d-flex justify-content-center"
                                                            style="padding: 0 0 0 0; margin: 0 0.1px 0 0.1px;">
                                                            <img src="/img/${company.logo}"
                                                                style="border-bottom-left-radius: 0; border-bottom-right-radius: 0; width: 110px; height: 50px;">
                                                        </div>
                                                        <p class="p-3 mx-3">
                                                            <i class="fa-solid fa-heart" style="color:red;"></i><span>
                                                                좋아요
                                                                :
                                                                ${company.likes}</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <script>
                        function viewResume(id) {
                            $.ajax({
                                type: "GET",
                                // url: 여기다가 이력서 상세보기 연결 (매개변수 id 있음),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                            }).done((res) => {
                                location.href = "#";
                            }).fail(function (error) {
                                console.log(error);
                                alert("오류");
                            });
                        }

                        function viewRecruit(id) {
                            $.ajax({
                                type: "GET",
                                // url: 여기다가 이력서 상세보기 연결 (매개변수 id 있음),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                            }).done((res) => {
                                location.href = "#";
                            }).fail(function (error) {
                                console.log(error);
                                alert("오류");
                            });
                        }

                    </script>

                    <%@ include file="../../layout/footer.jsp" %>