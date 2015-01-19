package com.event;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListenerTest implements ServletContextListener{
	
	//Web ������ ����ǰų� ����ɶ�

	@Override
	public void contextDestroyed(ServletContextEvent evt) {
		
		System.out.println("서버 연결...");
		
	}

	@Override
	public void contextInitialized(ServletContextEvent evt) {
		
		System.out.println("서버 종료....");

	}
	
	
	
	
	

}
