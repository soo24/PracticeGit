package enter;

public class EnterDto {
	
	int id;
	String enterName;
	int voteCount;
	
	public EnterDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EnterDto(int id, String enterName, int voteCount) {
		super();
		this.id = id;
		this.enterName = enterName;
		this.voteCount = voteCount;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEnterName() {
		return enterName;
	}
	public void setEnterName(String enterName) {
		this.enterName = enterName;
	}
	public int getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}

	@Override
	public String toString() {
		return "enterDto [id=" + id + ", enterName=" + enterName + ", voteCount=" + voteCount + "]";
	}

}
