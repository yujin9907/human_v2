package site.metacoding.humancloud.dto.dummy.response.user;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import site.metacoding.humancloud.domain.company.Company;
import site.metacoding.humancloud.domain.subscribe.Subscribe;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ResCompanyDto {
    private Company company;
    private List<Subscribe> subscribe;
}
