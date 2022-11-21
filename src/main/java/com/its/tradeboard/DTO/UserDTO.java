package com.its.tradeboard.DTO;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO {
    private Long id;
    private String userId;
    private String userPassword;
    private String userName;
    private String userMobile;
    private int userRole;
}
