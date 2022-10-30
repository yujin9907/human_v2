<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../../layout/header.jsp" %>
		<div class="d-flex justify-content-center">
			<div class="grid-margin stretch-card" style="width: 45%;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">company register form</h4>
						<div class="btn-group m-4" role="group" aria-label="Basic example">
							<a class="text-black" href="/join"><button type="button"
									class="btn btn-default">일반</button></a>
							<button type="button" class="btn btn-primary">기업</button>
						</div>

						<form enctype="multipart/form-data" id="fileUploadForm" class="forms-sample">
							<label for="companyUsername">Username</label>
							<div class="form-group row">
								<div class="col-9"><input type="text" class="form-control" id="companyUsername"
										placeholder="companyUsername" name="companyUsername"></div>
								<div class="col-3"><button id="btnCheckSameUsername" type="button"
										class="btn btn-outline-primary" style="font-size: 8px;">중복확인</button></div>
							</div>
							<div class="form-group">
								<label for="companyPassword">Password</label>
								<input type="password" class="form-control" id="companyPassword"
									placeholder="companyPassword" name="companyPassword">
							</div>
							<div class="form-group">
								<label for="companyPassword2">Confirm Password</label>
								<input type="password" class="form-control" id="companyPassword2"
									placeholder="confirm_password">
							</div>
							<div class="form-group">
								<label for="companyName">Name</label>
								<input type="text" class="form-control" id="companyName" placeholder="companyName"
									name="companyName" maxlength="20">
							</div>
							<div class="form-group">
								<label for="companyEmail">Email</label>
								<input type="email" class="form-control" id="companyEmail" placeholder="companyEmail"
									name="companyEmail">
							</div>
							<div class="form-group">
								<label for="companyPhoneNumber">Phone number</label>
								<input type="tel" class="form-control" id="companyPhoneNumber"
									placeholder="companyPhoneNumber" name="companyPhoneNumber">
							</div>
							<div class="form-group">
								<label for="companyAddress">Address</label>
								<input type="text" class="form-control" id="companyAddress" placeholder="companyAddress"
									name="companyAddress">
								<button type="button" class="btn btn-outline-primary mr-2 my-2"
									onclick="sample6_execDaumPostcode()">주소입력</button>
							</div>
							<div class="form-group">
								<label for="companyLogo">logo</label>
								<input type="file" class="form-control" id="companyLogo" name="companyLogo">
							</div>

							<button id="btnSave" type="button" class="btn btn-primary mr-2">회원가입</button>
							<button id="btnCancel" type="button" class="btn btn-light">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			let isUsernameSameCheck = false;
			let checkPassword = false;
			let checkEmail = false;

			$("#btnCheckSameUsername").click(() => {
				checkSameUsername();
			});


			$("#btnSave").click(() => {
				checkSamePassword();
				checkEmailExp();
				if (isUsernameSameCheck == true && checkPassword == true && checkEmail == true) {
					save();
				}
			});

			$("#btnCancel").click(() => {
				location.href = "/";
			});

			// username 중복 체크
			function checkSameUsername() {

				let companyUsername = $("#companyUsername").val();

				if (companyUsername === "") {
					alert("아이디를 입력하시오");
					return;
				}

				$.ajax("/company/checkSameUsername?companyUsername=" + companyUsername, {
					type: "GET",
					dataType: "json",
					async: true
				}).done((res) => {
					if (res.code == 1) {
						if (res.data == false) {
							alert("가입이 가능한 username입니다.");
							isUsernameSameCheck = true;
						} else {
							alert("중복된 username 입니다.");
							isUsernameSameCheck = false;
							$("#companyUsername").val('');
						}
					}
				});
			}

			// 비밀번호 중복확인
			function checkSamePassword() {
				let password = $("#companyPassword").val();
				let password2 = $("#companyPassword2").val();

				if (password != password2) {
					alert("비밀번호가 일치하지 않습니다");
				} else {
					checkPassword = true;
				}
			}

			// 이메일 정규표현식 검증
			function checkEmailExp() {
				let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");

				let companyEmail = $("#companyEmail").val();

				console.log(regex.test(companyEmail));

				if (regex.test(companyEmail) == true) {
					checkEmail = true;
				} else {
					alert("이메일 형식이 잘못되었습니다.");
				}
			}




			// 주소 API
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
							document.getElementById("companyAddress").value = addr + extraAddr;

						} else {
							document.getElementById("companyAddress").value = '';
						}
					}
				}).open();
			}




			// 기업 회원 등록
			function save() {
				let formData = new FormData();

				let data = {
					companyUsername: $("#companyUsername").val(),
					companyPassword: $("#companyPassword").val(),
					companyName: $("#companyName").val(),
					companyEmail: $("#companyEmail").val(),
					companyPhoneNumber: $("#companyPhoneNumber").val(),
					companyAddress: $("#companyAddress").val()
				};

				formData.append("file", $("#companyLogo")[0].files[0]);

				formData.append("saveDto", new Blob([JSON.stringify(data)], { type: "application/json" }));

				console.log(data.companyName);
				console.log(data.companyUsername);

				$.ajax("/company/save", {
					type: "post",
					data: formData,
					processData: false,
					contentType: false,
					enctype: 'multipart/form-data'
				}).done((res) => {
					if (res.code == 1) {
						alert("회원가입 성공");
						location.href = "/login"
					}
					else {
						alert("실패");
					}
				});
			}

		</script>
		<%@ include file="../../layout/footer.jsp" %>