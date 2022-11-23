package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.ItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TradeRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<ItemDTO> salesList(String userId) {
        return sql.selectList("Trade.salesList", userId);
    }
}
