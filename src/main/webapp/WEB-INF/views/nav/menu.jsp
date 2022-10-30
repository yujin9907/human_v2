<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link" href="/recruit/list">
          <i class="icon-head menu-icon"></i>
          <span class="menu-title">채용</span>
        </a>
      </li>
      <c:if test="${!empty sessionScope.companyPrincipal.companyId}">
        <li class="nav-item">
          <a class="nav-link" href="/resume">
            <i class="icon-paper menu-icon"></i>
            <span class="menu-title">이력서</span>
          </a>
        </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="/companys" aria-expanded="false" aria-controls="ui-basic">
          <i class="icon-columns menu-icon"></i>
          <span class="menu-title">기업</span>
        </a>
      </li>
      <li class="nav-item">
        <c:choose>
          <c:when test="${empty sessionScope.principal && empty sessionScope.companyPrincipal}">
            <a class="nav-link" href="/login">
          </c:when>
          <c:when test="${!empty sessionScope.principal.userId }">
            <a class="nav-link" href="/mypage?id=${sessionScope.principal.userId}">
          </c:when>
          <c:when test="${!empty sessionScope.companyPrincipal.companyId }">
            <a class="nav-link" href="/company/mypage?id=${sessionScope.companyPrincipal.companyId}">
          </c:when>
        </c:choose>
        <i class="icon-grid-2 menu-icon"></i>
        <span class="menu-title">마이페이지</span>
        </a>
      </li>
    </ul>
  </nav>