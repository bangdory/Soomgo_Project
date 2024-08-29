package org.soomgo.soomgo_project;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(DataIntegrityViolationException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ResponseBody
    public ErrorResponse handlerDataIntegrityViolationException (DataIntegrityViolationException ex) {
        // DB 무결성 제약 조건에 위반되는 경우 발생
        return new ErrorResponse("DataIntegrityViolationException 발생 - DB 무결성 제약 조건이 맞지 않습니다.", ex.getMessage());
    }


    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ResponseBody
    public ErrorResponse handlerNoHandlerFoundException (NoHandlerFoundException ex) {
        // 요청된 URL 에 대한 핸들러가 없는 경우 발생
        return new ErrorResponse("RESOURCE_NOT_FOUND - 요청된 URL 에 대한 핸들러가 없습니다.", ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ResponseBody
    public ErrorResponse handleException(Exception ex) {
        // 그 외 예외 발생
        return new ErrorResponse("Exception - 에러 발생", ex.getMessage());
    }

}

