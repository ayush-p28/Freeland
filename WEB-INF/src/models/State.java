package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class State{
    private Integer stateId;
    private String alias;
    private String name;

  // =========================//Constructors\\============================\\ 
public State(){}

public State(int stateId,String name){
    this.stateId = stateId;
    this.name = name;
}

public State(int stateId){
    this.stateId = stateId;
}

// =========================//Methods\\============================\\ 

public static ArrayList<State> getAllStates(){
    ArrayList<State> states = new ArrayList<State>();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        String query = "select * from states";

        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            states.add(new State(rs.getInt(1),rs.getString(2)));
        }
        con.close();

    } catch(SQLException|ClassNotFoundException e){
        e.printStackTrace();
    }
    return states;
}

// =========================//Getter-Setter\\============================\\   
    public Integer getStateId() {
        return stateId;
    }
    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }
    public String getAlias() {
        return alias;
    }
    public void setAlias(String alias) {
        this.alias = alias;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}