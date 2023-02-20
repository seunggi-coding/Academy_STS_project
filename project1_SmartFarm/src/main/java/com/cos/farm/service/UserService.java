package com.cos.farm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.farm.model.RoleType;
import com.cos.farm.model.Users;
import com.cos.farm.repository.UserRepository;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해준다. Ioc를 해준다.
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Transactional
	public void 회원가입(Users user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRoles(RoleType.USER);
		userRepository.save(user); // 하나의 트랜젝션
	}

	@Transactional
	public void 회원가입2(Users user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRoles(RoleType.ADMIN);
		userRepository.save(user); // 하나의 트랜젝션
	}

	@Transactional
	public void 회원수정(Users user) {
		Users persistence = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("회원찾기실패");
		});
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		persistence.setPassword(encPassword);
		persistence.setEmail(user.getEmail());
		persistence.setPhonenumber(user.getPhonenumber());

	}

	@Transactional
	public String 아이디찾기(Users user) {
		Users persistence = userRepository.findByUsernameAndEmail(user.getUsername(), user.getEmail())
				.orElseThrow(() -> {
					System.out.println(user.getUsername());
					System.out.println(user.getEmail());
					return new IllegalArgumentException("회원 정보를 찾을 수 없습니다.");
				});

		return persistence.getUserid();
	}

	@Transactional
	public void 비밀번호재설정(Users user) {

		Users persistence = userRepository.findByUserid(user.getUserid()).orElseThrow(() -> {
			return new IllegalArgumentException("회원찾기실패");
		});
		
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		persistence.setPassword(encPassword);
	}

}
