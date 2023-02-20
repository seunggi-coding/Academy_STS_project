package com.cos.farm.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.farm.model.Inquirys;

public interface InquiryRepository extends JpaRepository<Inquirys, Integer> {
	@Modifying
	@Query("update Inquirys p set p.count = p.count + 1 where p.id = :id")
	int updateCount(int id);

	Page<Inquirys> findByTitleContaining(String keyword, Pageable pageable);
}