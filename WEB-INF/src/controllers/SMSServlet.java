package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

import models.User;
import utils.SMSSender;
import utils.SMSTemplates;
import utils.Utility;

@WebServlet("/send_otp.do")
public class SMSServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();

        // Parameters
        String contact = request.getParameter("contact");

        String otp = Utility.generateOTP();
        
        System.out.println(otp);
        System.out.println(contact);

        User user = new User(otp,contact);
        session.setAttribute("user", user);


        System.out.println(user.getOtp());
        System.out.println(user.getContact());

        // SMS Sending Code
        // String smsMessage = SMSTemplates.getSignupMobileVerificationMessage(name, otp);
        // String smsMessage = SMSTemplates.getSignupMobileVerificationMessage(otp);

        // SMSSender.sendSMS(contact, smsMessage);

        System.out.println("last line of send otp");
    }
}


