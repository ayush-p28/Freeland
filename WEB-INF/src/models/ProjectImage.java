package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProjectImage {
    private Integer projectImageId;
    private Project project;
    private String busImagePath;
    
    public ProjectImage(){

    }

    public static ArrayList<String> fetchAllImages(Integer projectId){
        ArrayList<String> arr = new ArrayList<String>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            
            String query = "select project_image_path from project_images where project_id=?";
        
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, projectId);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString(1)+"img-path");
                arr.add(rs.getString(1));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return arr;
    }

    public static void saveProjectImage(String fileNames,String imageFolderPath,Integer projectId){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            
            String query = "insert into project_images (project_id, project_image_path) value(?,?)";
        
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, projectId);
            String[] imageNames = fileNames.split(", ");
            for(String image : imageNames){
                ps.setString(2, imageFolderPath+"/"+image);
                ps.executeUpdate();
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Integer getProjectImageId() {
        return projectImageId;
    }

    public void setProjectImageId(Integer projectImageId) {
        this.projectImageId = projectImageId;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public String getBusImagePath() {
        return busImagePath;
    }

    public void setBusImagePath(String busImagePath) {
        this.busImagePath = busImagePath;
    }
}
