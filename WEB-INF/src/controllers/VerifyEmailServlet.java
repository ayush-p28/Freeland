package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

// import models.Operator;
import models.User;

@WebServlet("/signup_verify.do")
public class VerifyEmailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("user");

        String email = request.getParameter("email");
        String otp = request.getParameter("otp");

        if(user.getEmail().equals(email) && user.getOtp().equals(otp)) {
            request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
        }
    }
}