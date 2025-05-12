package org.example.project_app_backend.Services;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.MailException;

@Service
public class EmailService {

    private static final Logger logger = LoggerFactory.getLogger(EmailService.class);

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendRegistrationEmail(String toEmail, String name) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(toEmail);
            message.setSubject("Welcome to Project App!");
            message.setText("Hello " + name + ",\n\nThank you for registering with us.\n\n- Project App Team");
            mailSender.send(message);
            logger.info("Registration email sent to {}", toEmail);
        } catch (MailException e) {
            logger.error("Failed to send registration email to {}: {}", toEmail, e.getMessage(), e);
        }
    }

    public void sendLoginNotification(String toEmail, String name) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(toEmail);
            message.setSubject("Login Alert");
            message.setText("Hi " + name + ",\n\nYou have successfully logged in.\n\n- Project App Team");
            mailSender.send(message);
            logger.info("Login notification sent to {}", toEmail);
        } catch (MailException e) {
            logger.error("Failed to send login notification to {}: {}", toEmail, e.getMessage(), e);
        }
    }
}