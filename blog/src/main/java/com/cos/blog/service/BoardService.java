package com.cos.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.Boards;
import com.cos.blog.model.Users;
import com.cos.blog.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	
	@Transactional
	public void 글쓰기(Boards board, Users user) {
		board.setCount(0);
		board.setUsers(user);
		boardRepository.save(board);
	}
	
	@Transactional(readOnly=true)
	public Page<Boards> 글목록(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	@Transactional(readOnly=true)
	public Boards 글상세보기(int id) {
		return boardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id, Boards requestBody) {
		Boards board = boardRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		board.setTitle(requestBody.getTitle());
		board.setContent(requestBody.getContent());
	}
}
