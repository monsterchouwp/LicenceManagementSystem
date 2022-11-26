package servlet.service;

import java.util.ArrayList;

import model.Entity;
import model.History;
import model.Record;
import model.RecordID;
import model.User;

public interface OtherService {
	/*
	 * 用户页面
	 */
	public boolean applyEntity(int eid, User user);//申请一个牌照
	public boolean updateUser(User user, int tip);//更新用户信息
	public boolean updatePassword(String name, String oldPwd, String newPwd);//更新密码
	public int updateAutonym(String name, String autonym, String idNum);//实名申请
	/*
	 * 用户、管理员页面
	 */
	
	public boolean withdraw(int eid);//撤销申请
	public ArrayList<Entity> search(String name);
	public ArrayList<Record> searchRecord(String name);
	/*
	 * 管理员页面
	 */
	public boolean acceptApplay(User user, int eid);//接受用户申请牌照
	public boolean updateEntity(Entity entity, int o_eid);//更新牌照
	public boolean withdrawAutonym(String name);//撤销用户实名申请
	public boolean acceptAutonymApplay(User user, String idNum, String realName);//接受实名申请
	public boolean addEntity(Entity entity);//添加牌照
	public ArrayList<History> searchHistory(String name);//查找某个人的历史记录
	public ArrayList<RecordID> searchRecordID(String name);//查找某个人的实名申请
	public User searchUser(String name);//查找某个人的信息
}
