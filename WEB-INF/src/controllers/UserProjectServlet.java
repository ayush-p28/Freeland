package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Project;
import models.User;

@WebServlet("/user_project.do")
public class UserProjectServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        String nextPage = "index.jsp";

        // authrisation
        if(user != null) {
            ArrayList<Project> projects = Project.collectUserProjects(user.getUserId());
            request.setAttribute("projects", projects);

            nextPage = "user_posts.jsp";
        }else{
            response.sendRedirect("static/html/chor.html");
        }   
        request.getRequestDispatcher(nextPage).forward(request, response); 
    }
}