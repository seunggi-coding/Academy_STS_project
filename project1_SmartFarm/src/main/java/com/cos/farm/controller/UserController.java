package com.cos.farm.controller;

import com.cos.farm.model.Users;
import com.cos.farm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

	@RequestMapping("/auth/loginForm")
	public String loginForm(HttpServletRequest request, Model model) {

		if (request.getAttribute("loginFailMsg") != null) {
			model.addAttribute("loginFailMsg", request.getAttribute("loginFailMsg"));

		}
		return "user/loginForm";
	}

	@GetMapping("/auth/findPwd")
	public String findPwd() {
		return "user/findPwd";
	}

	@GetMapping("/user/updateForm")
	public String updateForm() {
		return "user/updateForm";
	}

	@GetMapping("/auth/findId")
	public String findId() {
		return "user/findId";
	}

	@RequestMapping("/auth/findIdResult")
	public String findIdResult(Users user, Model model) {
		model.addAttribute("checkuser", userService.아이디찾기(user));

		return "user/findIdResult";
	}

}
