package site.metacoding.humancloud.web.dto.socket;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDto {
      private String receiverUsername;
      private String alarmType;
      private String sender;
      private Integer senderId;
}
