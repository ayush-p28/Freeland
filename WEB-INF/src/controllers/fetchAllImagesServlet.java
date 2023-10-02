package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.ProjectImage;
import models.User;

@WebServlet("/fetch_all_images.do")
public class fetchAllImagesServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        if(user!=null){
            Integer projectId = Integer.parseInt(request.getParameter("project_id"));
            System.out.println(projectId+"fetch Images pid");
    
            ArrayList<String> projectImages = ProjectImage.fetchAllImages(projectId);
            System.out.println(projectImages);
            Gson gson = new Gson();
            String resp = gson.toJson(projectImages);
            response.getWriter().write(resp);
        }else{
            response.sendRedirect("static/html/chor.html");
        }

    }
}

