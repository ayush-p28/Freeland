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

import models.Bid;
import models.Post;
import models.PostStatus;
import models.PostTags;
import models.Project;
import models.ProjectTag;
import models.Subcategory;
import models.User;

@WebServlet("/save_bid.do")
public class SaveBidServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Session
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        System.out.println("save called");
        System.out.println("save post 3");
        
        // authorisation
        if(user != null){
            // parameters
            String userData = request.getParameter("bid_data");
            System.out.println("save post 1");
            
            Gson gson = new Gson();
            Bid bid = gson.fromJson(userData, Bid.class);
            
            System.out.println("save post 2");
            bid.saveBid();
        
            System.out.println("save post");
        }
        response.getWriter().write("chal r h post");
    }    
}