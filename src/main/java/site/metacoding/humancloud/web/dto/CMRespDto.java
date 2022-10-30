package site.metacoding.humancloud.web.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CMRespDto<T> {
	private Integer code;
	private String msg;
	private T data;
}
