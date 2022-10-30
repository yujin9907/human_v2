<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>sample</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

      <link rel="stylesheet" type="text/css" href="/js/select.dataTables.min.css">
      <link rel="stylesheet" href="/css/vertical-layout-light/style.css">
      <link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
      <link rel="shortcut icon" href="/images/favicon.png" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">

      <!-- sock js -->
      <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
      <!-- STOMP -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

      <link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    </head>



    <body class="d-flex justify-content-center">
      <div class="container-scroller w-75 Larger shadow">
        <%@ include file="../nav/topbar.jsp" %>
          <!--<%@ include file="../nav/toast.jsp" %>-->
          <div class="container-fluid page-body-wrapper">
            <%@ include file="../nav/menu.jsp" %>
              <div class="main-panel ">
                <div class="content-wrapper ">