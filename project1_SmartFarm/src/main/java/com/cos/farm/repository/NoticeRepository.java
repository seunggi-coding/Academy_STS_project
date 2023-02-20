package com.cos.farm.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.farm.model.Notices;

public interface NoticeRepository extends JpaRepository<Notices, Integer> {
   @Modifying
   @Query("update Notices p set p.count = p.count + 1 where p.id = :id")
   int updateCount(int id);

//   List<Notices> findByTitleContaining(String keyword, Pageable pageable);
   Page<Notices> findByTitleContaining(String keyword, Pageable pageable);
}