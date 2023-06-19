package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.DBpool;

public class Project{
    private Integer projectId;
    private User user;
    private Subcategory subcategory;
    private PostStatus postStatus;
    private String title;
    private String description;
    private String ptitle;
    private String pdescription;
    private Integer delivery;
    private Integer revisions;
    private Integer price;

    public Project(){}

    public Project(Integer projectId) {
        this.projectId = projectId;
    }

    public Project(User user, Subcategory subcategory, PostStatus postStatus, String title, String description,
            String ptitle, String pdescription, Integer delivery, Integer revisions, Integer price) {
        this.user = user;
        this.subcategory = subcategory;
        this.postStatus = postStatus;
        this.title = title;
        this.description = description;
        this.ptitle = ptitle;
        this.pdescription = pdescription;
        this.delivery = delivery;
        this.revisions = revisions;
        this.price = price;
    }

    public Project(Integer projectId, User user, Subcategory subcategory, PostStatus postStatus, String title,
            String description, String ptitle, String pdescription, Integer delivery, Integer revisions,
            Integer price) {
        this.projectId = projectId;
        this.user = user;
        this.subcategory = subcategory;
        this.postStatus = postStatus;
        this.title = title;
        this.description = description;
        this.ptitle = ptitle;
        this.pdescription = pdescription;
        this.delivery = delivery;
        this.revisions = revisions;
        this.price = price;
    }

    public static boolean deleteProject(Integer projectId){
        boolean flag = false;
        System.out.println("delete project database called");
        try {
            Connection con = DBpool.getConnection();

            String query = "delete from projects where project_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, projectId);
            // ps.setString(2, email);

            int val = ps.executeUpdate();

            if(val == 1) {
                flag = true;
            }

            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    // collect all the saved projects
    public static ArrayList<Project> collectUserProjects(Integer userId) {
        System.out.println(userId);
        ArrayList<Project> projects = new ArrayList<Project>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            
            // String query = "select project_id,title,description,ptitle,pdescription,subcategory_id,"
            //                 +"delivery,revisions,price,user_id,post_status_id from projects as pr "
            //                 +"inner join subcategories as sct where user_id=? and pr.subcategory_id=sct.subcategory_id";
                            String query = "select * from projects as pr inner join subcategories as ct where user_id=? and pr.subcategory_id=ct.subcategory_id";
                            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                projects.add(new Project(rs.getInt("project_id"), new User(rs.getInt("user_id")), new Subcategory(rs.getInt("subcategory_id"), new Category(rs.getInt("category_id"))), new PostStatus(rs.getInt("post_status_id")), rs.getString("title"), rs.getString("description"), rs.getString("ptitle"), rs.getString("pdescription"), rs.getInt("delivery"), rs.getInt("revisions"), rs.getInt("price")));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }        

        return projects;
    }

    // save project
    public void saveProject(User user){
        System.out.println("save database called");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            
            String query2 = "insert into projects (title, description, ptitle, pdescription, subcategory_id, " +
                           "delivery, revisions, price, user_id, post_status_id) value (?,?,?,?,?,?,?,?,?,?)";
                           
            PreparedStatement ps2 = con.prepareStatement(query2, Statement.RETURN_GENERATED_KEYS);

            ps2.setString(1, title);
            ps2.setString(2, description);
            ps2.setString(3, ptitle);
            ps2.setString(4, pdescription);
    
            ps2.setInt(5, subcategory.getSubcategoryId());
            ps2.setInt(6, delivery);
            ps2.setInt(7, revisions);
            ps2.setInt(8, price);
            ps2.setInt(9, user.getUserId());
            ps2.setInt(10, postStatus.getPostStatusId());
    
            int val2 = ps2.executeUpdate();
    
            if(val2 == 1) {
                ResultSet rs2 = ps2.getGeneratedKeys();
                if(rs2.next()) {
                    projectId = rs2.getInt(1);
                    System.out.println("got keys"+projectId);
                }
            }
            System.out.println(val2);
            
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public void updateProject(User user){
        System.out.println("update database called");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            
            String query1 = "update projects set title=?, description=?, ptitle=?, pdescription=?, subcategory_id=?, " +
            "delivery=?, revisions=?, price=?, user_id=?, post_status_id=?) where project_id=?";

            PreparedStatement ps1 = con.prepareStatement(query1);
                         
            ps1.setString(1, title);
            ps1.setString(2, description);
            ps1.setString(3, ptitle);
            ps1.setString(4, pdescription);
    
            ps1.setInt(5, subcategory.getSubcategoryId());
            ps1.setInt(6, delivery);
            ps1.setInt(7, revisions);
            ps1.setInt(8, price);
            ps1.setInt(9, user.getUserId());
            ps1.setInt(10, postStatus.getPostStatusId());
            
            ps1.setInt(11, 1);
    
            ResultSet rs = ps1.executeQuery();
            
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Integer getProjectId() {
        return projectId;
    }
    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Subcategory getSubcategory() {
        return subcategory;
    }
    public void setSubcategory(Subcategory subcategory) {
        this.subcategory = subcategory;
    }
    public PostStatus getPostStatus() {
        return postStatus;
    }
    public void setPostStatus(PostStatus postStatus) {
        this.postStatus = postStatus;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getPtitle() {
        return ptitle;
    }
    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }
    public String getPdescription() {
        return pdescription;
    }
    public void setPdescription(String pdescription) {
        this.pdescription = pdescription;
    }
    public Integer getDelivery() {
        return delivery;
    }
    public void setDelivery(Integer delivery) {
        this.delivery = delivery;
    }
    public Integer getRevisions() {
        return revisions;
    }
    public void setRevisions(Integer revisions) {
        this.revisions = revisions;
    }
    public Integer getPrice() {
        return price;
    }
    public void setPrice(Integer price) {
        this.price = price;
    }
}

