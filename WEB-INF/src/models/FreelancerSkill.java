package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBpool;

public class FreelancerSkill{
    private Integer freelancerSkillId;
    private User user;
    private Tag tag;

// =========================//Constructors\\============================\\ 
public FreelancerSkill(){}

public FreelancerSkill(User user){
    this.user = user;
}

// =========================//Methods\\============================\\ 

public static ArrayList<String> collectAllSkills(){
    ArrayList<String> arr = new ArrayList<String>();

    try {
        Connection con = DBpool.getConnection();
        
        String query = "select name from freelancer_skills as fk inner join skills as sk where fk.skill_id=sk.skill_id;";

        PreparedStatement ps = con.prepareStatement(query);
        // ps.setInt(1, categoryId);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            arr.add(rs.getString("name"));
        }
        con.close();
    } catch(SQLException e) {
        e.printStackTrace();
    }
    return arr;
}

public boolean saveFreeSkills(Integer tags){
    boolean flag = false;

    try {
        Connection con = DBpool.getConnection();
        
        String query1 = "delete from freelancer_skills where user_id=? and skill_id=?";
        
        String query2 = "insert into freelancer_skills (user_id, skill_id) value (?,?)";

        // System.out.println("inside projectTags"+t;

        PreparedStatement ps1 = con.prepareStatement(query1);
        ps1.setInt(1, user.getUserId());
        ps1.setInt(2, tags);

        int val = ps1.executeUpdate();

        if(val == 0) {
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.setInt(1, user.getUserId());
            ps2.setInt(2, tags);    
            
            ps2.executeUpdate();
        }
        flag = true;
        con.close();
    } catch(SQLException e) {
        e.printStackTrace();
    }
    return flag;
}


// =========================//Getter-Setter\\============================\\ 
    public Integer getFreelancerSkillId() {
        return freelancerSkillId;
    }
    public void setFreelancerSkillId(Integer freelancerSkillId) {
        this.freelancerSkillId = freelancerSkillId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Tag getSkill() {
        return tag;
    }
    public void setSkill(Tag tag) {
        this.tag = tag;
    }
}