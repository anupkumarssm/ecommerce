package com.learn.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.learn.edu.entity.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer>{

}
