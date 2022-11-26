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
import servlet.service.LoginService;
import servlet.service.LoginServiceImpl;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;


@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateUserServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取页面tip
		int tip = Integer.parseInt(request.getParameter("tip"));
		OtherService os = new OtherServiceImpl();
		
		if (tip == 1 ) {//用户界面
			//HttpSession session=request.getSession();
			String userName=request.getParameter("name");			
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			RequestDispatcher dispatcher = null;
			User user = new User();
			user.setName(userName);
			user.setAddress(address);
			user.setPhone(phone);
			if (os.updateUser(user, tip)) {
				request.setAttribute("modify", "ok");
				
			} else {
				request.setAttribute("modify", "error");
			}
			dispatcher = request.getRequestDispatcher("/profile.jsp");
			dispatcher.forward(request, response);
		} else {
			String userName=request.getParameter("name");			
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			String password = request.getParameter("password");
			int priority = Integer.parseInt(request.getParameter("priority"));
			String realName = request.getParameter("realName");
			String idNum = request.getParameter("idNum");
			String message = request.getParameter("message");
			RequestDispatcher dispatcher = null;
			User user = new User();
			user.setName(userName);user.setPassword(password);
			user.setAddress(address);user.setPriority(priority);
			user.setPhone(phone);user.setRealName(realName);
			user.setIdentifyNum(idNum);user.setMessage(message);
			if (os.updateUser(user, tip)) {
				request.setAttribute("modify", "ok");
				
			} else {
				request.setAttribute("modify", "error");
			}
			dispatcher = request.getRequestDispatcher("/adminManageUser.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
