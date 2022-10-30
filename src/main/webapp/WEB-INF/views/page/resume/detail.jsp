<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../../layout/header.jsp" %>
        <div>
            <div class="row">
                <div class="d-flex justify-content-lg-center">
                    <h1 class="my-5">${resume.resumeTitle}</h1>
                </div>
                <!-- col-sm-9 -->
                <div class="row border-top border-bottom p-3">
                    <div class="col-xs-1 col-sm-3">
                    <img src="/img/${resume.resumePhoto}" class="img-thumbnail" />
                    </div>
                    <div class="col-xs-3 col-sm-5">
                        <ul class="list-unstyled">
                            <li style="font-size : 22px; font-weight:bold;">
                                ${user.name}
                            </li>
                            <div style="margin: 20px 0 0 0;"></div>
                            <li style="font-size : 16px;">
                                <i class="ti-mobile"></i> ${user.phoneNumber}
                            </li>
                            <div style="margin: 10px 0 0 0;"></div>
                            <li style="font-size : 16px;">
                                <i class="ti-email"></i> ${user.email}
                            </li>
                            <div style="margin: 10px 0 0 0;"></div>
                            <li style="font-size : 16px;">
                                <i class="ti-desktop"></i>
                                <a href="${resume.resumeLink}">${resume.resumeLink}</a>
                            </li>
                        </ul>
                    </div>
                    <!-- col-xs-4 col-sm-6 -->
                </div>
            </div><!-- row -->
        </div><!-- col-sm-9 -->
    
        <div class="row text-center py-3">
            <div class="col-md-4 col-xl-4  stretch-card pricing-card ">
                <div class="card border center-block py-3">
                    <h3 class="mt-3 ml-2">학력사항</h3>
                    <hr class="border-primary" />
                    <p class="m-3 plan-cost text-primary">${resume.resumeEducation}</p>
                </div><!-- card border border-primary center-block -->
            </div><!-- col-md-4 col-xl-4  stretch-card pricing-card -->
            <div class="col-md-4 col-xl-4  stretch-card pricing-card">
                <div class="card border py-3">
                    <h3 class="mt-3 ml-2">경력사항</h3>
                    <hr class="border-success" />
                    <p class="m-3 plan-cost text-primary">${resume.resumeCareer}</p>
                </div><!-- card border border-primary center-block -->
            </div><!-- col-md-4 col-xl-4  stretch-card pricing-card -->
            <div class="col-md-4 col-xl-4  stretch-card pricing-card">
                <div class="card border py-3">
                    <h3 class="mt-3 ml-2">원하는직업</h3>
                    <hr class="border-primary" />
                    <div class="d-flex flex-wrap justify-content-center">
                        <c:forEach var="category" items="${category}">
                            <div class="p-2 plan-cost text-primary ">${category.categoryName}</div>
                        </c:forEach>
                    </div>
                </div><!-- card border border-primary center-block -->
            </div><!-- col-md-4 col-xl-4  stretch-card pricing-card -->
        </div><!-- row text-center -->
        <div class="row border-top p-4">
            <div class="d-flex justify-content-center">
                <div class="mr-2">
                    <c:if test="${sessionScope.companyPrincipal == null || sessionScope.userPrincipal == resume.resumeUserId}">
                    <a href="/resume/updateForm/${resume.resumeId}/${resume.resumeUserId}"
                        class="btn btn-primary btn-icon-text">
                        <i class="ti-file btn-icon-prepend"></i>
                        이력서 수정하기
                    </a>
                    </div><!-- mr-2 -->
                    <div class="mr-2">
                        <button type="button" id="btnDelete" class="btn btn-outline-primary btn-icon-text">
                            <i class="ti-trash btn-icon-prepend"></i>
                            이력서 삭제하기
                        </button>
                    </div>
                    </c:if>
                </div>
        
        <script>
            $("#btnDelete").click(() => {
                deleteById();
            });

            function deleteById() {
                let resumeId = ${ resume.resumeId }

                $.ajax("/resume/deleteById/" + resumeId, {
                    type: "DELETE",
                    dataType: "json" // 응답 데이터
                }).done((res) => {
                    if (res.code == 1) {
                        location.href = document.referrer;
                        alert("글삭제 성공");
                    } else {
                        alert("글삭제 실패");
                    }
                });
            }

        </script>

        <%@ include file="../../layout/footer.jsp" %>