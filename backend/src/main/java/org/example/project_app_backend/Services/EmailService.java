//package org.example.project_app_backend.Services;
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Service;
//
//@Service
//public class EmailService {
//
//    @Autowired
//    private JavaMailSender mailSender;
//
//    public void sendRegistrationEmail(String toEmail, String name) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(toEmail);
//        message.setSubject("Welcome to Project App!");
//        message.setText("Hello " + name + ",\n\nThank you for registering with us.\n\n- Project App Team");
//        mailSender.send(message);
//    }
//
//    public void sendLoginNotification(String toEmail, String name) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(toEmail);
//        message.setSubject("Login Alert");
//        message.setText("Hi " + name + ",\n\nYou have successfully logged in.\n\n- Project App Team");
//        mailSender.send(message);
//    }
//}
