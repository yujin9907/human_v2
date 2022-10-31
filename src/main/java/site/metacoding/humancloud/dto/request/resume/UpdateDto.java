package site.metacoding.humancloud.dto.request.resume;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateDto {
  private Integer resumeId;
  private String resumeTitle;
  private String resumeEducation;
  private String resumeCareer;
  private String resumePhoto;
  private String resumeLink;
  private List<String> categoryList;

  public UpdateDto() {

  }

  public UpdateDto(Integer resumeId, String resumeTitle, String resumeEducation, String resumeCareer,
      String resumePhoto, String resumeLink, List<String> categoryList) {
    this.resumeId = resumeId;
    this.resumeTitle = resumeTitle;
    this.resumeEducation = resumeEducation;
    this.resumeCareer = resumeCareer;
    this.resumePhoto = resumePhoto;
    this.resumeLink = resumeLink;
    this.categoryList = categoryList;
  }

}
