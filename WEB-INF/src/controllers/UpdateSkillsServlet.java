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

import models.FreelancerSkill;
import models.User;

@WebServlet("/update_free_skills.do")
public class UpdateSkillsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user!=null){
            String queryString = request.getQueryString();
            if(queryString!=null){
                ArrayList<Integer> free_skillz = (ArrayList<Integer>)session.getAttribute("free_skillz");
                
                free_skillz.add(Integer.parseInt(request.getParameter("tag_id")));
                System.out.println(free_skillz);
            }else{
                System.out.println("utha liya");
                ArrayList<String> all_skillz = FreelancerSkill.collectAllSkills();
                Gson gson = new Gson();
                String resp = gson.toJson(all_skillz);


                response.getWriter().write(resp);
            }
        }else{
            response.sendRedirect("static/html/chor.html");
        }
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user!=null){
            ArrayList<Integer> tagz = (ArrayList)session.getAttribute("free_skillz");
            
            FreelancerSkill freeSkillz = new FreelancerSkill(new User(user.getUserId()));
            for(Integer tags: tagz){
                System.out.println(tags);
                freeSkillz.saveFreeSkills(tags);
            }
        }else{
            response.sendRedirect("static/html/chor.html");
        }
    }
}
