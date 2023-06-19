package listeners;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;

import models.Category;
import models.State;
import models.Tag;
import utils.EmailSender;
import utils.Utility;

import javax.servlet.ServletContextEvent;

public class AppListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent e) {
        ServletContext context = e.getServletContext();
        
        Utility.secretKey = context.getInitParameter("secret_key");
        String smtpHost = context.getInitParameter("smtp_host");
        String smtpPort = context.getInitParameter("smtp_port");  
        
        ArrayList<State> states = State.getAllStates();
        context.setAttribute("states", states);

        ArrayList<Category> categories = Category.getAllCategory();
        context.setAttribute("categories", categories);
        
        ArrayList<Tag> tags = Tag.collectTags();
        context.setAttribute("tags", tags);

        EmailSender.setProperties(smtpHost, smtpPort);
    }

    public void contextDestroyed(ServletContextEvent e) {

    }
}
