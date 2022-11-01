package site.metacoding.humancloud.dto.dummy.request.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.humancloud.domain.apply.Apply;

@Getter
@Setter
public class SaveDto {
    private Integer applyRecruitId;
    private Integer applyResumeId;
    private Timestamp applyCreatedAt;

    public Apply toEntity(Integer applyRecruitId, Integer applyResumeId, Timestamp applyCreatedAt) {
        Apply apply = new Apply(this.applyRecruitId, this.applyResumeId, this.applyCreatedAt);
        return apply;
    }
}
