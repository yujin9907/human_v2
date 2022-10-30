<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

내용작성

<button type="button" onclick='subscribeCompany(${sessionScope.principal})'>구독하기</button>
<input id="companyId" type="hidden" value="1">



<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    구독 목록 보기
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">구독 목록</h5>
                <button type="button" class=" btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <c:forEach var="subs" items="${subscribe}">
                    <div class="row d-flex justify-content-between">
                        <div class="m-3 col-7 border">${subs.companyName}</div>
                        <button onclick='deleteSubscribe(${subs.companyId}, ${sessionScope.principal})' class="m-3 col-3 btn btn-outline-danger" type="button">구독취소</button>
                    </div>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>




<script>
    function subscribeCompany(userId){
        let data = {
            subscribeUserId : userId,
            subscribeCompanyId: $("#companyId").val()
        };


        $.ajax("/subscribe", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json"
            }
        }).done((res) => {
            if (res.code == 1) {
                alert("구독완료");
                // 나중에는 여기 기업 상세보기로 변경
                location.href = "/";
            }
        });
    }

    function deleteSubscribe(companyId, userId){
        $.ajax("/subscribe/" + userId + "/" + companyId, {
            type: "DELETE",
            dataType: "json"
        }).done((res) => {
            if (res.code == 1) {
                alert("구독삭제완료");
                location.reload();
            } else {
                alert("오류");
            }
        });
    }
</script>

<%@ include file="../layout/footer.jsp" %>
