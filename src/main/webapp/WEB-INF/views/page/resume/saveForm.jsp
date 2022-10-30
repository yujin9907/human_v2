<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../../layout/header.jsp" %>
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">이력서 작성</h3>
                <form class="forms-sample">
                    <div class="form-group">
                        <label for="name">이력서 제목</label>
                        <input type="text" class="form-control" id="title" placeholder="이력서 제목" minlength="3"
                            maxlength="20">
                    </div>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" placeholder="이름 입력" value="${user.name}"
                            readonly>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" class="form-control" id="email" placeholder="이메일 입력" value="${user.email}"
                            readonly>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">전화번호</label>
                        <input type="tel" class="form-control" id="phoneNumber" placeholder="전화번호 입력"
                            value="${user.phoneNumber}" readonly>
                    </div>
                    <div class="form-group">
                        <input type="file" id="file" accept="image/*" onchange="setThumbnail(event)">
                        <div id="imageContainer">
                        </div>
                    </div>
                    <h3 class="card-title">학력 정보</h3>
                    <div class="form-check d-flex">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="education" name="education" value="고졸">
                                고졸
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="education" name="education"
                                    value="2년제대학졸업">
                                2년제 대학 졸업
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="education" name="education"
                                    value="3년제대학졸업">
                                3년제 대학 졸업
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="education" name="education"
                                    value="4년제대학졸업">
                                4년제 대학 졸업
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="education" name="education"
                                    value="대학원졸업">
                                대학원 졸업
                                <i class="input-helper"></i></label>
                        </div>
                    </div>
                    <h3 class="card-title">경력 사항</h3>
                    <div class="col-md-8">
                        <div class="form-group row">
                            <div class="col-sm-9">
                                <select id="resumeCareer" class="form-control">
                                    <option>경력선택</option>
                                    <option value="신입">신입</option>
                                    <option value="1년미만">1년미만</option>
                                    <option value="1년이상 ~ 3년미만">1년이상 ~ 3년미만</option>
                                    <option value="3년이상 ~ 5년미만">3년이상 ~ 5년미만</option>
                                    <option value="6년이상">6년이상</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <h3 class="card-title">사용 블로그</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" id="blog" placeholder="깃허브 주소나 블로그주소를 입력해주세요"
                            maxlength="60">
                    </div>
                    <h4 class="card-title">카테고리</h4>
                    <div class="d-flex">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"
                                    value="Flutter">
                                Flutter
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"
                                    value="Java">
                                Java
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"
                                    value="HTML&CSS">
                                HTML&CSS
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"
                                    value="JavaScript">
                                JavaScript
                                <i class="input-helper"></i></label>
                        </div>
                        <div style="margin: 0 20px 0 0;"></div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"
                                    value="Python">
                                Python
                                <i class="input-helper"></i></label>
                        </div>
                    </div>
                    <div class="btn-group m-4" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-primary" id="btnSave"
                            onclick='Save("${sessionScope.principal.userId}")'>작성완료</button>
                    </div>
                    <button id="btnCancel" type="button" class="btn btn-light">취소</button>
                    <%-- btn-group m-4 --%>
                </form>
            </div>
        </div>
        <script>

            function setThumbnail(event) {
                let reader = new FileReader();

                reader.onload = function (event) {


                    if (document.getElementById("newImg")) {
                        document.getElementById("newImg").remove();
                    }
                    let img = document.createElement("img");
                    img.setAttribute("src", event.target.result);
                    img.setAttribute("id", "newImg");
                    img.style.width = '150px';
                    img.style.height = '200px';
                    document.querySelector("#imageContainer").appendChild(img);

                };
                reader.readAsDataURL(event.target.files[0]);
            }


            function Save(userId) {
                let categoryName = new Array();
                let education = "",
                    titleNullCheck = $("#title").val();

                if (titleNullCheck == "") {
                    alert("이력서 제목은 필수 입니다.");
                    return;
                }

                $('input[type=radio][name=education]').each(function () {
                    if ($(this).is(":checked") == true) {
                        education = $(this).val();
                    }
                });
                $("input:checkbox[name='categoryName']").each(function () {
                    if ($(this).is(":checked ") == true) {
                        categoryName.push($(this).val());
                    }
                });

                let formData = new FormData();

                let data = {
                    resumeTitle: $("#title").val(),
                    resumeEducation: education,
                    resumeCareer: $("#resumeCareer option:selected").val(),
                    resumeLink: $("#blog").val(),
                    categoryList: categoryName,
                    resumeUserId: userId
                }

                formData.append('file', $("#file")[0].files[0]);
                formData.append('saveDto', new Blob([JSON.stringify(data)], { type: "application/json" }));

                $.ajax("/resume/save", {
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    enctype: 'multipart/form-data'
                }).done((res) => {
                    if (res.code == 1) {
                        alert("이력서 등록 성공");
                        location.href = "/mypage/?id=" + userId;

                    }
                });
            }

            $("#btnCancel").click(() => {
                history.back();
            });
        </script>

        <%@ include file="../../layout/footer.jsp" %>