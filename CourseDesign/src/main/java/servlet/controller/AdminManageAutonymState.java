package servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import servlet.dao.UserDao;
import servlet.dao.UserDaoImpl;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;


@WebServlet("/AdminManageAutonymState")
public class AdminManageAutonymState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminManageAutonymState() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取页面flag
		int flag = Integer.parseInt(request.getParameter("flag"));
		//获取申请者姓名
		String name = (String)request.getParameter("name");
		OtherService os = new OtherServiceImpl();
		if (flag == 1) {//接受申请
			//获取实体ID
			String idNum = request.getParameter("idNum");		
			String realName = request.getParameter("realName");	
			UserDao dao = new UserDaoImpl();
			//通过姓名获取到用户信息
			User user = dao.getUserWholeInfo(name, "");
			//将记录存入数据库
			RequestDispatcher dispatcher = null;
			if (os.acceptAutonymApplay(user, idNum, realName)) {//允许apply
				System.out.println("Autonym成功");
//				request.setAttribute("apply","<script>alert('申请成功！');</script>");
				dispatcher=request.getRequestDispatcher("/adminAutonymState.jsp"); 
			} else {
				os.withdrawAutonym(name);
				System.out.println("Autonym失败");
//				request.setAttribute("apply","<script>alert('申请失败！');</script>");
				dispatcher=request.getRequestDispatcher("/adminAutonymState.jsp"); 
			}
			dispatcher.forward(request, response);
		} else {//拒绝申请
			System.out.println("Autonym撤销");
			//调用撤销函数
			if (os.withdrawAutonym(name)) {
				response.sendRedirect("/CourseDesign/adminAutonymState.jsp");
			} else {
				response.sendRedirect("/CourseDesign/adminAutonymState.jsp");
			}
			
		}	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
