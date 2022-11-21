package com.its.tradeboard.DTO;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class WishDTO {
    private String wishCategory;
    private String wishName;
    private int wishUnitPrice;
    private String wishSalesUserName;
    private String wishBargain;
    private Long itemId;
    private Long usersId;
}
