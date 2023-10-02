package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.FreelancerSkill;
import models.Post;
import models.User;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User user = new User(email, password,null,null);
        
        String nextPage = "index.jsp";
        int result = user.login(); 
        int type = user.getUserType().getUserTypeId();
        // result = status_id
        

        switch(result) {
            case 1:
                session.setAttribute("user", user);
                    switch(type){
                        case 1: ArrayList<Post> posts = Post.collectUserPosts(user.getUserId());
                            request.setAttribute("posts", posts);
                            nextPage = "client_dashboard.jsp";
                            System.out.println(nextPage);
                            break;
                        case 2: ArrayList<Post> free_posts = new ArrayList<Post>();
                                ArrayList<String> all_skillz = FreelancerSkill.collectAllSkills();

                            for(String aSkill: all_skillz){
                                System.out.println(aSkill);
                                free_posts = Post.collectFreeUserPosts(aSkill);
                            }
                            request.setAttribute("free_posts", free_posts);
                            nextPage = "user_dashboard.jsp";
                            System.out.println(nextPage);
                            break;
                        default: 
                        // case 2: ArrayList<Post> free_posts = Post.collectFreeUserPosts();
                        //     request.setAttribute("free_posts", free_posts);
                        //     nextPage = "user_dashboard.jsp";
                        //     System.out.println(nextPage);
                        //     break;
                        // default: 
                    }
                break;
            case 2:
                break;
            default: 
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if(user!=null){
            // request.getRequestDispatcher("user_dashboard.jsp").forward(request, response);
        }

    }

}
