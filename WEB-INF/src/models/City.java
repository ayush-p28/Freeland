package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class City{
    private Integer cityId;
    private String name;
    private State state;

// =========================//Constructors\\============================\\ 
    public City(){}

    public City(Integer cityId,String name){
        this.cityId = cityId;
		this.name = name;
    }
    
    public City(Integer cityId){
        this.cityId = cityId;
    }

// =========================//Methods\\============================\\ 

    public static ArrayList<City> getAllCities(Integer stateId){
        ArrayList<City> cities = new ArrayList<City>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
            String query = "select city_id,c.name,c.state_id,s.name from cities as c inner join states as s where c.state_id=s.state_id and c.state_id=?;";
    
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, stateId);
            ResultSet rs = ps.executeQuery();
                        
            while(rs.next()){
                cities.add(new City(rs.getInt(1), rs.getString(2)));
            }
            con.close();
    
        } catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return cities;
    }

// =========================//Getter-Setter\\============================\\ 
    public Integer getCityId() {
        return cityId;
    }
    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public State getState() {
        return state;
    }
    public void setState(State state) {
        this.state = state;
    }
    
}

