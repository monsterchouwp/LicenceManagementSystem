package servlet.dao;

import java.util.ArrayList;

import model.User;

public interface UserDao {
	public ArrayList<User> get_ListInfoUser();//获取所有用户信息
	
	
	public boolean login(String userName, String password);
	public boolean register(String userName, String password, String phone);
	
	public User getUserInfo(String userName, String password) ;
	public User getUserWholeInfo(String userName, String password);
	
	public boolean updateUserInfo(User user);//用户级别：更改信息
	public boolean updateUserWholeInfo(User user);//管理级别：更改用户信息
	
	public boolean updatePassword(String userName, String oldPwd, String newPwd);
	
	public int updateUserAutonym(String userName, String realname, String idNum);
	
	public boolean updateUserEntity(User user, int eid);
	
	public boolean acceptAutonymApplay(User user, String idNum, String realName);//接受实名申请
}
