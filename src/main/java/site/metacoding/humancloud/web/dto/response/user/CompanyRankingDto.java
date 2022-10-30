package site.metacoding.humancloud.web.dto.response.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanyRankingDto {
    private Integer ranking;
    private Integer likes;
    private String name;
    private String logo;
}
