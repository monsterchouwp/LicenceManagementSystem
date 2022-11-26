package servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Entity;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;

@WebServlet("/AddEntityServlet")
public class AddEntityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddEntityServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String eid = request.getParameter("eid");
		String num = request.getParameter("num");
		String message = request.getParameter("message");
		Entity entity = new Entity(Integer.parseInt(eid), name, Integer.parseInt(num), message);
		OtherService os = new OtherServiceImpl();
		RequestDispatcher dispatcher = null;
		if (os.addEntity(entity)) {
			dispatcher = request.getRequestDispatcher("/adminManageEntity.jsp");
		} else {
			request.setAttribute("msg", "<script>alert('添加失败！请检查是否重名重号');</script>");
			dispatcher = request.getRequestDispatcher("/adminManageEntity.jsp");
		}
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
