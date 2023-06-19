package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

@WebServlet("/search_category.do")
public class SearchCategoryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        ArrayList<Category> categories = (ArrayList<Category>)getServletContext().getAttribute("categories");
       
        Gson gson = new Gson();
        String resp = gson.toJson(categories);

        response.getWriter().write(resp);
    }
}