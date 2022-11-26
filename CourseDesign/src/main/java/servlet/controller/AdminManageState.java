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
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;


@WebServlet("/AdminManageState")
public class AdminManageState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminManageState() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取页面flag
		int flag = Integer.parseInt(request.getParameter("flag"));
		String name = (String)request.getParameter("name");
		OtherService os = new OtherServiceImpl();
		if (flag == 1) {//接受申请
			//获取实体ID
			int eid = Integer.parseInt(request.getParameter("eid"));		
			User user;
			
			UserDao dao = new UserDaoImpl();
			//通过姓名获取到用户信息
			user = dao.getUserInfo(name, "");
			RequestDispatcher dispatcher = null;
			if (os.acceptApplay(user, eid)) {//允许apply
//				request.setAttribute("apply","<script>alert('申请成功！');</script>");
				dispatcher=request.getRequestDispatcher("/adminState.jsp"); 
			} else {
				os.withdraw(eid);//申请失败，把请求驳回
				request.setAttribute("msg","<script>alert('该用户无法获取此牌照！');</script>");
				dispatcher=request.getRequestDispatcher("/adminState.jsp"); 
			}
			dispatcher.forward(request, response);
		} else {//拒绝申请
			//获取实体ID
			int eid = Integer.parseInt(request.getParameter("eid"));
			//调用撤销函数
			if (os.withdraw(eid)) {
				response.sendRedirect("/CourseDesign/adminState.jsp");
			} else {
				response.sendRedirect("/CourseDesign/adminState.jsp");
			}
			
		}	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
