package dto;

public class MemberDTO {

	private String mid;
	private String pw;
	private String name;
	private String birth;
	private String groups;
	private String phone;
	private String email;
	private int point;
	private String department;

	public MemberDTO(){}
	public MemberDTO(String mid, String pw, String name, String birth, String groups, String phone, String email, int point,
			String department) {
		super();
		this.mid = mid;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.groups = groups;
		this.phone = phone;
		this.email = email;
		this.point = point;
		this.department = department;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGroups() {
		return groups;
	}

	public void setGroup(String groups) {
		this.groups = groups;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

}
