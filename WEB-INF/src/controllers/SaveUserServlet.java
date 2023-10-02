package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.City;
import models.User;

@WebServlet("/save_profile.do")
public class SaveUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        boolean flag = false;
        if(user != null) {
            String address = request.getParameter("address");
            Integer cityId = Integer.parseInt(request.getParameter("city_id"));
            // Integer stateId = Integer.parseInt(request.getParameter("state_id"));
            String about = request.getParameter("about");

            System.out.println(address+" - "+cityId+" - "+about);

            user.setAddress(address);
            user.setCity(new City(cityId));
            user.setAboutMe(about);

            flag = true;
        }else{
            response.sendRedirect("static/html/chor.html");
        }

        response.getWriter().print(flag);
    }
}