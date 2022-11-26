package servlet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Entity;
import model.History;
import model.Record;
import model.RecordID;
import model.User;
import servlet.dao.UserDao;
import servlet.dao.UserDaoImpl;
import servlet.service.LoginService;
import servlet.service.LoginServiceImpl;
import servlet.service.OtherService;
import servlet.service.OtherServiceImpl;


@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		int tip = Integer.parseInt(request.getParameter("tip"));
		String page = request.getParameter("page");
		if(name==null) name = "";
		RequestDispatcher dispatcher = null;
		OtherService os = new OtherServiceImpl();
		if (page.equals("select")) {
			if(tip == 1){//用户的查询
				ArrayList<Entity> entities = os.search(name);
				request.setAttribute("data", entities);
				dispatcher = request.getRequestDispatcher("/select.jsp");
			} else {//管理员的查询
				ArrayList<Entity> entities = os.search(name);
				request.setAttribute("data", entities);
				dispatcher = request.getRequestDispatcher("/adminManageEntity.jsp");
			}
		}
		if (page.equals("history")) {
			ArrayList<History> history = os.searchHistory(name);
			request.setAttribute("data", history);
			dispatcher = request.getRequestDispatcher("/adminHistory.jsp");
		}
		if (page.equals("state")) {
			ArrayList<Record> records = os.searchRecord(name);
			request.setAttribute("data", records);
			dispatcher = request.getRequestDispatcher("/adminState.jsp");
		}
		if (page.equals("autonym")) {
			ArrayList<RecordID> records = os.searchRecordID(name);
			request.setAttribute("data", records);
			dispatcher = request.getRequestDispatcher("/adminAutonymState.jsp");
		}
		if (page.equals("user")) {
			User user = os.searchUser(name);
			ArrayList<User> returnuser = new ArrayList<User>();
			returnuser.add(user);
			request.setAttribute("data", returnuser);
			dispatcher = request.getRequestDispatcher("/adminManageUser.jsp");
		}
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
