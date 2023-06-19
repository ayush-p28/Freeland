package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

import models.User;

@WebServlet("/check_otp.do")
public class CheckOtpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();
        
        // Parameters
        String otp = request.getParameter("otp");

        User user = (User)session.getAttribute("user");

        System.out.println("yaha bhi sahi hai"+otp+"user wala"+user.getOtp());

        String resp = "false";

        if(otp.equals(user.getOtp())) {
            resp = "true";
        }

        response.getWriter().write(resp);
    }
}