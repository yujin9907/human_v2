package site.metacoding.humancloud.dto.response.recruit;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Getter
@Setter
public class CompanyRecruitDto {
    private Integer companyId;
    private String companyUsername;
    private String companyPassword;
    private String companyName;
    private String companyEmail;
    private String companyPhoneNumber;
    private String companyAddress;
    private String companyLogo;
    private Timestamp companyCreatedAt;

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
}
