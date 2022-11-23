package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.ItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class TradeRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<ItemDTO> salesList(String userId) {
        return sql.selectList("Trade.salesList", userId);
    }

    public int cancel(Long id) {
        return sql.delete("Trade.cancel", id);
    }

    public List<ItemDTO> salesPaging(Map<String, Integer> pagingParam2) {
        return sql.selectList("Trade.salesPaging", pagingParam2);
    }

    public int salesCount() {
        return sql.selectOne("Trade.salesCount");
    }

}
