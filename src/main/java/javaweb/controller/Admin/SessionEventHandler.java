package javaweb.controller.Admin;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import javaweb.services.inter.Session;



@WebListener
public class SessionEventHandler implements HttpSessionListener {

	

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("Event => NEW SESSION OPEN");
		Session ss = new javaweb.services.imple.Session();
		if(arg0.getSession().getMaxInactiveInterval()==Integer.MAX_VALUE)
			ss.postNew(arg0.getSession().getId(), true);
		else
			ss.postNew(arg0.getSession().getId(), false);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("Event => SESSION CLOSE");
		Session ss = new javaweb.services.imple.Session();
		ss.put(arg0.getSession().getId(), false);
	}
}
