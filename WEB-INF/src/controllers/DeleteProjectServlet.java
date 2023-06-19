package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import models.Project;
import models.User;

@WebServlet("/delet_project.do")
public class DeleteProjectServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        System.out.println("delete pro called-1");
        
        if(user != null){
            System.out.println("delete pro called-2");
            Integer projectId = Integer.parseInt(request.getParameter("project_id"));
            System.out.println("delete pro called-3");
            
            
            String resp = "false";
            
            if(Project.deleteProject(projectId)) {
                resp = "true";
                System.out.println("delete pro called-4");
            }
            
            System.out.println("delete pro ended");
            response.getWriter().write(resp);
        }
    }
}
