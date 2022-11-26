package servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.service.RegisterService;
import servlet.service.RegisterServiceImpl;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account=request.getParameter("UserName");
		if(account==null){account="";}
		String secret=request.getParameter("Password");
		if(secret==null) secret="";
		String phone = request.getParameter("phoneNum");
		if(phone==null) phone="";
		RequestDispatcher dispatcher = null;
		RegisterService rs = new RegisterServiceImpl();
		if(rs.signIn(account, secret, phone)){//注册成功
			request.setAttribute("reg", "ok");
			dispatcher=request.getRequestDispatcher("/index.jsp"); 
		} else {
			request.setAttribute("reg", "error");
			dispatcher=request.getRequestDispatcher("/register.jsp");
		}
		dispatcher.forward(request, response);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
