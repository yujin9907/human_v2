package site.metacoding.humancloud.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.RequiredArgsConstructor;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.domain.user.User;
import site.metacoding.humancloud.service.ApplyService;
import site.metacoding.humancloud.service.CompanyService;
import site.metacoding.humancloud.service.RecruitService;
import site.metacoding.humancloud.service.SubscribeService;
import site.metacoding.humancloud.web.dto.CMRespDto;
import site.metacoding.humancloud.web.dto.request.company.LoginDto;
import site.metacoding.humancloud.web.dto.request.company.SaveDto;
import site.metacoding.humancloud.web.dto.request.company.UpdateDto;
import site.metacoding.humancloud.web.dto.response.user.ResCompanyDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class CompanyController {

	private final CompanyService companyService;
	private final SubscribeService subscribeService;
	private final HttpSession session;

	// 기업 회원가입 페이지
	@GetMapping("/company/saveForm")
	public String saveForm() {
		return "page/company/saveForm";
	}

	// 기업회원 username 중복체크
	@GetMapping("/company/checkSameUsername")
	public @ResponseBody CMRespDto<?> checkSameUsername(@RequestParam("companyUsername") String companyUsername) {
		boolean isSame = companyService.checkSameUsername(companyUsername);
		return new CMRespDto<>(1, "통신 성공", isSame);
	}

	// 기업 회원가입
	@PostMapping(value = "/company/save", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE })
	public @ResponseBody CMRespDto<?> save(@RequestPart("file") MultipartFile file,
			@RequestPart("saveDto") SaveDto saveDto) throws Exception {

		int pos = file.getOriginalFilename().lastIndexOf(".");
		String extension = file.getOriginalFilename().substring(pos + 1);
		String filePath = "C:\\temp\\img\\";
		String logoSaveName = UUID.randomUUID().toString();
		String logo = logoSaveName + "." + extension;

		File makeFileFolder = new File(filePath);
		if (!makeFileFolder.exists()) {
			if (!makeFileFolder.mkdir()) {
				throw new Exception("File.mkdir():Fail.");
			}
		}

		File dest = new File(filePath, logo);
		try {
			Files.copy(file.getInputStream(), dest.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}

		Company company = saveDto.toEntity(logo);
		companyService.saveCompany(company);
		return new CMRespDto<>(1, "기업 등록 성공", logo);
	}

	// 기업 정보 상세보기
	@GetMapping("/company/{id}")
	public String getCompanyDetail(@PathVariable Integer id, Model model) {
		User userSession = (User) session.getAttribute("principal");
		if (userSession == null) {
			model.addAttribute("company", companyService.getCompanyDetail(id));
		} else {
			model.addAttribute("company", companyService.getCompanyDetail(id));
			model.addAttribute("isSub", subscribeService.구독확인(userSession.getUserId(), id));
		}
		return "page/company/detail";
	}

	// 기업 리스트 보기
	@GetMapping("/companys")
	public String getCompanyList(Model model, @Param("page") Integer page) {
		model.addAttribute("companyList", companyService.getCompanyList(page));
		return "page/company/companyList";
	}

	// 기업 정보 수정하기 페이지
	@GetMapping("/company/updateForm/{id}")
	public String updateForm(@PathVariable Integer id, Model model) {
		model.addAttribute("company", companyService.getCompanyDetail(id));
		return "page/company/updateForm";
	}

	// 기업 정보 수정
	@PutMapping(value = "/company/update/{id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.MULTIPART_FORM_DATA_VALUE })
	public @ResponseBody CMRespDto<?> update(@PathVariable Integer id, @RequestPart("file") MultipartFile file,
			@RequestPart("updateDto") UpdateDto updateDto) throws Exception {
		System.out.println("controller실행");

		int pos = file.getOriginalFilename().lastIndexOf(".");
		String extension = file.getOriginalFilename().substring(pos + 1);
		String filePath = "C:\\temp\\img\\";
		String logoSaveName = UUID.randomUUID().toString();
		String logo = logoSaveName + "." + extension;

		File makeFileFolder = new File(filePath);
		if (!makeFileFolder.exists()) {
			if (!makeFileFolder.mkdir()) {
				throw new Exception("File.mkdir():Fail.");
			}
		}

		File dest = new File(filePath, logo);
		try {
			Files.copy(file.getInputStream(), dest.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}

		updateDto.setCompanyLogo(logo);
		companyService.updateCompany(id, updateDto);
		return new CMRespDto<>(1, "기업정보 수정완료", logo);
	}

	@DeleteMapping("/company/delete/{id}")
	public @ResponseBody CMRespDto<?> delete(@PathVariable Integer id) {
		companyService.deleteCompany(id);
		return new CMRespDto<>(1, "기업정보 삭제 완료", null);
	}

	@PostMapping("/company/login")
	public @ResponseBody CMRespDto<?> login(@RequestBody LoginDto loginDto, HttpServletRequest request) {
		ResCompanyDto result = companyService.로그인(loginDto);

		if (result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("companyPrincipal", result.getCompany());
			session.setAttribute("subscribeList", result.getSubscribe());
		}
		return new CMRespDto<>(1, "1", result.getCompany());
	}

	@GetMapping("/company/mypage")
	public String viewMypage(@RequestParam Integer id, Model model) {
		Integer countApply = companyService.지원목록보기(id).size();
		if (companyService.지원목록보기(id) == null) {
			countApply = 0;
		}

		model.addAttribute("countApply", countApply);
		model.addAttribute("company", companyService.getCompanyDetail(id));
		model.addAttribute("recruitList", companyService.채용공고리스트불러오기(id));
		return "page/user/mypage";
	}

	@GetMapping("/company/{companyId}/applyList")
	public String applyList(@PathVariable Integer companyId, Model model) {
		model.addAttribute("apply", companyService.지원목록보기(companyId));
		return "page/company/applyList";
	}

}
