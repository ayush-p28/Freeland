package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProjectTag {
    private Integer projectTagId;
    private Project project;
    private Tag tag;

    public ProjectTag() {
    }

    public ProjectTag(Project project) {
        this.project = project;
    }


    public boolean saveProjectTag(Integer tags){
        boolean flag = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            
            String query1 = "delete from project_tags where project_id=? and tag_id=?";
            
            String query2 = "insert into project_tags (project_id, tag_id) value (?,?)";

            System.out.println("inside projectTags"+tags+"-"+project.getProjectId());

            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setInt(1, project.getProjectId());
            ps1.setInt(2, tags);

            int val = ps1.executeUpdate();

            if(val == 0) {
                PreparedStatement ps2 = con.prepareStatement(query2);
                ps2.setInt(1, project.getProjectId());
                ps2.setInt(2, tags);    
                
                ps2.executeUpdate();
            }
            flag = true;
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Integer getProjectTagId() {
        return projectTagId;
    }
    public void setProjectTagId(Integer projectTagId) {
        this.projectTagId = projectTagId;
    }
    public Project getProject() {
        return project;
    }
    public void setProject(Project project) {
        this.project = project;
    }
    public Tag getTag() {
        return tag;
    }
    public void setTag(Tag tag) {
        this.tag = tag;
    }

 
}