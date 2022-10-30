<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../layout/header.jsp" %>





<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    지원하기
</button>
<input hidden id="recruitId" value="1">


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">이력서를 선택해주세요</h5>
                <button type="button" class=" btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="forms-sample">
                <c:forEach var="resume" items="${resume}">
                <div class="form-check">
                    <div class="m-5 p-5 col-5 border" >
                        <div style="position: absolute; top:0px; left:-50px;">
                            <label class="form-check-label" >
                            <input type="radio" class="form-check-input"  name="applyByResumeId" value="${resume.resumeId}">
                            <i class="input-helper" >   </i></label>
                        </div>
                            <h3>${resume.resumeTitle}</h3>
                            <p>${resume.resumeReadCount}</p>
                            <p>${resume.resumeCreatedAt}</p>    
                        </div> 
                    </div>  
                </c:forEach>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="btnSave" type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script>
        let resumeId = "";

        $("#btnSave").click(() => {
            save();
        });


   
	function save(){
  
        $('input[type=radio][name=applyByResumeId]').each(function() {
            if($(this).is(":checked") == true){
                resumeId =$(this).val();
            }
        });
         
		let data ={
            applyResumeId : resumeId,
            applyRecruitId : $("#recruitId").val()
		}
        console.log(data);
		$.ajax("/apply/save",{
		 type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json"
            }
        }).done((res) => {
            if (res.code == 1) {
                alert("이력서를 지원하셨습니다.");
                location.href = "/";
            }
        });

    }



    

</script>
 

<%@ include file="../../layout/footer.jsp" %>
