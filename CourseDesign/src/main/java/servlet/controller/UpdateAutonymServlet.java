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

@WebServlet("/UpdateAutonymServlet")
public class UpdateAutonymServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateAutonymServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		OtherService os = new OtherServiceImpl();
		
		
		String autonym=request.getParameter("autonym");			
		String idNum=request.getParameter("idNum");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String userName = (String)session.getAttribute("userName");
		int flag = os.updateAutonym(userName, autonym, idNum);
		if (flag == 1) {
			request.setAttribute("msg","<script>alert('申请成功！');</script>");
		} else if (flag == -3) {
			request.setAttribute("msg","<script>alert('申请失败！请勿重复申请！');</script>");
		} else {
			request.setAttribute("msg","<script>alert('申请失败！身份证重名或已实名');</script>");
		}
			
		dispatcher = request.getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
