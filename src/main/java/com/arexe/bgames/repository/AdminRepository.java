package com.arexe.bgames.repository;

import com.arexe.bgames.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminRepository extends JpaRepository<User, Integer> {

    User findUserById(int id);

    @Query(value = "SELECT * FROM app_user u WHERE u.email LIKE %:name% OR u.login LIKE %:name%", nativeQuery = true)
    List<User> findUsersByName(@Param("name") String name);

    @Query(value = "SELECT * FROM app_user u WHERE u.email LIKE %:name% OR u.login LIKE %:name%",
            countQuery = "SELECT count(*) FROM app_user u WHERE u.email LIKE %:name% OR u.login LIKE %:name%", nativeQuery = true)
    Page<User> findUsersByNamePageable(String name, Pageable pageable);

    @Modifying
    @Query("UPDATE User SET active=:active WHERE id=:id")
    void updateUserActivation(@Param("id") int id, @Param("active") int active);

    @Modifying
    @Query(value = "UPDATE user_role SET role_id=:roleNumber WHERE user_id=:id", nativeQuery = true)
    void updateUserRole(@Param("id") int id, @Param("roleNumber") int roleNumber);

    @Modifying
    @Query(value = "DELETE FROM user_role WHERE user_id=:id", nativeQuery = true)
    void deleteUserByIdFromUserRoleTable(@Param("id") int id);

    @Modifying
    @Query(value = "DELETE FROM app_user WHERE user_id=:id", nativeQuery = true)
    void deleteUserByIdFromUserTable(@Param("id") int id);
}
