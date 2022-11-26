package servlet.service;

import servlet.dao.UserDaoImpl;
import servlet.dao.UserDao;

public class LoginServiceImpl implements LoginService {
	public boolean login(String userName, String password) {
		UserDao ud=new UserDaoImpl();
		if(ud.login(userName, password)) {
			return true;
		} else {
			return false;
		}
	}
}
