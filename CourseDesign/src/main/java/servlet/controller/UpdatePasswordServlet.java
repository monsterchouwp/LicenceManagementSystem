package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;

@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdatePasswordServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取页面tip
		int tip = Integer.parseInt(request.getParameter("tip"));
		OtherService os = new OtherServiceImpl();
		
		if (tip == 1 ) {//用户界面
			String oldPassword=request.getParameter("oldPassword");			
			String newPassword=request.getParameter("newPassword");
			HttpSession session = request.getSession();
			RequestDispatcher dispatcher = null;
			String userName = (String)session.getAttribute("userName");
			if (os.updatePassword(userName, oldPassword, newPassword)) {
				request.setAttribute("msg","<script>alert('修改成功！');</script>");
			} else {
				request.setAttribute("msg","<script>alert('修改失败！');</script>");
			}
			
			dispatcher = request.getRequestDispatcher("/profile.jsp");
			dispatcher.forward(request, response);
	
		} else {
			
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
