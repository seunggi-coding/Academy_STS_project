package com.cos.farm.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.farm.dto.ResponseDto;
import com.cos.farm.model.Users;
import com.cos.farm.service.UserService;

@RestController
public class UserApiController {
	@Autowired
	private UserService userService;

	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody Users user) {
		System.out.println("UserApiController호출됨");
		System.out.println("api" + user);

		userService.회원가입(user);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/auth/joinProc2")
	public ResponseDto<Integer> save2(@RequestBody Users user) {
		System.out.println("UserApiController호출됨");
		System.out.println("api" + user);
		
		userService.회원가입2(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody Users user) {
		userService.회원수정(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/user")
	public ResponseDto<Integer> idSearch(@RequestBody Users user) {
		userService.아이디찾기(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/auth/user/find/pwd")
	public ResponseDto<Integer> temporaryPwd(@RequestBody Users user) {
		System.out.println("temporaryPwd 호출 "+user.getUserid());
		userService.비밀번호재설정(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}