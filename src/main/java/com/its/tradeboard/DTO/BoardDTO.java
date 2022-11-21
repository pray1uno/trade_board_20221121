package com.its.tradeboard.DTO;

import lombok.*;

import java.security.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
    private Long id;
    private String itemName;
    private int itemCount;
    private int itemUnitPrice;
    private int itemPricePerPiece;
    private Timestamp registrationTime;
}
