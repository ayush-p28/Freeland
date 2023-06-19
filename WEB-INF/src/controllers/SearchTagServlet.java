package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.City;
import models.Tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import com.google.gson.Gson;

@WebServlet("/search_tag.do")
public class SearchTagServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String prefix = request.getParameter("tag").toLowerCase();

        ArrayList<Tag> tags = (ArrayList<Tag>)getServletContext().getAttribute("tags");
        ArrayList<Tag> tgs = new ArrayList<>();

        Iterator<Tag> itr = tags.iterator();
        while(itr.hasNext()) {
            Tag ct = itr.next();
            if(ct.getName().toLowerCase().startsWith(prefix)) {
                // System.out.println(ct.getName());
                tgs.add(ct);
            }
        }

        Gson gson = new Gson();
        String resp = gson.toJson(tgs);


        response.getWriter().write(resp);
    }
}