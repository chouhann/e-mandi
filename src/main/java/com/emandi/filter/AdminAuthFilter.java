package com.emandi.filter;

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

public class AdminAuthFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization code if needed
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession(false);

		// Check if user is logged in and is admin
		if (session == null || session.getAttribute("userId") == null) {
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		String userType = (String) session.getAttribute("userType");
		if (!"admin".equalsIgnoreCase(userType)) {
			res.sendRedirect(req.getContextPath() + "/home");
			return;
		}

		// User is authenticated as admin, proceed with request
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// Cleanup code if needed
	}
}