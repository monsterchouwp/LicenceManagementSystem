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
import servlet.dao.EntityDao;
import servlet.dao.EntityDaoImpl;
import servlet.dao.UserDao;
import servlet.dao.UserDaoImpl;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;


@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
 
    public ApplyServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取页面tip
		int tip = Integer.parseInt(request.getParameter("tip"));
		OtherService os = new OtherServiceImpl();
		if (tip == 1) {//申请
			//获取实体ID
			int eid = Integer.parseInt(request.getParameter("eid"));
			
			HttpSession session = request.getSession();
			User user;
			//获取到存入session的用户姓名
			String name = (String)session.getAttribute("userName");
			UserDao dao = new UserDaoImpl();
			//通过姓名获取到用户信息
			user = dao.getUserWholeInfo(name, "");
			//将记录存入数据库
			RequestDispatcher dispatcher = null;
			if (os.applyEntity(eid, user)) {//成功apply
				request.setAttribute("apply","<script>alert('申请成功！');</script>");
				dispatcher=request.getRequestDispatcher("/select.jsp"); 
			} else {
				request.setAttribute("apply","<script>alert('申请失败！一个人只能一次申请一个或已拥有四个牌照');</script>");
				dispatcher=request.getRequestDispatcher("/select.jsp"); 
			}
			dispatcher.forward(request, response);
		} else {
			//获取实体ID
			int eid = Integer.parseInt(request.getParameter("eid"));
			//调用撤销函数
			if (os.withdraw(eid)) {
				response.sendRedirect("/CourseDesign/state.jsp");
			} else {
				response.sendRedirect("/CourseDesign/state.jsp");
			}
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
