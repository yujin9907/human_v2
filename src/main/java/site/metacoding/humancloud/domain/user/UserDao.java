package site.metacoding.humancloud.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.metacoding.humancloud.dto.request.user.JoinDto;
import site.metacoding.humancloud.dto.response.user.CompanyRankingDto;

public interface UserDao {
	public int save(JoinDto joinDto);

	public User findById(Integer id);

	public List<User> findAll();

	public int update(@Param("id") Integer id, @Param("user") User user);

	public int deleteById(Integer userId);

	public User findByUsername(String username);

	public User findAllUsername(String username);

	public List<CompanyRankingDto> findByRank();

}
