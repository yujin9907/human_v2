<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>
        <div class="d-flex justify-content-center">
            <div class="grid-margin stretch-card" style="width: 45%;">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">user register form</h4>
                        <div class="btn-group m-4" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">일반</button>
                            <a class="text-black" href="/company/saveForm"><button type="button"
                                    class="btn btn-default">기업</button></a>
                        </div>

                        <form class="forms-sample">
                            <label for="username">Username</label>
                            <div class="form-group row">
                                <div class="col-9"><input type="text" class="form-control" id="username"
                                        placeholder="Username"></div>
                                <div class="col-3"><button onclick="checkUsername()" class="btn btn-outline-primary"
                                        type="button" style="font-size: 8px;">중복확인</button></div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="password2">Confirm Password</label>
                                <input type="password" class="form-control" id="password2" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Username" maxlength="10">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber">Phone number</label>
                                <input type="tel" class="form-control" id="phoneNumber" placeholder="Email">
                            </div>


                            <button id="join" type="button" class="btn btn-primary mr-2">회원가입</button>
                            <button id="btnCancel" type="button" class="btn btn-light">취소</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            let isUsernameSameCheck = false;
            let checkPassword = false;
            let checkEmail = false;

            $("#join").click(() => {
                checkSamePassword();
                checkEmailExp();
                if (isUsernameSameCheck == true && checkPassword == true && checkEmail == true) {
                    insert();
                } else {
                    alert("아이디체크");
                }
            });

            $("#btnCancel").click(() => {
                location.href = "/";
            });

            function checkSamePassword() {
                let password = $("#password").val();
                let password2 = $("#password2").val();

                if (password != password2) {
                    alert("비밀번호가 일치하지 않습니다");
                } else {
                    checkPassword = true;
                }
            }

            // 이메일 정규표현식 검증
            function checkEmailExp() {
                let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");

                let email = $("#email").val();

                console.log(regex.test(email));

                if (regex.test(email) == true) {
                    checkEmail = true;
                } else {
                    alert("이메일 형식이 잘못되었습니다.");
                }
            }

            function checkUsername() {
                let username = $("#username").val();

                if (username === "") {
                    alert("아이디를 입력하시오");
                    return;
                }

                $.ajax("/user/usernameSameCheck?username=" + username, {
                    type: "GET",
                    dataType: "json",
                }).done((res) => {
                    if (res.code == 1) { // 통신 성공
                        if (res.data == true) {
                            alert("가입이 가능한 username입니다.");
                            isUsernameSameCheck = true;
                        } else {
                            alert("중복된 username 입니다.");
                            isUsernameSameCheck = false;
                        }
                    }
                });
            }

            function insert() {
                let data = {
                    username: $("#username").val(),
                    name: $("#name").val(),
                    email: $("#email").val(),
                    phoneNumber: $("#phoneNumber").val(),
                    password: $("#password").val()
                };

                $.ajax("/user/join", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    if (res.code == 1) {
                        alert("회원가입 완료");
                        location.href = "/login";
                    }
                });
            }
        </script>

        <%@ include file="../../layout/footer.jsp" %>