package site.metacoding.humancloud.domain.recruit;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import site.metacoding.humancloud.domain.category.Category;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.web.dto.request.recruit.SaveDto;

@NoArgsConstructor
@Getter
@Setter
public class Recruit {
	private Integer recruitId;
	private String recruitTitle;
	private String recruitCareer;
	private Integer recruitSalary;
	private String recruitLocation;
	private String recruitContent;
	private Integer recruitReadCount;
	private Integer recruitCompanyId;
	private String recruitDeadline;
	private Timestamp recruitCreatedAt;
	private String recruitStartDay;

	public void setRecruitCreatedAt(Timestamp recruitCreatedAt) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		String t = form.format(recruitCreatedAt);
		this.recruitStartDay = t;
	}

	private List<String> recruitCategoryList;

	private Company company;
	private List<Category> category;
	private List<Recruit> recruitListByCompanyId;

	public Recruit(String recruitTitle) {
		this.recruitTitle = recruitTitle;
	}

	public void recruitUpdate(SaveDto saveDto) {
		this.recruitTitle = saveDto.getRecruitTitle();
		this.recruitCareer = saveDto.getRecruitCareer();
		this.recruitSalary = saveDto.getRecruitSalary();
		this.recruitLocation = saveDto.getRecruitLocation();
		this.recruitContent = saveDto.getRecruitContent();
	}

}
