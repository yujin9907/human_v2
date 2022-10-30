<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center ">
        <a class="navbar-brand brand-logo mr-5 text-primary" href="/"><i class="fa-solid fa-d small">evridge</i></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

        <!-------------검색창-------------->
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now"
                aria-label="search" aria-describedby="search" onkeypress="search(event)">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <c:choose>
              <c:when test="${empty sessionScope}">
                <div style="margin: 0 10px;">
                  <a class="text-white" href="/login"><button type="button" class="btn btn-primary">로그인 </button></a>
                  <a class="text-primary" href="/join"><button type="button"
                      class="btn btn-outline-primary">회원가입</button></a>
                </div>
              </c:when>
              <c:otherwise>
                <!---------로그인 후--------->
                <!-----------알림창------------>
                <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#"
                  data-toggle="dropdown">
                  <i class="bi bi-bell-fill"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                  aria-labelledby="notificationDropdown">
                  <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-success">
                      </div>
                    </div>
                    <div id="boxAlarm" class="mx-3">
                      <h6 class="preview-subject font-weight-normal">Application Error</h6>
                    </div>
                  </a>
                </div>
          </li>
          <!------------로그인후 아이콘------------>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown">
              <i class="bi bi-person-circle"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <c:choose>
                <c:when test="${!empty principal.userId}">
                  <a href="/mypage?id=${sessionScope.principal.userId}" class="dropdown-item">
                    <i class="ti-settings text-primary"></i>
                    MyPage
                  </a>
                </c:when>
                <c:when test="${!empty companyPrincipal.companyId}">
                  <a href="/company/mypage?id=${sessionScope.companyPrincipal.companyId}" class="dropdown-item">
                    <i class="ti-settings text-primary"></i>
                    MyPage
                  </a>
                </c:when>
              </c:choose>
              <a href="/logout" class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
            </c:otherwise>
            </c:choose>
          </li>
        </ul>
      </div>
    </nav>
    <c:choose>
      <c:when test="${!empty principal.userId}">
        <input id="checkUser" type="hidden" value="${sessionScope.principal.username}">
        <input id="checkUserId" type="hidden" value="${sessionScope.principal.userId}">
      </c:when>
      <c:when test="${!empty companyPrincipal.companyId}">
        <input id="checkCompany" type="hidden" value="${sessionScope.companyPrincipal.companyName}">
        <input id="checkCompanyId" type="hidden" value="${sessionScope.companyPrincipal.companyId}">
      </c:when>
    </c:choose>

    <script src="/socket/webSocket.js"></script>
    <script>
      function search(e) {
        var txt = document.getElementById("navbar-search-input").value;
        if (e.keyCode == 13) { //엔터 키 == 13 -> 엔터키 일때만 동작
          if (txt == "") {
            alert("검색어를 입력해 주세요");
            return;
          }
          location.href = "/recruit/list?title=" + txt;
        }
      }

    </script>