package org.soomgo.soomgo_project.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

    private static final Logger log = LoggerFactory.getLogger(MailConfig.class);
    private final String userName = "bangdory3145@gmail.com";

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        log.info("mailSender: " + mailSender);
        mailSender.setHost("smtp.gmail.com"); // 메일 서버 호스트
        mailSender.setPort(587); // 메일 서버 포트


        // 이부분 수정
        mailSender.setUsername(userName); // 메일 서버 사용자명
        mailSender.setPassword("tqys endi foit dazy"); // 메일 서버 비밀번호


        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true"); // 디버그 모드

        return mailSender;
    }

    public String getUsername() {
        return userName;
    }
}
