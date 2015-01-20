package com.exe.event;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//서블릿의 라이프 사이클
//HttpSessionEvent : 세션이 만들어져서 접속정보를 DB에 저장할 때
//httpSessionAttributeListener : 세션이 종료되서 DB의 접속 정보를 지울때
//Listener 

public class CountManager implements HttpSessionListener {

	private static CountManager countManager;
	private static int count;

	public CountManager() {

		countManager = this;

	}

	public static synchronized CountManager getinstansce() throws Exception {

		if (countManager == null)
			countManager = new CountManager();

		return countManager;

	}

	public static int getCount() {
		return count;
	}

	@Override
	public void sessionCreated(HttpSessionEvent evt) {

		HttpSession session = evt.getSession();
		session.setMaxInactiveInterval(20 * 60);

		count++;

		System.out.print(session.getId() + ": 세션 생성,");
		System.out.println("접속자수: " + count);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent evt) {

		HttpSession session = evt.getSession();

		count--;

		System.out.print(session.getId() + ": 세션 소멸,");
		System.out.println("접속자수: " + count);
	}

}























