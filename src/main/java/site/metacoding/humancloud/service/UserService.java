package site.metacoding.humancloud.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.domain.resume.Resume;
import site.metacoding.humancloud.domain.resume.ResumeDao;
import site.metacoding.humancloud.domain.subscribe.SubscribeDao;
import site.metacoding.humancloud.domain.user.User;
import site.metacoding.humancloud.domain.user.UserDao;
import site.metacoding.humancloud.dto.request.user.JoinDto;
import site.metacoding.humancloud.dto.request.user.LoginDto;
import site.metacoding.humancloud.dto.response.user.CompanyRankingDto;

@RequiredArgsConstructor
@Service
public class UserService {
    private final UserDao userDao;
    private final ResumeDao resumeDao;
    private final SubscribeDao subscribeDao;

    public List<Company> 구독기업보기(Integer userId) {
        return subscribeDao.findCompanyByUserId(userId);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public void 회원탈퇴(Integer id) {
        List<Resume> resumes = resumeDao.findByUserId(id);
        if (resumes != null) {

            resumeDao.deleteByUserId(id);

        }
        userDao.deleteById(id);
    }

    public void 회원업데이트(Integer id, JoinDto joinDto) {
        User userPS = userDao.findById(id);
        userPS.updateToEntity(joinDto.getPassword(), joinDto.getName(), joinDto.getEmail(), joinDto.getPhoneNumber());
        userDao.update(id, userPS);
    }

    public void 회원가입(JoinDto joinDto) {
        boolean checkUsername = 유저네임중복체크(joinDto.getUsername());
        if (checkUsername == true) {
            userDao.save(joinDto);
        }
    }

    public boolean 유저네임중복체크(String username) {
        User userPS = userDao.findAllUsername(username);
        if (userPS == null) {
            return true;
        } else {
            return false;
        }
    }

    public User 로그인(LoginDto loginDto) {
        User userPS = userDao.findByUsername(loginDto.getUsername());
        if (userPS == null) {
            return null;
        }
        if (loginDto.getPassword().equals(userPS.getPassword())) {
            return userPS;
        }
        return null;
    }

    // 서비스 내에서 사용하는 메서드

    public User 유저정보보기(Integer userId) {
        // 유저 정보
        User userPS = userDao.findById(userId);

        // 전화번호 포매팅
        String fomat = "(\\d{3})(\\d{3,4})(\\d{4})";
        if (Pattern.matches(fomat, userPS.getPhoneNumber())) {
            String result = userPS.getPhoneNumber().replaceAll(fomat, "$1-$2-$3");
            userPS.toPhoneNumber(result);
        }
        return userPS;
        // 이력서보기
        // int Count
    }

    public Map<String, Object> 이력서보기(Integer userId) {
        // 열람 횟수 보기(리절트 타입 인트면 좋음)

        // 이력서 목록보기 (제목, 등록카테고리, 날짜 정도 필요)
        try {
            Integer countResume = resumeDao.sumReadCount(userId).getResumeReadCount();

            List<Resume> resumePS = resumeDao.findByUserId(userId); // 리절트 타입 : resume

            Map<String, Object> result = new HashMap<>();
            result.put("readCount", countResume);
            result.put("resume", resumePS);

            return result;
        } catch (NullPointerException e) {
            Map<String, Object> result = new HashMap<>();
            result.put("readCount", 0);
            result.put("resume", null);

            return result;
        }

    }

    public List<CompanyRankingDto> 추천기업목록보기() {
        for (CompanyRankingDto c : userDao.findByRank()) {
            System.out.println(c.getName());
        }
        return userDao.findByRank();
    }
    // public List<String> 관심분야목록(Integer userId){
    // List<Category> categoryPS = categoryDao.findByUserId(userId);
    // List<String> categoryName = new ArrayList<>();
    // for(Category c : categoryPS){
    // categoryName.add( c.getCategoryName());
    // }
    // return categoryName;
    // }

    // public List<Company> 기업매칭리스트(List<String> categories){ // userid에 해당하는
    // category name 리스트
    // List<Company> companyList = new ArrayList<>();
    // for(String c : categories){
    // Company companies = categoryDao.findByCompanyCategory(c);
    // companyList.add(companies);
    // }
    // return companyList;
    // }
}
