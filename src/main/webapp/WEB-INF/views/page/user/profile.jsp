<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class=" col-md-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="py-5 px-3 border-bottom">
                        <div>
                            <c:choose>
                                <c:when test="${resume.resume[0].resumePhoto == null}">
                                    <img src="/images/defaultprofile/defaultProfile.jpeg" class="img-thumbnail" />
                                </c:when>
                                <c:otherwise>
                                    <img class="w-100" src="/img/${resume.resume[0].resumePhoto}">
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <c:choose>
                            <c:when
                                test="${!empty sessionScope.principal.userId && empty sessionScope.companyPrincipal.companyId}">
                                <div class="text-center p-3 font-weight-bold">${user.email}</div>
                                <div class="text-center px-3 font-weight-bold">${user.phoneNumber}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center p-3  font-weight-bold">${company.companyEmail}</div>
                                <div class="text-center px-3  font-weight-bold">${company.companyPhoneNumber}</div>
                            </c:otherwise>
                        </c:choose>
                        <!-- <div class="text-center py-4 my-3 btn-primary rounded">#백엔드 #자바</div> -->
                        <c:if
                            test="${!empty sessionScope.companyPrincipal.companyId && empty sessionScope.principal.userId}">
                            <div></div>
                        </c:if>
                        <c:if
                            test="${!empty sessionScope.principal.userId && empty sessionScope.companyPrincipal.companyId}">
                            <div class="text-center py-4 my-3 btn-primary rounded" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">구독한 기업</div>
                        </c:if>
                    </div>
                    <!--             <div class="p-3 border-bottom d-flex justify-content-around">
                <div class="">
                    <div class="my-2">구독한 기업</div>
                    <div class="my-2">열람</div>
                    <div class="my-2">받은 제안</div>

                </div>
                <div class="p-3 border-bottom d-flex justify-content-around">
                    <div class="">
                        <div class="my-2">구독한 기업</div>
                        <div class="my-2">열람</div>
                        <div class="my-2">받은 제안</div>

                    </div>
                    <div class="">
                        <div class=" font-weight-bold my-2">구독기업수</div>
                        <div class=" font-weight-bold my-2">0</div>
                        <div class=" font-weight-bold my-2">0</div>

                    </div>
                </div>
                <div class="my-5 p-3 text-center">
                    <a class="text-black" href="/update/${sessionScope.principal.userId}">
                        <div class="col-12 btn btn-primary">회원정보수정</div>
                    </a>
                    <div class="col-12 mt-2 btn btn-danger" onclick='deleteUser("${sessionScope.principal.userId}")'>
                        계정탈퇴</div>
                </div>
            </div>
 -->
                    <div class="py-3 px-3 text-center ">
                        <c:choose>
                            <c:when
                                test="${!empty sessionScope.principal.userId && empty sessionScope.companyPrincipal.companyId}">
                                <div class="btn btn-primary mb-2 w-100"
                                    onclick="location.href='/update/${sessionScope.principal.userId}'">
                                    회원정보수정
                                </div>
                                <div class="btn btn-outline-primary btn-fw w-100 "
                                    onclick='deleteUser("${sessionScope.principal.userId}")'>계정탈퇴</div>
                            </c:when>
                            <c:when
                                test="${!empty sessionScope.companyPrincipal.companyId && empty sessionScope.principal.userId}">
                                <div class="btn btn-primary col-12 mb-2"
                                    onclick="location.href='/company/updateForm/${sessionScope.companyPrincipal.companyId}'">
                                    기업정보수정
                                </div>
                                <div class="btn btn-outline-primary btn-fw col-12"
                                    onclick='deleteCompany("${sessionScope.companyPrincipal.companyId}")'>기업 삭제</div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function deleteUser(id) {
                $.ajax("/user/" + id, {
                    type: "DELETE",
                    dataType: "json"
                }).done((res) => {
                    if (res.code == 1) {
                        alert("회원탈퇴완료");
                        location.href = "/";
                    } else {
                        alert("회원탈퇴실패");
                    }
                });
            }


            function deleteCompany(id) {
                $.ajax("/company/" + id, {
                    type: "DELETE",
                    dataType: "json"
                }).done((res) => {
                    if (res.code == 1) {
                        alert("회원탈퇴완료");
                        location.href = "/";
                    } else {
                        alert("회원탈퇴실패");
                    }
                });
            }

        </script>