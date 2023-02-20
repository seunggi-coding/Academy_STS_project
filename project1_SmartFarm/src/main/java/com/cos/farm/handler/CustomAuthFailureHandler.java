package com.cos.farm.handler;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@Component
public class CustomAuthFailureHandler   extends SimpleUrlAuthenticationFailureHandler {

        @Override
        public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                            AuthenticationException exception) throws IOException, ServletException {
            String Msg ="";

            if (exception instanceof BadCredentialsException) {
                Msg = "You have no Account";
            } else if (exception instanceof InternalAuthenticationServiceException) {
                Msg = "You have no Account";
            } else if (exception instanceof UsernameNotFoundException) {
                Msg = "You have no Account";
            } else if (exception instanceof AuthenticationCredentialsNotFoundException) {
                Msg = "You have no Account";
            } else {
                Msg = "You have no Account";
            }
            Msg = URLEncoder.encode(Msg, "UTF-8");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/auth/loginForm");
            dispatcher.forward(request, response);

        }
    }

