package listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import util.MyWebSocket;

public class CountListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {

		ServletContext application = event.getSession().getServletContext();
		event.getSession().setMaxInactiveInterval(15);
		int num = 0;
		if (application.getAttribute("num") != null) {
			num = (Integer) application.getAttribute("num");
		}
		num++;
		application.setAttribute("num", num);
		MyWebSocket.sendMessage(String.valueOf(num));

		// Integer num = (Integer) application.getAttribute("num");
		// if (num == null) {
		// num = new Integer(1);
		// } else {
		// int count = num.intValue();
		// num = new Integer(count + 1);
		// }
		// application.setAttribute("num", num);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		System.out.println("sessionʧЧ");
		ServletContext application = event.getSession().getServletContext();
		int num = 0;
		if (application.getAttribute("num") != null) {
			num = (Integer) application.getAttribute("num");
		}
		num--;
		application.setAttribute("num", num);
		MyWebSocket.sendMessage(String.valueOf(num));

	}

}
