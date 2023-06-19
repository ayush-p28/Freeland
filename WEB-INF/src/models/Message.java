package models;
import java.util.Date;

public class Message{
    private Integer messagesId;
    private Bid bid;
    private String messaage;
    private Date dateTime;
    private boolean who;

    // =========================//Constructors\\============================\\ 
public Message(){}


// =========================//Methods\\============================\\ 



// =========================//Getter-Setter\\============================\\ 
    public Integer getMessagesId() {
        return messagesId;
    }
    public void setMessagesId(Integer messagesId) {
        this.messagesId = messagesId;
    }
    
    public String getMessaage() {
        return messaage;
    }
    public void setMessaage(String messaage) {
        this.messaage = messaage;
    }
    public Date getDateTime() {
        return dateTime;
    }
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
    public boolean isWho() {
        return who;
    }
    public void setWho(boolean who) {
        this.who = who;
    }
    public Bid getBid() {
        return bid;
    }
    public void setBid(Bid bid) {
        this.bid = bid;
    }
}