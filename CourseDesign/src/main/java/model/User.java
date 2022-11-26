package model;

public class User {
	private String name;//姓名
	private String password;//密码
	private String phone;//手机号
	private int num;//拥有牌照数目
	private Entity entities[];//拥有牌照
	private int priority;//优先级
	private String message;//备注信息
	private String realName;//真实姓名
	private String identifyNum;//身份证号码
	private String address;//住址
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getIdentifyNum() {
		return identifyNum;
	}
	public void setIdentifyNum(String identifyNum) {
		this.identifyNum = identifyNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Entity[] getEntities() {
		return entities;
	}
	public void setEntities(Entity[] entities) {
		this.entities = entities;
	}
	/*
	 * 构造函数
	 */
	public User(String name, String pwd) {
		this.name = name;
		this.password = pwd;
		message = "无";
	}
	public User() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}

}
