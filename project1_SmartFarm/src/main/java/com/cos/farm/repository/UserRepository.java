package com.cos.farm.repository;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.farm.model.Users;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Users,Integer>{

   Optional<Users> findByUserid(String userid);
   Optional<Users> findByUsernameAndEmail(String username, String email);

   Optional<Users> findByUseridAndEmail(String userid, String email);
   Optional<Users> findByEmail(String email);
}