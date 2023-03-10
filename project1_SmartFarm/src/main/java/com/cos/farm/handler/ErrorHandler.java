package com.cos.farm.handler;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorHandler implements ErrorController {


    @GetMapping("/error")
    public String handleError(HttpServletRequest request){
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if(null != status){
            int statusCode = Integer.valueOf(status.toString());
            if(statusCode == HttpStatus.FORBIDDEN.value()){
                return "error_500";
            }else if(statusCode == HttpStatus.NOT_FOUND.value()){
                return "error_404";
            }
        }
        return "error";
    }


    public String getErrorPath() {
        // TODO Auto-generated method stub
        return "/findIdResultFail";
    }

}