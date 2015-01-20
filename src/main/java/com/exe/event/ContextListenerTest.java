package com.exe.event;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListenerTest implements ServletContextListener{
	
	//Web 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙품킬占� 占쏙옙占쏙옙占�

	@Override
	public void contextDestroyed(ServletContextEvent evt) {
		
		System.out.println("�꽌踰� �뿰寃�...");
		
	}



	@Override
	public void contextInitialized(ServletContextEvent evt) {
		
		System.out.println("�꽌踰� 醫낅즺....");

	}
	
	
	
	
	

}
