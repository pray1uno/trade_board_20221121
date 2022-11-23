package com.its.tradeboard.Service;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.Repository.TradeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TradeService {
    @Autowired
    private TradeRepository tradeRepository;

    public List<ItemDTO> salesList(String userId) {
        return tradeRepository.salesList(userId);
    }
}
