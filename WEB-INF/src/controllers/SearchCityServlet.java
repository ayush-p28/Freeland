package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.City;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import com.google.gson.Gson;

@WebServlet("/search_city.do")
public class SearchCityServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer stateId = Integer.parseInt(request.getParameter("state_id"));

        ArrayList<City> cities = City.getAllCities(stateId);
        System.out.println(cities);

        Gson gson = new Gson();
        String resp = gson.toJson(cities);


        response.getWriter().write(resp);
    }
}