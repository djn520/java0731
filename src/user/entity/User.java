package user.entity;

public class User {
	
	private Integer id;
	private String u_id;//用户编号
	private String u_username;//用户名
	private String u_password;//用户密码
	private Integer u_age;//年龄
	private String  u_sex;//性别
	private String  u_address;//地址
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_username() {
		return u_username;
	}
	public void setU_username(String u_username) {
		this.u_username = u_username;
	}
	public String getu_password() {
		return u_password;
	}
	public void setu_password(String u_password) {
		this.u_password = u_password;
	}
	public Integer getU_age() {
		return u_age;
	}
	public void setU_age(Integer u_age) {
		this.u_age = u_age;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", u_id=" + u_id + ", u_username="
				+ u_username + ", u_password=" + u_password + ", u_age="
				+ u_age + ", u_sex=" + u_sex + ", u_address=" + u_address + "]";
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(Integer id, String u_id, String u_username, String u_password,
			Integer u_age, String u_sex, String u_address) {
		super();
		this.id = id;
		this.u_id = u_id;
		this.u_username = u_username;
		this.u_password = u_password;
		this.u_age = u_age;
		this.u_sex = u_sex;
		this.u_address = u_address;
	}
	public User(String u_id, String u_username, String u_password,
			Integer u_age, String u_sex, String u_address) {
		super();
		this.u_id = u_id;
		this.u_username = u_username;
		this.u_password = u_password;
		this.u_age = u_age;
		this.u_sex = u_sex;
		this.u_address = u_address;
	}

}
