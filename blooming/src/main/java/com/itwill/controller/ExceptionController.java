package com.itwill.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
   @ExceptionHandler(Exception.class)
   public String exceptionHandler(Exception exception) {
      exception.printStackTrace();//���ܸ� �α����Ͽ� ���
      return "error/error";
   }
}