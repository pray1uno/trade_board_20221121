package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.ItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class SearchRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<ItemDTO> searchSale(Map<String, String> searchParam) {
        System.out.println("searchParam = " + searchParam);
        return sql.selectList("Item.searchSale", searchParam);
    }
}
