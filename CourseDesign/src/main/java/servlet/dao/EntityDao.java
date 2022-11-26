package servlet.dao;

import java.util.ArrayList;

import model.Entity;
import model.User;

public interface EntityDao {
	/*
	 * 用户、管理员
	 */
	public ArrayList<Entity> get_ListInfo();//获取牌照所有信息
	
	public Entity getEntityInfo(int eid);//获取某一牌照信息
	
	public boolean withDrawEntity(int eid);//撤回某一牌照恢复到初始状态
	
	public ArrayList<Entity> search(String name);
	/*
	 * 用户
	 */
	public boolean applyEntity(int eid, User user);//申请某一牌照
	
	/*
	 * 管理员
	 */
	public boolean updateEntity(Entity entity, int o_eid);
	public boolean addEntity(Entity entity);
}
