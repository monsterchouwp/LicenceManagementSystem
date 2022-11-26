package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SecurityCheck implements Filter {

	private String[] acceptStrs;

	public void setAcceptStrs(String[] acceptStrs) {
		this.acceptStrs = acceptStrs;
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String userName = (String)session.getAttribute("userName");//获取成功登录的用户的用户名

		if (isAccept(uri) || userName!= null) {//是允许的URI 或者 已经登录了用户
			filterChain.doFilter(req, res);//进行下一个过滤器或传给Servlet
		} else {//重定向到登录页面
			response.sendRedirect("/CourseDesign/index.jsp");			
		}
	}

	private boolean isAccept(String uri) {//是否是可允许访问的uri地址
		boolean result = false;
		for (String str : acceptStrs) {
			if (uri.indexOf(str) != -1) {
				result = true;
				break;
			}
		}
		return result;
	}

	public void init(FilterConfig filterConfig) throws ServletException {//获取分割字符串
		String acceptStr = filterConfig.getInitParameter("accept");
		setAcceptStrs(acceptStr.split(","));
	}

	public void destroy() {
	}

}
