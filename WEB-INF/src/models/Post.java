package models;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
// import java.sql.Date;
import java.sql.Statement;


public class Post {
    private Integer postId;
    private String name;
    private String description;
    private User user; 
    private Subcategory subcategory;
    private PostStatus postStatus;
    private String images;
    private String date;
    private String deadline;      

    // =========================//Constructors\\============================\\ 
public Post(){}
public Post(Integer postId){
    this.postId = postId;
}



public Post(Integer postId, User user, Subcategory subcategory, PostStatus postStatus, String name, String description,
        String date, String deadline) {
    this.postId = postId;
    this.user = user;
    this.subcategory = subcategory;
    this.postStatus = postStatus;
    this.name = name;
    this.description = description;
    this.date = date;
    this.deadline = deadline;
}
public Post(Integer postId, String name, String description, User user, Subcategory subcategory, PostStatus postStatus,
        String date, String deadline) {
    this.postId = postId;
    this.name = name;
    this.description = description;
    this.user = user;
    this.subcategory = subcategory;
    this.postStatus = postStatus;
    this.date = date;
    this.deadline = deadline;
}

// =========================//Methods\\============================\\ 

public static ArrayList<Post> collectUserPosts(Integer userId) {
    System.out.println(userId);
    ArrayList<Post> posts = new ArrayList<Post>();
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        
        String query = "select * from posts as pr inner join subcategories as ct where user_id=? and pr.subcategory_id=ct.subcategory_id";
                        
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            posts.add(new Post(rs.getInt("post_id"), new User(rs.getInt("user_id")), new Subcategory(rs.getInt("subcategory_id"), new Category(rs.getInt("category_id"))), new PostStatus(rs.getInt("post_status_id")), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("deadline")));
        }

        con.close();
    } catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }        

    return posts;
}

public static ArrayList<Post> collectFreeUserPosts() {
    // System.out.println(userId);
    ArrayList<Post> posts = new ArrayList<Post>();
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        
        String query = "select * from posts as pr inner join subcategories as ct where pr.subcategory_id=ct.subcategory_id";
                        
        PreparedStatement ps = con.prepareStatement(query);
        // ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            posts.add(new Post(rs.getInt("post_id"), new User(rs.getInt("user_id")), new Subcategory(rs.getInt("subcategory_id"), new Category(rs.getInt("category_id"))), new PostStatus(rs.getInt("post_status_id")), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("deadline")));
        }

        con.close();
    } catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }        

    return posts;
}

public void savePost(User user){
    System.out.println("save post called");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/free_db?user=root&password=1234");
        
        String query2 = "insert into posts (name, description, subcategory_id, " +
                       "user_id, post_status_id, date, deadline) value (?,?,?,?,?,?,?)";
                       
        PreparedStatement ps2 = con.prepareStatement(query2, Statement.RETURN_GENERATED_KEYS);

        ps2.setString(1, name);
        ps2.setString(2, description);
        // ps2.setString(3, ptitle);
        // ps2.setString(4, pdescription);

        ps2.setInt(3, subcategory.getSubcategoryId());
        // ps2.setInt(6, delivery);
        // ps2.setInt(7, revisions);
        // ps2.setInt(8, price);
        ps2.setInt(4, user.getUserId());
        ps2.setInt(5, postStatus.getPostStatusId());
        ps2.setString(6, date);
        System.out.println(date);
        ps2.setString(7, deadline);
        System.out.println(deadline);

        int val2 = ps2.executeUpdate();

        if(val2 == 1) {
            ResultSet rs2 = ps2.getGeneratedKeys();
            if(rs2.next()) {
                postId = rs2.getInt(1);
                System.out.println("got keys"+postId);
            }
        }
        System.out.println(val2);
        
        
        con.close();
    } catch(SQLException|ClassNotFoundException e) {
        e.printStackTrace();
    }
}


// =========================//Getter-Setter\\============================\\ 

    public Integer getPostId() {
        return postId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Subcategory getSubcategory() {
        return subcategory;
    }
    public void setSubcategory(Subcategory subcategory) {
        this.subcategory = subcategory;
    }
    public PostStatus getPostStatus() {
        return postStatus;
    }
    public void setPostStatus(PostStatus postStatus) {
        this.postStatus = postStatus;
    }
    public void setPostId(Integer postId) {
        this.postId = postId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getDeadline() {
        return deadline;
    }
    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
    
}