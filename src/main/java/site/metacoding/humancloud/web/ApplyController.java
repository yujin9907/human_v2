package site.metacoding.humancloud.web;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.humancloud.service.ApplyService;
import site.metacoding.humancloud.service.ResumeService;
import site.metacoding.humancloud.web.dto.CMRespDto;
import site.metacoding.humancloud.web.dto.request.apply.SaveDto;
import site.metacoding.humancloud.web.dto.request.resume.ListDto;

@RequiredArgsConstructor
@Controller
public class ApplyController {
  private final ApplyService applyService;
  private final ResumeService resumeService;

  @GetMapping("/apply/{userId}")
  public String getResumeList(@PathVariable Integer userId, Model model) {

    model.addAttribute("resume", applyService.이력서목록보기(userId));

    return "page/resume/apply";
  }

  @PostMapping("/apply/save")
  public @ResponseBody CMRespDto<?> applyByResume(@RequestBody SaveDto saveDto) {
    applyService.기업공고에지원하기(saveDto);
    return new CMRespDto<>(1, "지원완료", null);
  }

  @DeleteMapping("/apply/delete/{recruitId}/{reusmeId}")
  public @ResponseBody CMRespDto<?> applyDeleteById(@PathVariable("recruitId") Integer recruitId,
      @PathVariable("reusmeId") Integer reusmeId) {
    applyService.기업공고지원취소(recruitId, reusmeId);
    return new CMRespDto<>(1, "지원취소완료", null);
  }
}
