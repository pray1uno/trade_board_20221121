package com.its.tradeboard.DTO;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class AdminDTO {
    private Long id;
    private String adminId;
    private String adminPassword;
    private String adminName;
}
