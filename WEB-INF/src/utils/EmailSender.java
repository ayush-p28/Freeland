package utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;

public class EmailSender {
    static Properties props = new Properties();

    public static void setProperties(String host, String port) {
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
    }

    public static void sendEmail(String to, String subject, String msg) {
        
        Session session = Session.getInstance(props, new MailAuthenticator());

        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom("ayushkachhip28@outlook.com");
            message.setRecipients(Message.RecipientType.TO, to);
            message.setSubject(subject);
            message.setContent(msg, "text/html");

            Transport.send(message);
        } catch(MessagingException e) {
            e.printStackTrace();
        }

    }
}


class MailAuthenticator extends Authenticator {
    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("ayushkachhip28@outlook.com", "Pranav@123");
    }
}