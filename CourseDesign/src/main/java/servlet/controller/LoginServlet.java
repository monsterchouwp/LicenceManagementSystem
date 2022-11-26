package servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import servlet.dao.UserDao;
import servlet.dao.UserDaoImpl;
import servlet.service.LoginService;
import servlet.service.LoginServiceImpl;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String account=request.getParameter("UserName");
		if(account==null){account="";}
		String secret=request.getParameter("Password");
		if(secret==null) secret="";
		RequestDispatcher dispatcher = null;
		LoginService ls=new LoginServiceImpl();
		if(ls.login(account, secret)){//登录成功
			UserDao dao = new UserDaoImpl();
			User user = dao.getUserInfo(account, secret);//获取当前使用者信息
			request.setAttribute("log", "ok");
			session.setAttribute("userName", account);
			if (user.getPriority() == 1) {//普通用户
				dispatcher=request.getRequestDispatcher("/userMainPage.jsp"); 
			} else {//管理员
				dispatcher=request.getRequestDispatcher("/adminMainPage.jsp");
			}
		} else {
			request.setAttribute("log", "error");
			dispatcher=request.getRequestDispatcher("/index.jsp");
		}
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
