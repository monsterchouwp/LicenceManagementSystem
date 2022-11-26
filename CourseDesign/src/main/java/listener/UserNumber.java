package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class UserNumber implements HttpSessionListener, ServletContextListener {

	private int userNum;
	
    public UserNumber() {
    	userNum = 0;
    }

	
    public void sessionCreated(HttpSessionEvent se)  { 
    	this.userNum++;
    	ServletContext context = se.getSession().getServletContext();
    	context.setAttribute("userNums", this.userNum);
    }

	
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	if (this.userNum == 0) {
    		
    	} else {
    		this.userNum--;
    	}
    	ServletContext context = se.getSession().getServletContext();
    	context.setAttribute("userNums", this.userNum);
    }
	
    public void contextDestroyed(ServletContextEvent sce) {

	}

	public void contextInitialized(ServletContextEvent sce) {

		ServletContext context = sce.getServletContext();
		context.setAttribute("userNums", 0);
	}
}
