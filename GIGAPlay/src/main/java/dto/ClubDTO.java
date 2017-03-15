package dto;

public class ClubDTO {

	private String cid;
	private String cgroup;
	private String ctype;
	private String name;
	private String category;
	private String category2;
	private int price;
	private int point;
	private String intro;
	private String location;
	private String picture;

	public ClubDTO(){}
	
	public ClubDTO(String cid, String cgroup, String ctype, String name, String category, String category2, int price,
			int point, String intro, String location, String picture) {
		super();
		this.cid = cid;
		this.cgroup = cgroup;
		this.ctype = ctype;
		this.name = name;
		this.category = category;
		this.category2 = category2;
		this.price = price;
		this.point = point;
		this.intro = intro;
		this.location = location;
		this.picture = picture;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCgroup() {
		return cgroup;
	}

	public void setCgroup(String cgroup) {
		this.cgroup = cgroup;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
