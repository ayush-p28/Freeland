package models;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import utils.DBpool;

public class Bid{
    private Integer bidId;
    private Integer bidAmount;
    private Integer days;
    private Integer rating;
    private Date date;
    private Status status;
    private Post post;
    private User user;

    // =========================//Constructors\\============================\\ 
    public Bid() {

    }

    // =========================//Methods\\============================\\ 

    public void saveBid(){
        System.out.println("save post called");
        try {
            Connection con = DBpool.getConnection();
            
            String query2 = "insert into bids (bid_amount, post_id, user_id) value (?,?,?)";
                           
            PreparedStatement ps2 = con.prepareStatement(query2);
    
            ps2.setInt(1, bidAmount);
            ps2.setInt(2, post.getPostId());
            // ps2.setString(3, ptitle);
            // ps2.setString(4, pdescription);
    
            ps2.setInt(3, user.getUserId());
            // ps2.setInt(6, delivery);
            // ps2.setInt(7, revisions);
            // ps2.setInt(8, price);
            // ps2.setInt(4, status.);
            // ps2.setInt(5, postStatus.getPostStatusId());
            // ps2.setString(6, date);
    
            int val2 = ps2.executeUpdate();
            
            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    
    // =========================//Getter-Setter\\============================\\ 
    public Integer getBidId() {
        return bidId;
    }
    
    public void setBidId(Integer bidId) {
        this.bidId = bidId;
    }
    public Integer getBidAmount() {
        return bidAmount;
    }
    public void setBidAmount(Integer bidAmount) {
        this.bidAmount = bidAmount;
    }
    public Integer getDays() {
        return days;
    }
    public void setDays(Integer days) {
        this.days = days;
    }
    public Integer getRating() {
        return rating;
    }
    public void setRating(Integer rating) {
        this.rating = rating;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}