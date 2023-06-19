package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.City;
import models.Subcategory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import com.google.gson.Gson;

@WebServlet("/search_subcategory.do")
public class SearchSubcategoryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer CategoryId = Integer.parseInt(request.getParameter("category_id"));

        ArrayList<Subcategory> cities = Subcategory.getAllCities(CategoryId);
        System.out.println(cities);

        Gson gson = new Gson();
        String resp = gson.toJson(cities);


        response.getWriter().write(resp);
    }
}