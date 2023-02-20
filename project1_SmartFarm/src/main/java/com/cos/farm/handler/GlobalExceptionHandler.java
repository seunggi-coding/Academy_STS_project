package com.cos.farm.handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.cos.farm.dto.ResponseDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

	@ExceptionHandler(value = IllegalArgumentException.class)
	public void handleArgumentException(HttpServletRequest request, HttpServletResponse response,
			IllegalArgumentException e) throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/auth/loginForm");
		dispatcher.forward(request, response);

	}
}