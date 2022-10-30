<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../../layout/header.jsp" %>
        <div class="d-flex justify-content-center ">
            <div class="row w-50">
                <div class="content-wrapper auth px-0">
                    <div class="col-md d-flex justify-content-center">
                        <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="width: 80%;">
                            <i class="fa-solid fa-d small text-primary display-4 m-3 py-3">evridge</i>
                            <div class="btn-group col-lg" role="group" aria-label="Basic example">
                                <button id="user" onclick="changeColor(this.value)" type="button"
                                    class="str btn btn-primary" value="user">일반</button>
                                <button id="company" onclick="changeColor(this.value)" type="button"
                                    class="str btn btn-outline-primary" value="company">기업</button>
                            </div>
                            <form class="pt-3">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-lg" id="username"
                                        placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-lg" id="password"
                                        placeholder="Password">
                                </div>
                                <div class="mt-3">
                                    <a onclick="login()"
                                        class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
                                        href="#">SIGN IN</a>
                                </div>
                                <div class="my-2 d-flex justify-content-between align-items-center">
                                    <div class="form-check">
                                        <label class="form-check-label text-muted">
                                            <input type="checkbox" class="form-check-input">
                                            Keep me signed in
                                        </label>
                                    </div>
                                    <a href="#" class="auth-link text-black">Forgot password?</a>
                                </div>

                                <div class="text-center mt-4 font-weight-light">
                                    Don't have an account? <a href="/join" class="text-primary">Create</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            let check = "user";

            function changeColor(str) {
                if (str == 'company') {
                    $("#user").removeClass();
                    $("#user").addClass("btn btn-outline-primary");
                    $("#" + str).addClass("btn btn-primary text-white");
                } else {
                    $("#company").removeClass();
                    $("#company").addClass("btn btn-outline-primary");
                    $("#" + str).addClass("btn btn-primary text-white");
                }

                check = str;
            }

            function login() {
                let data;

                if (check == "company") {
                    data = {
                        companyUsername: $("#username").val(),
                        companyPassword: $("#password").val(),
                    };
                } else {
                    data = {
                        username: $("#username").val(),
                        password: $("#password").val(),
                    };
                }

                console.log(data);

                $.ajax("/" + check + "/login", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8"
                    }
                }).done((res) => {
                    if (res.data != null) {
                        location.href = "/"; //UX 를 위해 로그인 하면 이전의 페이지로
                    } else {
                        alert("로그인 실패");
                    }
                });
            }
        </script>
        <%@ include file="../../layout/footer.jsp" %>