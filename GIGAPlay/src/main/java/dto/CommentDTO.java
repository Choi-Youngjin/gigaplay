package dto;

public class CommentDTO {

	private String commid;
	private String bid;
	private String content;
	private String date;

	public CommentDTO(String commid, String bid, String content, String date) {
		super();
		this.commid = commid;
		this.bid = bid;
		this.content = content;
		this.date = date;
	}

	public String getCommid() {
		return commid;
	}

	public void setCommid(String commid) {
		this.commid = commid;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
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
