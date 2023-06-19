package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Tag {
    private Integer tagId;
    private String name;

 // =========================//Constructors\\============================\\ 
public Tag(){}

public Tag(Integer tagId, String name) {
    this.tagId = tagId;
    this.name = name;
}

public Tag(Integer tagId) {
    this.tagId = tagId;
}


public static ArrayList<Tag> collectTags() {
    ArrayList<Tag> tags = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
    
        String query = "select * from tags";
        PreparedStatement pst = con.prepareStatement(query);

        ResultSet rs = pst.executeQuery();

        while(rs.next()) {
            tags.add(new Tag(rs.getInt(1),rs.getString(2)));
        }

        con.close();
    } catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();			
    }

    return tags;
}

// =========================//Getter-Setter\\============================\\    
    public Integer getTagId() {
        return tagId;
    }
    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
 