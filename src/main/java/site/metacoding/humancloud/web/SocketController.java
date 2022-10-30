package site.metacoding.humancloud.web;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import site.metacoding.humancloud.domain.subscribe.Subscribe;
import site.metacoding.humancloud.domain.subscribe.SubscribeDao;
import site.metacoding.humancloud.web.dto.socket.MessageDto;

import java.util.ArrayList;
import java.util.List;

import static org.apache.ibatis.session.LocalCacheScope.SESSION;


@RequiredArgsConstructor
@Controller
public class SocketController {

    private final SubscribeDao subscribeDao;
    private final SimpMessageSendingOperations messageSendingOperations;

    List<Subscribe> subList = new ArrayList<>();

    public void test33(Integer companyId){
        subList = subscribeDao.findByCompanyId(companyId);
    }

    @MessageMapping("/alarm")
    public void test2(MessageDto messageDto) throws Exception{
        messageSendingOperations.convertAndSend("/sub/alarm/"+messageDto.getReceiverUsername(), messageDto);
        // db에 저장 로직
    }

    @MessageMapping("/createRecruit")
    public void doCompany(MessageDto messageDto, SimpMessageHeaderAccessor messageHeaderAccessor) throws Exception{
        // System.out.println("---------------------------------------------------------");
        // System.out.println(messageHeaderAccessor.getSessionAttributes().get("subscribeList"));

        // List<Subscribe> subscribes = (List<Subscribe>) messageHeaderAccessor.getSessionAttributes().get("sessionList");
        //     for(Subscribe subscribe : subscribes){
        //         System.out.println(subscribe);
        //         messageSendingOperations.convertAndSend("/sub/addRecruit/"+subscribe.getSubscribeUserId(), messageDto);
        //     }
        
        test33(messageDto.getSenderId());
        System.out.println("-------------------------------------");
        System.out.println(subList);

        for(Subscribe subscribe : subList){
            System.out.println(subscribe);
            messageSendingOperations.convertAndSend("/sub/addRecruit/"+subscribe.getSubscribeUserId(), messageDto);
        }
    }
}

