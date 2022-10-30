<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>
        <div class="container-scroller">
            <div class="row">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">공고 작성 페이지</h4>
                            <form class="forms-sample">
                                <input type="hidden" id="recruitCompanyId" value="${company.companyId}">
                                <div class="form-group">
                                    <label>공고명</label>
                                    <input type="text" required class="form-control" id="recruitTitle"
                                        placeholder="Name">
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label>경력</label>
                                    <select class="form-control" id="recruitCareer">
                                        <option>경력선택</option>
                                        <option>신입</option>
                                        <option>1년미만</option>
                                        <option>1년이상 ~ 3년미만</option>
                                        <option>3년이상 ~ 5년미만</option>
                                        <option>6년이상</option>
                                    </select>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <div><label>카테고리</label></div>
                                    <div class="d-flex form-group">
                                        <div class="ml-2 form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" id="recruitCategory"
                                                    value="Flutter">Flutter</label>
                                        </div>
                                        <div class="ml-2 form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" id="recruitCategory"
                                                    value="Java">Java</label>
                                        </div>
                                        <div class="ml-2 form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" id="recruitCategory"
                                                    value="HTML&CSS">HTML&CSS</label>
                                        </div>
                                        <div class="ml-2 form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" id="recruitCategory"
                                                    value="JavaScript">JavaScript</label>
                                        </div>
                                        <div class="ml-2 form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" id="recruitCategory"
                                                    value="Python">Python</label>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label>연봉</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-primary text-white">$</span>
                                        </div>
                                        <input type="number" class="form-control" id="recruitSalary"
                                            aria-label="Amount (to the nearest dollar)"
                                            placeholder="연봉을 ' 만 ' 단위로 입력해 주세요">
                                    </div>
                                </div>
                                <hr />
                                <!-- <div class="form-group">
                                    <label>첨부파일</label>
                                    <input type="file" name="img[]" class="file-upload-default">
                                    <div class="input-group col-xs-12">
                                        <input type="text" class="form-control file-upload-info" disabled=""
                                            placeholder="첨부파일 업로드">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary"
                                                type="button">Upload</button>
                                        </span>
                                    </div>
                                </div>
                                <hr /> -->
                                <div class="form-group d-flex ">
                                    <div class="">
                                        <label>위치검색</label>
                                        <div class="input-group">
                                            <div class="form-outline">
                                                <input type="text" class="form-control" id="recruitLocation"
                                                    placeholder="주소" name="companyAddress">
                                            </div>
                                            <div class="input-group-append">
                                                <input class="btn btn-sm btn-primary " type="button"
                                                    id="recruitLocation" onclick="sample6_execDaumPostcode()"
                                                    value="우편번호 찾기">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ml-5">
                                        <label>마감일자</label>
                                        <div class="input-group">
                                            <div class="form-outline">
                                                <input type="date" class="form-control text-primary"
                                                    id="recruitDeadline" placeholder="주소" name="companyAddress">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label for="exampleTextarea1">내용 입력</label>
                                    <%@ include file="summernote.jsp" %>
                                        <textarea id="summernote"></textarea>
                                </div>
                                <button id="submitBtn" type="button" class="btn btn-primary mr-2">작성 완료</button>
                                <button id="btnCancel" class="btn btn-light">취소</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input id="companyId" type="hidden" value="${sessionScope.companyPrincipal.companyId}" />

        <%--소켓--%>
            <script src="/socket/webSocket.js"></script>

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수
                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }
                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if (data.userSelectedType === 'R') {
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if (data.buildingName !== '' && data.apartment === 'Y') {
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if (extraAddr !== '') {
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("recruitLocation").value = addr + extraAddr;

                            } else {
                                document.getElementById("recruitLocation").value = '';
                            }
                        }
                    }).open();
                }

                $('#submitBtn').click(() => {
                    sendRecruitAlarm();

                    let recruitCategoryList = [];
                    $("#recruitCategory:checked").each(function () {
                        recruitCategoryList.push($(this).val());
                    });

                    let data = {
                        recruitTitle: $('#recruitTitle').val(),
                        recruitCareer: $('#recruitCareer').val(),
                        recruitLocation: $('#recruitLocation').val(),
                        recruitCompanyId: $('#companyId').val(),
                        recruitCategoryList: recruitCategoryList,
                        /* recruitDeadline: $('#recruitDeadline').val(), */
                        recruitSalary: $('#recruitSalary').val(),
                        recruitContent: $('#summernote').val(),
                        recruitCompanyId: $('#recruitCompanyId').val()
                    };

                    let recruitCompanyId = $('#recruitCompanyId').val();
                    console.log(recruitCompanyId);
                    console.log(data);


                    $.ajax("/recruit/save", {
                        type: "POST",
                        dataType: "json",
                        data: JSON.stringify(data),
                        headers: {
                            "Content-Type": "application/json; charset=utf-8"
                        }
                    }).done((res) => {
                        if (res.code == 1) {
                            alert("인서트 성공하였습니다");
                            location.href = "/recruit/list"
                        } else {
                            alert("업데이트에 실패했습니다");
                        }
                    });


                });

                $('#summernote').summernote({
                    height: 300
                });

                $("#btnCancel").click(() => {
                    history.back();
                });
            </script>
            <%@ include file="../../layout/footer.jsp" %>