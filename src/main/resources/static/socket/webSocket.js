let receiverUser = $("#checkUser").val();
let receiverUserId = $("#checkUserId").val();
let receiverCompany = $("#checkCompany").val();
let receiverCompanyId = $("#checkCompanyId").val();

let stomp="";

window.onload=function (){
    if(receiverUser != null){
        let socket = new SockJS('/websocket');
        stomp = Stomp.over(socket);
        stomp.connect({}, function () {
            console.log('연결됨');
            stomp.subscribe('/sub/addRecruit/'+receiverUserId, function (result){
                let parsingResult = JSON.parse(result.body);
                console.log(parsingResult);
                $("#boxAlarm").empty();
                $("#boxAlarm").append(viewMessage(parsingResult));
                $("#notificationDropdown").dropdown('show');
            });
        });
    } else if (receiverCompany != null) {
        let companySocket = new SockJS('/websocket');
        stomp = Stomp.over(companySocket);
        stomp.connect({}, function () {
            console.log('연결됨');
            stomp.subscribe('/sub/alarm/'+receiverCompany, function (result){
                let parsingResult = JSON.parse(result.body);
                console.log(parsingResult);
                $("#boxAlarm").empty();
                $("#boxAlarm").append(viewMessage(parsingResult));
                $("#notificationDropdown").dropdown('show');
            });
        });
    }
}

function viewMessage(message){
    let sender =  message.sender;
    let alarmType = message.alarmType;

    // message = message.replaceAll("\n", "<br>").replaceAll(" ", "&nbsp");

    let resultMessage =`<div class="preview-item-content">`+sender+` 님이 `+alarmType+`하였습니다</div>`;
    return resultMessage
}
// topbar---------------------------------------------------------------------


function sendData(){
    let writer = $("#writer").val();
    let data = {
        'receiverUsername': writer,
        'alarmType':'구독',
        'sender':receiverUser,
    };

    stomp.send("/pub/alarm", {}, JSON.stringify(data));
}
// company detail-----------------------------------------------------------------

function sendRecruitAlarm(){
    let data = {
        'senderId' : receiverCompanyId,
        'sender':receiverCompany,
        'alarmType':'채용공고 작성',
    }

    stomp.send("/pub/createRecruit", {}, JSON.stringify(data));
}

//recruit saveform----------------------------------------------------------------