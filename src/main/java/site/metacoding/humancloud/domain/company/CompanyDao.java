package site.metacoding.humancloud.domain.company;

import java.util.List;

import site.metacoding.humancloud.web.dto.response.page.PagingDto;

public interface CompanyDao {
	public void save(Company company);

	public Company findById(Integer id);

	public List<Company> findAll(int startNum);

	public void update(Company company);

	public void deleteById(Integer id);

	public Company findByUsername(String companyUsername);

	public Company findAllUsername(String companyUsername);

	public PagingDto paging(Integer page);
}
