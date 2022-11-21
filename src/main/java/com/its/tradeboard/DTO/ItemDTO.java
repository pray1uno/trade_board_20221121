package com.its.tradeboard.DTO;

import lombok.*;

import java.security.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ItemDTO {
    private Long id;
    private String itemCategory;
    private String itemName;
    private int itemUnitPrice;
    private String salesUserName;
    private String itemBargain;
    private Timestamp salesCreatedDate;
}
