<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../../layout/header.jsp" %>

		<input id="id" type="hidden" value="${company.companyId}">
		<input id="address" type="hidden" value="${company.companyAddress}">
		<input id="isSub" type="hidden" value="${isSub}">
		<div>
			<div class="row">
				<div class="col-sm-12">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center"
									style="margin: 0 0 0 5px">
									<div></div>
									<c:if
										test="${empty sessionScope.companyPrincipal && !empty sessionScope.principal}">
										<button class="btn btn-primary"
											onclick='subscribeCompany("${sessionScope.principal.userId}"), sendData()'>
											<i id="iconHeart" class="fa-regular fa-heart"></i> <span>관심기업등록</span>
										</button>
									</c:if>
								</div>
								<div style="margin: 20px 0 0 0;"></div>
								<div style="border-bottom: 1px solid #aaa"></div>
								<div style="margin: 30px 0 0 0;"></div>
								<div class="row d-flex align-items-center">
									<div class="col-xs-3 col-sm-3">
										<img src="/img/${company.companyLogo}" style="width: 120px; height: 44px;" />
									</div>
									<div class="col-xs-4 col-sm-6">
										<ul class="list-unstyled">
											<li style="font-size: 22px; font-weight: bold;">${company.companyName}</li>
											<div style="margin: 20px 0 0 0;"></div>
											<li style="font-size: 16px;"><i class="ti-mobile"></i>
												${company.companyPhoneNumber}</li>
											<div style="margin: 10px 0 0 0;"></div>
											<li style="font-size: 16px;"><i class="ti-email"></i>
												${company.companyEmail}</li>
											<div style="margin: 10px 0 0 0;"></div>
											<li style="font-size: 16px;"><i class="ti-direction"></i>
												${company.companyAddress}</li>
										</ul>
									</div>
									<div id="map" style="width: 230px; height: 200px;"></div>
									<!-- col-xs-4 col-sm-6 -->
								</div>
								<!-- row -->
							</div>
						</div>
					</div>
				</div>
				<!-- col-sm-9 -->
			</div>
			<!-- row -->
			<div style="border-bottom: 1px solid #aaa"></div>
			<div style="margin: 30px 0 0 0;"></div>
			<div class="row text-center" style="margin: 0 0.5px">
				<div class="col-md-4 col-xl-4  stretch-card pricing-card ">
					<div class="card border py-3 ">
						<h3 class="mt-3 ml-2">커뮤니티</h3>
						<hr class="border-primary" />
						<p class="mt-3 ml-2 px-3">궁금했던 직무와 기업 현직자에게 물어볼래요?</p>
					</div>
					<!-- card border border-primary center-block -->
				</div>
				<!-- col-md-4 col-xl-4 stretch-card pricing-card -->
				<div class="col-md-4 col-xl-4  stretch-card pricing-card">
					<div class="card border py-3">
						<h3 class="mt-3 ml-2">면접경험</h3>
						<hr class="border-primary" />
						<p class="mt-3 ml-2 px-3">2019년 하반기 신입...</p>
					</div>
					<!-- card border border-primary center-block -->
				</div>
				<!-- col-md-4 col-xl-4 stretch-card pricing-card -->
				<div class="col-md-4 col-xl-4  stretch-card pricing-card">
					<div class="card border py-3">
						<h3 class="mt-3 ml-2">기업리뷰</h3>
						<hr class="border-primary" />
						<p class="mt-3 ml-2 px-3">전·현직자가 직접 등록한 기업리뷰! 근무 환경이 어떤지 확인해보세요</p>
					</div>
					<!-- card border border-primary center-block -->
				</div>
				<!-- col-md-4 col-xl-4 stretch-card pricing-card -->
			</div>
			<!-- row text-center -->
			<div style="margin: 30px 0 0 0;"></div>
			<div style="border-bottom: 1px solid #aaa"></div>
			<div style="margin: 30px 0 0 0;"></div>
		</div>
		<!-- row -->


		<input id="writer" type="hidden" value="${company.companyName}">


		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20cf6648d61d4bd68efbb7c7c95723f3&libraries=services"></script>

		<!--소켓-->
		<script src="/socket/webSocket.js"></script>

		<script>

			$(document).ready(function () {
				let isSub = $("#isSub").val();
				console.log(isSub);
				if (isSub == "true") {
					$("#iconHeart").removeClass("fa-regular");
					$("#iconHeart").addClass("fa-solid");
				} else {
					$("#iconHeart").removeClass("fa-solid");
					$("#iconHeart").addClass("fa-regular");
				}
			})
			function subscribeCompany(userId) {

				let subscribeCompanyId = $("#id").val();
				console.log(typeof subscribeCompanyId);
				subscribeCompanyId *= 1;
				console.log(typeof subscribeCompanyId);

				let data = {
					subscribeUserId: userId,
					subscribeCompanyId: subscribeCompanyId
				};

				console.log(data);


				$.ajax("/subscribe", {
					type: "POST",
					dataType: "json",
					data: JSON.stringify(data),
					headers: {
						"Content-Type": "application/json"
					}
				}).done((res) => {
					if (res.data == true) {
						alert("구독완료");
						// 나중에는 여기 기업 상세보기로 변경
						location.reload();
					} else {
						alert("이미 구독 중입니다");
						location.reload();
					}
				});
			}

		</script>


		<script>
			let address = $("#address").val();


			$("#btnDelete").click(() => {
				if (!confirm("정말로 삭제하시겠습니까?")) {
					location.reload();
				}
				resign();
			});

			function resign() {
				let id = $("#id").val();
				console.log(id);

				$.ajax("/company/delete/" + id, {
					type: "DELETE",
					dataType: "json" // 응답 데이터
				}).done((res) => {
					if (res.code == 1) {
						alert("회원탈퇴 완료");
						location.href = "/company";
					} else {
						alert("회원탈퇴 실패");
					}
				});
			}


			// 지도 API

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function (result, status) {

				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
					});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});  
		</script>
		<%@ include file="../../layout/footer.jsp" %>