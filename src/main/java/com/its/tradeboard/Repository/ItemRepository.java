package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.BoardDTO;
import com.its.tradeboard.DTO.ItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ItemRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<ItemDTO> itemList(Map<String, Integer> pagingParam) {
        return sql.selectList("Item.itemList", pagingParam);

    }

    public int itemCount() {
        return sql.selectOne("Item.itemCount");
    }

    public ItemDTO itemUpload(ItemDTO itemDTO) {
        sql.insert("Item.itemUpload", itemDTO);
        return itemDTO;
    }

    public List<ItemDTO> uploadList() {
        return sql.selectList("Item.uploadList");
    }

}
