package site.metacoding.humancloud.dto.dummy.response.recruit;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.humancloud.domain.category.Category;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.domain.recruit.Recruit;

@Getter
@Setter
public class RecruitDetail {
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

    private void setRecruitCreatedAt(Timestamp recruitCreatedAt) {
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
        String t = form.format(recruitCreatedAt);
        this.recruitStartDay = t;
    }

    private List<String> recruitCategoryList;

    private Company company;
    private List<Category> category;
    private List<Recruit> recruitListByCompanyId;
}
