package com.its.tradeboard.Repository;

import com.its.tradeboard.DTO.AdminDTO;
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

    public UserDTO login(UserDTO userDTO) {
        return sql.selectOne("User.login", userDTO);
    }

    public AdminDTO adminLogin(UserDTO userDTO) {
        return sql.selectOne("Admin.adminLogin", userDTO);
    }
}
