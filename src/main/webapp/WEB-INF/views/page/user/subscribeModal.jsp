<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="m-2 p-3 col-7 border text-center rounded display-5"><a href="/company/${subs.companyId}" class=" text-black ">${subs.companyName}</a></div>
                        <button onclick='deleteSubscribe(${subs.companyId}, ${sessionScope.principal.userId})' class="m-3 col-3 btn btn-outline-primary" type="button">구독취소</button>
                    </div>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary " data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script>
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