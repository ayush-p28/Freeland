package models;

public class FreelancerSkill{
    private Integer freelancerSkillId;
    private User user;
    private Tag tag;

// =========================//Constructors\\============================\\ 
public FreelancerSkill(){}


// =========================//Methods\\============================\\ 



// =========================//Getter-Setter\\============================\\ 
    public Integer getFreelancerSkillId() {
        return freelancerSkillId;
    }
    public void setFreelancerSkillId(Integer freelancerSkillId) {
        this.freelancerSkillId = freelancerSkillId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Tag getSkill() {
        return tag;
    }
    public void setSkill(Tag tag) {
        this.tag = tag;
    }
}