package com.arexe.bgames.repository;

import com.arexe.bgames.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    User findUserById(int id);
    User findUserByEmail(String email);
    User findUserByLogin(String login);

    @Modifying
    @Query("UPDATE User SET password=:newPassword WHERE email=:email")
    void updateUserPassword(@Param("newPassword") String newPassword, @Param("email") String email);

    @Modifying
    @Query("UPDATE User SET login=:login, firstName=:firstName, lastName=:lastName WHERE email=:email")
    void updateUserProfile(@Param("login") String login, @Param("firstName") String firstName, @Param("lastName") String lastName, @Param("email") String email);

    @Modifying
    @Query("UPDATE User SET imagePath=:imagePath WHERE email=:email")
    void updateUserImage(@Param("imagePath") String imagePath, @Param("email") String email);

    @Modifying
    @Query("UPDATE User SET active=:active WHERE activationToken=:activationToken AND id=:id")
    void updateActiveStatus(@Param("id") int id, @Param("active") int active, @Param("activationToken") String activationToken);
}
