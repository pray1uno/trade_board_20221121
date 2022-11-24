package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<UserDTO> userList() {
        return sql.selectList("Admin.userList");
    }
}
