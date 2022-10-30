package site.metacoding.humancloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

import site.metacoding.humancloud.domain.apply.ApplyDao;
import site.metacoding.humancloud.domain.resume.Resume;
import site.metacoding.humancloud.domain.resume.ResumeDao;
import site.metacoding.humancloud.web.dto.request.apply.SaveDto;

@RequiredArgsConstructor
@Service
public class ApplyService {

  private final ApplyDao applyDao;
  private final ResumeDao resumeDao;

  public List<Resume> 이력서목록보기(Integer userId) {
    List<Resume> resumes = resumeDao.findByUserId(userId);
    return resumes;
  }

  public void 기업공고에지원하기(SaveDto saveDto) {
    applyDao.save(saveDto);
  }

  public void 기업공고지원취소(Integer recruitId, Integer resumeId) {
    applyDao.deleteById(recruitId, resumeId);
  }

  public void 지원유저목록보기(Integer companyId){
    
  }

}
