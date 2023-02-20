package com.cos.farm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.farm.model.Inquirys;
import com.cos.farm.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer> {
	List<Reply> findByinquirys(Inquirys inquirys);
}