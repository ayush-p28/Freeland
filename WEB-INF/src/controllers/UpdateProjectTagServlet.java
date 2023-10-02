package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/update_project_tags.do")
public class UpdateProjectTagServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user!=null){
            ArrayList<Integer> tagz = (ArrayList<Integer>)session.getAttribute("tagz");
            
            tagz.add(Integer.parseInt(request.getParameter("tag_id")));
            System.out.println(tagz);
        }else{
            response.sendRedirect("static/html/chor.html");
        }
    }
}
