package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.ProjectImage;

@WebServlet("/fetch_all_images.do")
public class fetchAllImagesServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        // parameters

        Integer projectId = Integer.parseInt(request.getParameter("project_id"));
        System.out.println(projectId+"fetch Images pid");

        ArrayList<String> projectImages = ProjectImage.fetchAllImages(projectId);
        System.out.println(projectImages);
        Gson gson = new Gson();
        String resp = gson.toJson(projectImages);
        response.getWriter().write(resp);
    }
}
