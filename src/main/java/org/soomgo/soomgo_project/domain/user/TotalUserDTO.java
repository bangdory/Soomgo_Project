package org.soomgo.soomgo_project.domain.user;

import lombok.Data;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;

@Data
public class TotalUserDTO {
    private UserDTO userDTO;
    private ExpertDTO expertDTO;
}
