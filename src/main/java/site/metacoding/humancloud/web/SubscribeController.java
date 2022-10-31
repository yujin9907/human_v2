package site.metacoding.humancloud.web;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import site.metacoding.humancloud.domain.subscribe.Subscribe;
import site.metacoding.humancloud.dto.ResponseDto;
import site.metacoding.humancloud.service.SubscribeService;

@RequiredArgsConstructor
@Controller
public class SubscribeController {

    private final SubscribeService subscribeService;

    @DeleteMapping("/subscribe/{userId}/{companyId}")
    public @ResponseBody ResponseDto<?> deleteSubscribe(@PathVariable("userId") Integer userId,
            @PathVariable("companyId") Integer companyId) {
        subscribeService.구독취소(userId, companyId);
        return new ResponseDto<>(1, "OK", null);
    }

    @GetMapping("/test/{userId}")
    public String test(@PathVariable("userId") Integer userId, Model model) {
        model.addAttribute("subscribe", subscribeService.구독기업보기(userId));
        return "page/subscribe";
    }

    @PostMapping("/subscribe")
    public @ResponseBody ResponseDto<?> subscribeCompany(@RequestBody Subscribe subscribe) {
        return new ResponseDto<>(1, "ok", subscribeService.구독하기(subscribe));
    }
}
