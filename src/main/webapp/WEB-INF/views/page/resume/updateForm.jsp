<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../../layout/header.jsp" %>
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">이력서 작성</h3>
                <input id="resumeId" type="hidden" value='${resume.resumeId}' />
                <input id="userId" type="hidden" value='${user.userId}' />
                <form class="forms-sample">
                    <div class="form-group">
                        <label for="name">이력서 제목</label>
                        <input type="text" class="form-control" id="title" placeholder="이력서 제목"
                            value="${resume.resumeTitle}">
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

                        <input type="file" id="file" onchange="setThumbnail(event)" />
                        <div style="margin:  20px 0 0 0;"></div>
                        <div id="image_container">
                            <img id="oldImg" src="/img/${resume.resumePhoto}">
                        </div>
                    </div>
                    <hr />
                    <h3 class="card-title">학력 정보</h3>
                    <div class="form-check d-flex" id="education">
                        <div class="form-check d-flex">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" id="education" name="education"
                                        value="고졸">
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
                    </div>
                    <hr />
                    <h3 class="card-title">경력 사항</h3>
                    <div class="col-md-8">
                        <div class="form-group row">
                            <div class="col-sm-9">
                                <label class="col-form-label">경력선택</label>
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
                    <hr />
                    <h3 class="card-title">사용 블로그</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" id="blog" placeholder="깃허브 주소나 블로그주소를 입력해주세요"
                            value="${resume.resumeLink}">
                    </div>
                    <hr />
                    <h4 class="card-title">직무</h4>
                    <div class="d-flex">
                   <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName" value="Flutter">
                    Flutter
                <i class="input-helper"></i></label>
            </div>
            <div style="margin: 0 20px 0 0;"></div>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"  value="Java">
                    Java
                <i class="input-helper"></i></label>
            </div>
            <div style="margin: 0 20px 0 0;"></div>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input"  id="categoryName" name="categoryName"  value="HTML&CSS"> 
                    HTML&CSS
                <i class="input-helper"></i></label>
            </div>   
               <div style="margin: 0 20px 0 0;"></div>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" id="categoryName" name="categoryName"  value="JavaScript">
                    JavaScript
                <i class="input-helper"></i></label>
            </div>
            <div style="margin: 0 20px 0 0;"></div>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input"  id="categoryName" name="categoryName"  value="Python"> 
                    Python
                <i class="input-helper"></i></label>
            </div>   
                    </div>
                    <hr />
                    <div class="btn-group m-4" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-primary" id="btnUpdate">작성완료</button>
                    </div>
                    <%-- btn-group m-4 --%>
                        <c:forEach var="category" items="${category}">
                            <input name="asd" type="hidden" value='${category.categoryName}' />
                        </c:forEach>

                </form>
            </div>
        </div>

        <script>

            let edu = '${resume.resumeEducation}';
            let career = '${resume.resumeCareer}';
            // 라디오 버튼 값 가져오기

            $('input:radio[name = education]:input[value=' + edu + ']').attr("checked", true);

            // 드롭박스 값 가져오기
            $("#resumeCareer").val(career);

            // 체크박스 값 가져오기
            let arr = new Array();
            let count = $("input[name=asd]").length;

            for (let i = 0; i < count; i++) {
                arr.push(document.getElementsByName("asd")[i].value);
            }

            let chkbox = $('.form-check-input');

            for (let i = 0; i < arr.length; i++) {
                for (let j = 0; j < chkbox.length; j++) {
                    if (arr[i] == chkbox[j].value) {
                        chkbox[j].checked = true;
                    }
                }
            }


            function setThumbnail(event) {
                let reader = new FileReader();

                reader.onload = function (event) {


                    if (document.getElementById("newImg")) {
                        document.getElementById("newImg").remove();
                    }
                    let img = document.createElement("img");
                    let oldImg = $("#oldImg");
                    oldImg.remove();
                    img.setAttribute("src", event.target.result);
                    img.setAttribute("id", "newImg");
                    img.style.width = '150px';
                    img.style.height = '200px';
                    document.querySelector("#image_container").appendChild(img);

                };
                reader.readAsDataURL(event.target.files[0]);
            }


            $("#btnUpdate").click(() => {
                update();
            });
            function update() {
                let categoryName = new Array();
                let education = "";

                let resumeId = $("#resumeId").val();
                let userId = $("#userId").val();

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
                    resumeId: resumeId,
                    resumeTitle: $("#title").val(),
                    resumeEducation: education,
                    resumeCareer: $("#resumeCareer option:selected").val(),
                    resumeLink: $("#blog").val(),
                    categoryList: categoryName
                }

                formData.append('file', $("#file")[0].files[0]);
                formData.append('updateDto', new Blob([JSON.stringify(data)], { type: "application/json" }));

                $.ajax("/resume/update/" + resumeId, {
                    type: "PUT",
                    data: formData,
                    processData: false,
                    contentType: false,
                    enctype: 'multipart/form-data'
                }).done((res) => {
                    if (res.code == 1) {
                        alert("이력서 수정 성공");

                        location.href = "/resume/detail/" + resumeId + "/" + userId;

                    }
                });
            }

        </script>
        <%@ include file="../../layout/footer.jsp" %>