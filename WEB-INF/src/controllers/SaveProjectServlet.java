package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.PostStatus;
import models.Project;
import models.ProjectTag;
import models.Subcategory;
import models.User;

@WebServlet("/save_project.do")
public class SaveProjectServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        ArrayList<Integer> tagz = (ArrayList)session.getAttribute("tagz");

        System.out.println("save called");
        
        // authorisation
        if(user != null){
            // parameters
            String userData = request.getParameter("project_data");
            String project_id = request.getParameter("project_id");

            Gson gson = new Gson();
            Project project = gson.fromJson(userData, Project.class);
            System.out.println(project.getSubcategory().getCategory().getCategoryId()+"background project saving");
        
            if(project_id == ""){
                project.saveProject(new User(user.getUserId()));
            }

            session.setAttribute("project_number", project.getProjectId());

            ProjectTag projectTag = new ProjectTag(new Project(project.getProjectId()));
            for(Integer tags: tagz){
                System.out.println(tags);
                projectTag.saveProjectTag(tags);
            }
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+user.getEmail()+"/projects");
            File file = new File(uploadPath,Integer.toString(project.getProjectId()));
            file.mkdir();
            
            System.out.println("save project");
            // Project project = new Project(new User(user.getUserId()), new Subcategory(subcategoryId), new PostStatus(1), title, description, ptitle, pdescription, delivery, revisions, price);
        }else{
            response.sendRedirect("static/html/chor.html");
        }
        response.getWriter().write("chal r h");
    }    
}