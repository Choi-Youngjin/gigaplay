package dto;

public class CommentDTO {

	private int commid;
	private int cid;
	private int bid;
	private String mid;
	private String content;
	private String date;

	public CommentDTO() {}

	public CommentDTO(int commid, int cid, int bid, String mid, String content, String date) {
		super();
		this.commid = commid;
		this.cid = cid;
		this.bid = bid;
		this.mid = mid;
		this.content = content;
		this.date = date;
	}
	public int getCommid() {
		return commid;
	}

	public void setCommid(int commid) {
		this.commid = commid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
