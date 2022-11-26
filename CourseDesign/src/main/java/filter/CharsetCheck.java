package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;


@WebFilter("/CharsetCheck")
public class CharsetCheck extends HttpFilter implements Filter {
	
	private String charSet;
       

    public CharsetCheck() {
        super();
    }


	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding(charSet);
		System.out.println("设置编码为：" + charSet);
		
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
		if (fConfig.getInitParameter("charset") != null) {
			this.charSet = fConfig.getInitParameter("charset");
		} else {
			this.charSet = "utf-8";
		}
	}

}
