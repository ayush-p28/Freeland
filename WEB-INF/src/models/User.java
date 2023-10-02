package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.jasypt.util.password.StrongPasswordEncryptor;

import utils.DBpool;

public class User{
    private Integer userId;
    private String name;
    private String email;
    private String password;
    private String address;
    private String contact;
    private String otp;
    private String rating;
    private String aboutMe;
    private String logo;
    private City city;
    private Status status;
    private UserType userType;

    private static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

// =========================//Constructors\\============================\\ 
    public User(){}


    public User(Integer userId) {
        this.userId = userId;
    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public User(String email, String password, String contact,String otp) {
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.otp = otp;
    }
    
    public User(String otp, String contact) {
        this.otp = otp;
        this.contact = contact;
    }

    

// =========================//Methods\\============================\\ 

public int login() {
    System.out.println("login called");
    int flag = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");

        String query = "select * from users where email=?";

        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            System.out.println("login called-1");
            String encryptedPassword = rs.getString("password"); 
            boolean f1 = spe.checkPassword(password, encryptedPassword);
            boolean f2 = rs.getInt("status_id") == Status.ACTIVE;
            if(f2) {
                if(f1) {
                    userId = rs.getInt("user_id");
                    name = rs.getString("name");
                    contact = rs.getString("contact");
                    address = rs.getString("address");
                    aboutMe = rs.getString("about_me");
                    logo = rs.getString("logo");
                    city = new City(rs.getInt("city_id"));
                    userType = new UserType(rs.getInt("user_type_id"));
                    status = Status.STATUS_ACTIVE;
                    flag = 1;
                    System.out.println(flag);
                } //flag = 0 if password mismatch
            } else {
                flag = rs.getInt("status_id");
                // flag = status_id
            }
        }
        
        System.out.println("login ended");
        con.close();
    } catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }

    return flag;
}

public boolean saveUser() {
    System.out.println("forst line of saveUser");
    boolean flag = false;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        
        String query = "insert into users (name, email, password, contact, address, " +
                       "city_id, logo, status_id,about_me,user_type_id) value (?,?,?,?,?,?,?,?,?,?)";
                        
                    //    insert into users 
                    //    (name, email, password, contact, address,city_id, logo, status_id,about_me) 
                    //    value ('ayush','ayu@gmail.com','1234@',98765432,'ranital',1,'isharuhdar',1,'ayu');
                       
        PreparedStatement ps = con.prepareStatement(query);
                       
        ps.setString(1, name);
        System.out.println("1");
        ps.setString(2, email);
        System.out.println("2");
        ps.setString(3, spe.encryptPassword(password));
        System.out.println("3");
        ps.setString(4, contact);
        ps.setString(5, address);

        System.out.println("4");
        System.out.println("4");
        ps.setInt(6, city.getCityId());
        ps.setString(7, logo);
        System.out.println("5");
        ps.setInt(8, Status.ACTIVE);
        System.out.println("6");
        ps.setString(9, aboutMe);
        ps.setInt(10, userType.getUserTypeId());
        System.out.println(userType.getUserTypeId()+"user type saved");
        System.out.println(getContact());

        int val = ps.executeUpdate();

        if(val == 1) {
            flag = true;
        }
        
        System.out.println("last line of saveUser");
        con.close();
    } catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }

    return flag;
}

    // =========================//Getter-Setter\\============================\\ 
    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getOtp() {
        return otp;
    }
    public void setOtp(String otp) {
        this.otp = otp;
    }
    public String getRating() {
        return rating;
    }
    public void setRating(String rating) {
        this.rating = rating;
    }
    public String getAboutMe() {
        return aboutMe;
    }
    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }
    public City getCit() {
        return city;
    }
    public void setCit(City cit) {
        this.city = cit;
    }
    public Status getStatus() {
        return status;
    }
    public void setStatus(Status status) {
        this.status = status;
    }
    public UserType getUserType() {
        return userType;
    }
    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    
}
