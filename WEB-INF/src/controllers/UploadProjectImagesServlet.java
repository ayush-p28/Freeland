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
import models.Post;
import models.ProjectImage;
import models.User;

@WebServlet("/upload_images.do")
public class UploadProjectImagesServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        Integer projectNumber = (Integer)session.getAttribute("project_number");
        Post posts = new Post();

        if(user != null) {
            String imageFolderPath = user.getEmail()+"/projects/"+projectNumber;
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+imageFolderPath);
            String fileNames = FileUpload.uploadFile(request, uploadPath);
            
            ProjectImage.saveProjectImage(fileNames, imageFolderPath, projectNumber);
        }else{
            response.sendRedirect("static/html/chor.html");
        }
    }
}

