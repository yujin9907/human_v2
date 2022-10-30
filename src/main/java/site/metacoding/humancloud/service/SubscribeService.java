package site.metacoding.humancloud.service;

import lombok.RequiredArgsConstructor;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.domain.subscribe.Subscribe;
import site.metacoding.humancloud.domain.subscribe.SubscribeDao;

import java.util.List;

@RequiredArgsConstructor
@Service
public class SubscribeService {

    private final SubscribeDao subscribeDao;

    public void 구독취소(@Param("userId") Integer userId, @Param("companyId") Integer companyId){
        subscribeDao.deleteByUserCompany(userId, companyId);
    }

    public boolean 구독확인( Integer userId, Integer companyId){
        if(subscribeDao.findById(userId, companyId)==null){
            System.out.println("==========================");
            System.out.println("구독안함");
            System.out.println("==========================");
            return false;
        }
        System.out.println("==========================");
        System.out.println("구독함");
        System.out.println("==========================");
        return true;
    }

    public boolean 구독하기(Subscribe subscribe){
        if(구독확인(subscribe.getSubscribeUserId(), subscribe.getSubscribeCompanyId())==false){
            subscribeDao.save(subscribe);
            return true;
        }
        return false;
    }

    public List<Company> 구독기업보기(Integer userId){
        return subscribeDao.findCompanyByUserId(userId);
    }
}
