package model;

public class Entity {
	private int eid;//牌照号
	private String name;//实体名
	private int num;//数量
	private String message;//备注信息
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getEid() {
		return eid;
	}
	/*
	 * 构造函数
	 */
	public Entity() {
		eid = 0;
		name = "";
		message = "无";
	}
	public Entity(int eid, String name, int num, String message) {
		this.eid = eid;
		this.name = name;
		this.num = num;
		this.message = message;
	}
	
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
