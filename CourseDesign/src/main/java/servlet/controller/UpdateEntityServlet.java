package servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Entity;
import model.User;
import servlet.service.LoginService;
import servlet.service.LoginServiceImpl;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;


@WebServlet("/UpdateEntityServlet")
public class UpdateEntityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateEntityServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取页面tip
		OtherService os = new OtherServiceImpl();
		int tip = Integer.parseInt(request.getParameter("tip"));
		String o_eid;
		String eid;
		String name;
		String num;
		String message;
		if (tip == 1) {
			o_eid = request.getParameter("o_eid");
			eid = request.getParameter("eid");
			name=request.getParameter("name");			
			num=request.getParameter("num");
			message=request.getParameter("message");
		} else {
			o_eid = request.getParameter("o_eid1");
			eid = request.getParameter("eid1");
			name=request.getParameter("name1");			
			num=request.getParameter("num1");
			message=request.getParameter("message1");
		}
		
		RequestDispatcher dispatcher = null;
		Entity entity = new Entity(Integer.parseInt(eid), name, Integer.parseInt(num), message);
		
		if (os.updateEntity(entity, Integer.parseInt(o_eid))) {
			System.out.println("UpdateEntityServlet:修改成功");
		} else {
			System.out.println("UpdateEntityServlet:修改失败！");
			request.setAttribute("msg","<script>alert('修改失败！请检查牌序号或牌名称是否重复！');</script>");
		}
		dispatcher = request.getRequestDispatcher("/adminManageEntity.jsp");
		dispatcher.forward(request, response);
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
