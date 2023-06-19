package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.State;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

@WebServlet("/search_state.do")
public class SearchStateServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        ArrayList<State> states = (ArrayList<State>)getServletContext().getAttribute("states");
       
        Gson gson = new Gson();
        String resp = gson.toJson(states);


        response.getWriter().write(resp);
    }
}