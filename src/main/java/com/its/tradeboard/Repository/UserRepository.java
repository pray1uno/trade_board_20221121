package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(UserDTO userDTO) {
        return sql.insert("User.insert", userDTO);
    }
}
