package org.soomgo.soomgo_project.service;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;

public interface
EmailService {
    String sendValidationEmail(String email) throws MessagingException, UnsupportedEncodingException;
    boolean validateToken(String token);
    void sendResetPasswordEmail(String email) throws MessagingException, UnsupportedEncodingException;
}
