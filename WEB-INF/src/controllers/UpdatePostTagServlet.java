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

@WebServlet("/update_post_tags.do")
public class UpdatePostTagServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user!=null){
            ArrayList<Integer> post_tagz = (ArrayList<Integer>)session.getAttribute("post_tagz");
            
            post_tagz.add(Integer.parseInt(request.getParameter("tag_id")));
            System.out.println(post_tagz);
        }else{
            response.sendRedirect("static/html/chor.html");
        }
    }
}
