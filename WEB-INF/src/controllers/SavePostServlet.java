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

import models.Post;
import models.PostStatus;
import models.PostTags;
import models.Project;
import models.ProjectTag;
import models.Subcategory;
import models.User;

@WebServlet("/save_post.do")
public class SavePostServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        ArrayList<Integer> post_tagz = (ArrayList)session.getAttribute("post_tagz");

        System.out.println("save called");
        System.out.println("save post 3");
        
        // authorisation
        if(user != null){
            // parameters
            String userData = request.getParameter("project_data");
            String post_id = request.getParameter("post_id");
            System.out.println("save post 1");
            
            Gson gson = new Gson();
            Post post = gson.fromJson(userData, Post.class);
            System.out.println(post.getSubcategory().getCategory().getCategoryId()+"background post saving");
            
            if(post_id == ""){
                System.out.println("save post 2");
                post.savePost(new User(user.getUserId()));
            }

            session.setAttribute("post_number", post.getPostId());

            PostTags postTag = new PostTags(new Post(post.getPostId()));
            for(Integer tags: post_tagz){
                System.out.println(tags);
                postTag.savePostTag(tags);
            }
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/"+user.getEmail()+"/posts");
            File file = new File(uploadPath,Integer.toString(post.getPostId()));
            file.mkdir();
            
            System.out.println("save post");
            // Project project = new Project(new User(user.getUserId()), new Subcategory(subcategoryId), new PostStatus(1), title, description, ptitle, pdescription, delivery, revisions, price);
        }
        response.getWriter().write("chal r h post");
    }    
}