package com.its.tradeboard.DTO;

import lombok.*;

import java.sql.Timestamp;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
    private Long id;
    private String itemCategory_upload;
    private String itemName_upload;
    private int itemCount_upload;
    private String itemUnitPrice_upload;
    private String itemBargain_upload;
    private String itemSalesUser_upload;
    private Timestamp registrationTime;

    private Long itemId;
    private Long usersId;
}
