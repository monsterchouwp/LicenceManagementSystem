package servlet.service;

import servlet.dao.UserDao;
import servlet.dao.UserDaoImpl;

public class RegisterServiceImpl implements RegisterService {

	@Override
	public boolean signIn(String userName, String password, String phone) {
		UserDao ud=new UserDaoImpl();
		if(ud.register(userName, password, phone)) {
			return true;
		} else {
			return false;
		}
	}

}
