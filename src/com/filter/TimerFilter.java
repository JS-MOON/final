package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

//Filter
//필터는 웹 어플리케이션에서 사용하는 서블릿이나 jsp에 도착하기 전에
//request의 내용을 조작한 후 서블릿이나 jsp에 보내는 역활을 한다.
//주로 보안을 위해 사용하고 요청정보를 로그파일로 작성, 인코딩 작업,
//로그인하지 못하면 카페에 접속하지 못하게 하는 기능.

public class TimerFilter implements Filter {

	private FilterConfig config;

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		long before = System.currentTimeMillis();

		chain.doFilter(request, response);// 목적지로 데이터를 전송		chain 작업을 해야지만 필터를 거친 후에도 진행됨

		long after = System.currentTimeMillis();

		String uri;

		if (request instanceof HttpServletRequest) {

			HttpServletRequest req = (HttpServletRequest) request;

			uri = req.getRequestURI();

			// 데이터 전송 시간
			//config.getServletContext().log(uri + ":" + (after - before) + "ms");// 로그파일 만들기
			System.out.println(uri + ":" + (after - before) + "ms");								

		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {

		this.config = config;
	}
}

























