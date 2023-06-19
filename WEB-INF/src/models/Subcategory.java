package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Subcategory {
    private Integer subcategoryId;
    private String name;
    private Category category;

 // =========================//Constructors\\============================\\ 
public Subcategory(){}


public Subcategory(Integer subcategoryId) {
    this.subcategoryId = subcategoryId;
}

public Subcategory(Integer subcategoryId, Category category){
    this.subcategoryId = subcategoryId;
    this.category = category;
}

public Subcategory(Integer subcategoryId,String name,Category category){
    this.subcategoryId = subcategoryId;
    this.name = name;
    this.category = category;
}
// =========================//Methods\\============================\\ 


public static ArrayList<Subcategory> getAllCities(Integer categoryId){
    ArrayList<Subcategory> subcategories = new ArrayList<Subcategory>();
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        String query = "select subcategory_id,sub.name,sub.category_id,cat.name from subcategories as sub inner join categories as cat where sub.category_id=cat.category_id and sub.category_id=?;";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, categoryId);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            subcategories.add(new Subcategory(rs.getInt(1), rs.getString(2),new Category(rs.getInt(3),rs.getString(4))));
        }
        con.close();

    } catch(SQLException|ClassNotFoundException e){
        e.printStackTrace();
    }
    return subcategories;
}


    // =========================//Getter-Setter\\============================\\    
    public Integer getSubcategoryId() {
        return subcategoryId;
    }
    public void setSubcategoryId(Integer subcategoryId) {
        this.subcategoryId = subcategoryId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }
}
