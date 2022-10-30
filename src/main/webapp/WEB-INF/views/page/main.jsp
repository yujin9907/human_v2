<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@ include file="../layout/header.jsp" %>

    <div class="row">
      <div class="col-md-12 grid-margin">
      </div>
    </div>

    <div class="row">
      <div class="col-md-2 grid-margin stretch-card"></div>
      <div class="col-md-8 grid-margin stretch-card">
        <!-- 1800*670  -->
        <!-- 적용시키기 : 1280*  -->
        <div class="card position-relative">
          <div class="card-people mt-auto" style="padding-top: 0;">
            <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2"
              data-ride="carousel" style="padding-top: 0 !important;">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="/images/banner1.jpg" style="height:500px;">
                </div>
                <div class="carousel-item">
                  <img src="/images/banner2.jpg" style="height:500px;">
                </div>
                <div class="carousel-item">
                  <img src="/images/banner3.jpg" style="height:500px;">
                </div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#detailedReports" role="button" data-slide="prev"> <span
                class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
            </a> <a class="carousel-control-next" href="#detailedReports" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
      </div>
      <div class="col-md-2 grid-margin stretch-card"></div>
    </div>

    <div class="row">
      <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">
            <h1 class="card-title text-center">채용 중인 공고를 확인해보세요</h1>
            <div class="row">
              <div class="col-12">
                <div class="table">
                  <table id="" class="display expandable-table" style="width:100%">
                    <thead>
                      <tr>
                        <th class="text-center">기업명</th>
                        <th class="text-center">공고명</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">지원하기</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="data" items="${list}">
                        <tr>
                          <th class="text-center ">${data.companyUsername}</th>
                          <th class="text-center ">
                            <h3> ${data.recruitTitle} </h3>
                          </th>
                          <th class="text-center ">${data.recruitDeadline}</th>
                          <th class="text-center "><a href="/recruit/detail/${data.recruitId}/1"><button type="button"
                                class="btn btn-outline-primary">지원하기</button></a></th>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="../layout/footer.jsp" %>