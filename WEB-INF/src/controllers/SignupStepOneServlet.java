package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import utils.EmailSender;
import utils.EmailTemplate;
import utils.SMSSender;
import utils.SMSTemplates;
import utils.Utility;

import java.io.*;

import models.User;
import models.UserType;

@WebServlet("/signup_step_1.do")
public class SignupStepOneServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();
        
        String gResponse = request.getParameter("g-recaptcha-response");

        // G-recaptcha validation
        if(Utility.isHuman(gResponse)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Integer userType = Integer.parseInt(request.getParameter("user_type"));
            System.out.println("user_type="+userType);
            
            User user = (User)session.getAttribute("user");
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setUserType(new UserType(userType));

            // User uploads directory
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads");    
            File file = new File(uploadPath, email+"/projects");
            file.mkdirs();

            // EMAIL Sending code
            String message = EmailTemplate.getSignupSuccessMessage(name, email, user.getOtp());
            String subject = "Account Verification Mail";
            EmailSender.sendEmail(email, subject, message);
                            
            String email_acti = "Ayush";
                            
            request.setAttribute("email_activation", email_acti);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
