package com.cos.farm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.farm.dto.NoticeDto;
import com.cos.farm.model.Inquirys;
import com.cos.farm.model.Notices;
import com.cos.farm.model.Users;
import com.cos.farm.repository.NoticeRepository;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;

	@Transactional
	public void Notice_글쓰기(Notices notice, Users user) {
		notice.setCount(0);
		notice.setUsers(user);
		noticeRepository.save(notice);
	}

	@Transactional(readOnly = true)
	public Page<Notices> Notice_글목록(Pageable pageable) {
		return noticeRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Notices Notice_글상세보기(int id) {
		return noticeRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
	}

	@Transactional
	public void Notice_글삭제하기(int id) {
		noticeRepository.deleteById(id);
	}

	@Transactional
	public void Notice_글수정하기(int id, Notices requestBoard) {
		Notices notice = noticeRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		notice.setTitle(requestBoard.getTitle());
		notice.setContent(requestBoard.getContent());
	}

	// 조회수 증가
	@Transactional
	public void updateCount(int id) {
		// TODO Auto-generated method stub
		noticeRepository.updateCount(id);
	}

	// 게시글 검색 기능

	@Transactional
	public Page<Notices> searchPosts(String keyword, Pageable pageable) {
		return noticeRepository.findByTitleContaining(keyword, pageable);

	}

	private NoticeDto convertEntityToDto(Notices notice) {
		return NoticeDto.builder().id(notice.getId()).title(notice.getTitle()).content(notice.getContent())
				.users(notice.getUsers()).createDate(notice.getCreateDate()).count(notice.getCount()).build();
	}
}