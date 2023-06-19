package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category {
    private Integer categoryId;
    private String name;

    // =========================//Constructors\\============================\\ 
    public Category(){}

    public Category(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Category(Integer categoryId, String name) {
        this.categoryId = categoryId;
        this.name = name;
    }
    

    // =========================//Methods\\============================\\ 


    public static ArrayList<Category> getAllCategory(){
        ArrayList<Category> categories = new ArrayList<Category>();
    
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            String query = "select * from categories";
    
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
    
            while(rs.next()){
                categories.add(new Category(rs.getInt(1),rs.getString(2)));
            }
            con.close();
    
        } catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return categories;
    }



    // =========================//Getter-Setter\\============================\\ 
    public Integer getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}


