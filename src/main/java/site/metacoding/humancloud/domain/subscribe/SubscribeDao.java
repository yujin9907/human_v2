package site.metacoding.humancloud.domain.subscribe;

import site.metacoding.humancloud.domain.company.Company;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SubscribeDao {
	public void save(Subscribe subscribe);
	public Subscribe findById(@Param("userId") Integer userId, @Param("companyId") Integer companyId);
	public List<Subscribe> findAll();
	public void update(Subscribe subscribe);
	public void deleteById(Integer id);

	public List<Company> findCompanyByUserId(Integer userId);
	public List<Subscribe> findByCompanyId(Integer companyId);
	public void deleteByUserCompany(@Param("userId") Integer userId, @Param("companyId") Integer companyId);
}