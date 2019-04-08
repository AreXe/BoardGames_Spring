package com.arexe.portal.repository;

import com.arexe.portal.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Integer> {

    User findUserByEmail(String email);
    User findUserByLogin(String login);

    @Modifying
    @Query("UPDATE User u SET u.password=:newPassword WHERE u.email=:email")
    void updateUserPassword(@Param("newPassword") String newPassword, @Param("email") String email);

}
