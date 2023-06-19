package models;
public class Status{
    private Integer statusId;
    private String name;

    public static final int ACTIVE = 1;
	public static final int INACTIVE = 2;

	public static final Status STATUS_ACTIVE = new Status(1);

// =========================//Constructors\\============================\\ 
    public Status(){}

	public Status(Integer statusId) {
		super();
		this.statusId = statusId;
	}
	


// =========================//Methods\\============================\\ 



// =========================//Getter-Setter\\============================\\ 
    public Integer getStatusId() {
        return statusId;
    }
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
