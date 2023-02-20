package com.cos.farm.handler;

import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
public class CustomFailureHandler extends SimpleUrlAuthenticationFailureHandler {

        @Override
        public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                            AuthenticationException exception) throws IOException, ServletException {
            String Msg ="";

            if (exception instanceof AuthenticationServiceException) {
                request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다.");

            } else if(exception instanceof BadCredentialsException) {
                request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.");

            } else if(exception instanceof LockedException) {
                request.setAttribute("loginFailMsg", "잠긴 계정입니다..");

            } else if(exception instanceof DisabledException) {
                request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");

            } else if(exception instanceof AccountExpiredException) {
                request.setAttribute("loginFailMsg", "만료된 계정입니다..");

            } else if(exception instanceof CredentialsExpiredException) {
                request.setAttribute("loginFailMsg", "비밀번호가 만료되었습니다.");
            }
            Msg  = request.getAttribute("loginFailMsg").toString();

            // 로그인 페이지로 다시 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("/auth/loginForm");
            dispatcher.forward(request, response);//request 홈페이지에서 서버로 보낸 값이 들어있음 . response  : 가공을 해서 홈페이지에 서버로 보낸 값 .
        }
    }

