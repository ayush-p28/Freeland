package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.FileUpload;

import models.User;

@WebServlet("/upload_logo.do")
public class UploadLogoServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if(user != null) {
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+user.getEmail());

            String fileName = FileUpload.uploadFile(request, uploadPath);
            
            user.setLogo(user.getEmail()+"/"+fileName);

            System.out.println(user.getLogo());
            System.out.println("save called-1");
            boolean flag = user.saveUser();
            System.out.println(flag);
            System.out.println("save called-2");
        }else{
            response.sendRedirect("static/html/chor.html");
        }
    }
}