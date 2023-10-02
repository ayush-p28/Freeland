package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/download_image.do")
public class ImageDownloadServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user!=null){
            response.setContentType("image/png");
            
            String imagePath = request.getParameter("img_path");
    
            System.out.println("/WEB-INF/uploads/"+imagePath);
            
            InputStream is = getServletContext().getResourceAsStream("/WEB-INF/uploads/"+imagePath);
            
            System.out.println(is + " ~~");
    
            OutputStream os = response.getOutputStream();
    
            byte[] arr = new byte[1024];
            int count = 0;
            while((count = is.read(arr)) != -1) {
                os.write(arr);
            }
    
            os.close();
        }else{
            response.sendRedirect("static/html/chor.html");
        }
        
    }
}

