package com.learn.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.learn.edu.entity.UserRole;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer>{

}
