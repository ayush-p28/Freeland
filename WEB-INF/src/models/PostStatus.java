package models;
public class PostStatus {
    private Integer postStatusId;
    private String name;

// =========================//Constructors\\============================\\ 
public PostStatus(){}


public PostStatus(Integer postStatusId) {
    this.postStatusId = postStatusId;
}
// =========================//Methods\\============================\\ 





    // =========================//Getter-Setter\\============================\\     
    public Integer getPostStatusId() {
        return postStatusId;
    }
    public void setPostStatusId(Integer postStatusId) {
        this.postStatusId = postStatusId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}