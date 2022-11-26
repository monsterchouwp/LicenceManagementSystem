package servlet.service;

import java.util.ArrayList;

import model.Entity;
import model.History;
import model.Record;
import model.RecordID;
import model.User;
import servlet.dao.EntityDao;
import servlet.dao.EntityDaoImpl;
import servlet.dao.HistoryDao;
import servlet.dao.HistoryDaoImpl;
import servlet.dao.RecordDao;
import servlet.dao.RecordDaoImpl;
import servlet.dao.RecordIDDao;
import servlet.dao.RecordIDDaoImpl;
import servlet.dao.UserDao;
import servlet.dao.UserDaoImpl;

public class OtherServiceImpl implements OtherService {
	EntityDao entdao;
	UserDao userdao;
	RecordIDDao rid;
	HistoryDao hd;
	RecordDao rd;
	public OtherServiceImpl() {
		 entdao = new EntityDaoImpl();
		 userdao = new UserDaoImpl();
		 rid = new RecordIDDaoImpl();
		 hd = new HistoryDaoImpl();
		 rd = new RecordDaoImpl();
	}
	
	@Override
	public boolean applyEntity(int eid, User user) {
		ArrayList<Record> rds = rd.get_ListInfoByUser(user.getName());
		if (rds.size() < 1 && entdao.applyEntity(eid, user))//这个条件顺序不能变
			return true;
		else 
			return false;
	}
	/*
	 * 取消牌照申请
	 */
	@Override
	public boolean withdraw(int eid) {
		if (entdao.withDrawEntity(eid)) {
			return true;
		} else {
			return false;
		}
	}
	
	/*
	 * 允许实名
	 */
	public boolean acceptAutonymApplay(User user, String idNum, String realName) {
		if (userdao.acceptAutonymApplay(user, idNum, realName))
			return true;
		else 
			return false;
	}
	
	/*
	 * 更改个人信息
	 */
	@Override
	public boolean updateUser(User user, int tip) {
		if (tip == 1) {
			if (userdao.updateUserInfo(user)) {//用户级别：更改部分信息
				return true;
			} else {
				return false;
			}
		} else {
			if (userdao.updateUserWholeInfo(user)) {//管理级别：更改用户所有信息
				return true;
			} else {
				return false;
			}
		}
	}
	/*
	 * 更改密码
	 */
	@Override
	public boolean updatePassword(String name, String oldPwd, String newPwd) {
		if (oldPwd.equals(newPwd)) {//两次密码相同
			return false;
		} else {
			if (userdao.updatePassword(name, oldPwd, newPwd)) {
				return true;
			} else {
				return false;
			}
		}
	}
	/*
	 * 	实名申请
	 */
	public int updateAutonym(String name, String autonym, String idNum) {
		int num = userdao.updateUserAutonym(name, autonym, idNum);
		if (num == -1) {
			return -1;
		} else if (num == -2) {
			System.out.println(-2);
			return -2;
		} else if (num == -3) {
			System.out.println(-3);
			return -3;
		} else {
			return 1;
		}
		
	}
	
	/*
	 * 接受用户申请
	 */
	@Override
	public boolean acceptApplay(User user, int eid) {
		boolean flag = false;
		if (userdao.updateUserEntity(user, eid)) {
			return true;
		}
		
		return flag;
	}
	
	
	/*
	 * 撤销用户实名申请
	 */
	public boolean withdrawAutonym(String name) {
		boolean flag = false;
		
		if (rid.withdrawAutonym(name)) {
			return true;
		}
		
		return flag;
	}
	
	/*
	 * 更新牌照
	 */
	
	@Override
	public boolean updateEntity(Entity entity, int o_eid) {
		boolean flag = false;
		
		if (entdao.updateEntity(entity, o_eid)) {
			return true;
		}
		
		return flag;
	}
	
	
	/*
	 * 查找牌照
	 */
	public ArrayList<Entity> search(String name) {
		return entdao.search(name);
	}
	/*
	 * 添加牌照
	 */
	public boolean addEntity(Entity entity) {
		return entdao.addEntity(entity);
	}
	/*
	 * 查找某个人的历史记录
	 */
	public ArrayList<History> searchHistory(String name) {
		return hd.get_ListUserInfo(name);
	}
	/*
	 * 查找某个人的实名申请
	 */
	public ArrayList<RecordID> searchRecordID(String name) {
		return rid.get_ListInfoUser(name);
	}
	/*
	 * 获取某个用户的申请记录
	 */
	public ArrayList<Record> searchRecord(String name) {
		return rd.get_ListInfoByUser(name);
	}
	/*
	 * 获取某个人的信息
	 */
	public User searchUser(String name) {
		return userdao.getUserWholeInfo(name, " ");
	}
}
