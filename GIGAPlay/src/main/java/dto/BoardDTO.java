package dto;

public class BoardDTO {

	private int bid;
	private int cid;
	private String member;
	private String title;
	private String content;
	private String category;
	private int hit;
	private String date;

	public BoardDTO(){}
	
	public BoardDTO(int bid, int cid, String member, String title, String content, String category, int hit,
			String date) {
		super();
		this.bid = bid;
		this.cid = cid;
		this.member = member;
		this.title = title;
		this.content = content;
		this.category = category;
		this.hit = hit;
		this.date = date;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
