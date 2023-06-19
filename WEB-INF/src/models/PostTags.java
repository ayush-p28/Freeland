package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostTags {
    private Integer postTagId;
    private Post post;
    private Tag tag;

 // =========================//Constructors\\============================\\ 
public PostTags(){}

public PostTags(Post post) {
    this.post = post;
}


// =========================//Methods\\============================\\ 
public boolean savePostTag(Integer tags){
    boolean flag = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        
        String query1 = "delete from post_tags where post_id=? and tag_id=?";
        
        String query2 = "insert into post_tags (post_id, tag_id) value (?,?)";

        System.out.println("inside projectTags"+tags+"-"+post.getPostId());

        PreparedStatement ps1 = con.prepareStatement(query1);
        ps1.setInt(1, post.getPostId());
        ps1.setInt(2, tags);

        int val = ps1.executeUpdate();

        if(val == 0) {
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.setInt(1, post.getPostId());
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


// =========================//Getter-Setter\\============================\\    
    public Integer getPostTagId() {
        return postTagId;
    }
    public void setPostTagId(Integer postTagId) {
        this.postTagId = postTagId;
    }
    public Post getPost() {
        return post;
    }
    public void setPost(Post post) {
        this.post = post;
    }
    public Tag getTag() {
        return tag;
    }
    public void setTag(Tag tag) {
        this.tag = tag;
    }
}