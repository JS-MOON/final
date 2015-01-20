package com.exe.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		boolean flag = false;
		
		if(request instanceof HttpServletRequest){
			
			HttpServletRequest req = (HttpServletRequest)request;
			
			HttpSession session = req.getSession();
			
			if(session != null){
				if(session.getAttribute("session")!=null){
					flag = true;
				}
			}
		}
		
		if(flag){
			chain.doFilter(request, response);
		}else{
			String str = "로그인이 필요합니다.";
			request.setAttribute("str", str);
			RequestDispatcher rd = request.getRequestDispatcher("/Register/Register.action");
			rd.forward(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}
	
	

}































