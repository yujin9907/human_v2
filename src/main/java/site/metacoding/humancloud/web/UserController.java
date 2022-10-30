package site.metacoding.humancloud.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.RequiredArgsConstructor;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.domain.subscribe.Subscribe;
import site.metacoding.humancloud.domain.subscribe.SubscribeDao;
import site.metacoding.humancloud.domain.user.User;
import site.metacoding.humancloud.service.UserService;
import site.metacoding.humancloud.web.dto.CMRespDto;
import site.metacoding.humancloud.web.dto.request.user.JoinDto;
import site.metacoding.humancloud.web.dto.request.user.LoginDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class UserController {

    private final UserService userService;
    private final HttpSession session;

    @DeleteMapping("/user/{id}")
    public @ResponseBody CMRespDto<?> delete(@PathVariable Integer id) {
        userService.회원탈퇴(id);
        session.invalidate();
        return new CMRespDto<>(1, "회원탈퇴성공", null);
    }

    @PutMapping("/update/{id}")
    public @ResponseBody CMRespDto<?> update(@PathVariable Integer id, @RequestBody JoinDto joinDto) {
        userService.회원업데이트(id, joinDto);
        return new CMRespDto<>(1, "ok", null);
    }

    @GetMapping("/update/{id}")
    public String updateMypage(@PathVariable Integer id, Model model) {
        model.addAttribute("user", userService.유저정보보기(id));
        return "page/user/updateMypageForm";
    }

    @GetMapping("/mypage")
    public String viewMypage(@RequestParam Integer id, Model model) {
        model.addAttribute("subscribe", userService.구독기업보기(id));
        model.addAttribute("user", userService.유저정보보기(id));
        model.addAttribute("resume", userService.이력서보기(id));
        model.addAttribute("companyList", userService.추천기업목록보기());
        return "page/user/mypage";
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "page/user/login";
    }

    @PostMapping("/user/login")
    public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto, HttpServletRequest request) {
        User result = userService.로그인(loginDto);
        if (result != null) {
            HttpSession session = request.getSession();
            session.setAttribute("principal", result);
        }
        return new CMRespDto<>(1, "1", result);
    }

    @PostMapping("/user/join")
    public @ResponseBody CMRespDto<?> joinUser(@RequestBody JoinDto joinDto) {
        userService.회원가입(joinDto);
        return new CMRespDto<>(1, "ok", null);
    }

    @GetMapping("/user/usernameSameCheck")
    public @ResponseBody CMRespDto<?> usernameSameCheck(@RequestParam("username") String username) {
        Boolean result = userService.유저네임중복체크(username);
        if (result == true) {
            return new CMRespDto<>(1, "ok", true);
        }
        return new CMRespDto<>(1, "same id", false);
    }

    @GetMapping("/join")
    public String userSaveForm() {
        return "page/user/userSaveForm";
    }

}
