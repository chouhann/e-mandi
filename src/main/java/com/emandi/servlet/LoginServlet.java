package com.emandi.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emandi.dao.UserDAO;
import com.emandi.model.User;
import com.emandi.util.PasswordUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			// Hash password to match with database
			String hashedPassword = PasswordUtil.hashPassword(password);

			// Attempt login
			User user = userDAO.loginUser(email, hashedPassword);

			if (user != null) {
				// Login successful - create session
				HttpSession session = request.getSession();
				session.setAttribute("userId", user.getId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("userEmail", user.getEmail());
				session.setAttribute("userType", user.getUserType());

				// Redirect based on user type
				if (user.isAdmin()) {
					response.sendRedirect(request.getContextPath() + "/admin/dashboard");
				} else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} else {
				// Login failed
				request.setAttribute("errorMessage", "Incorrect email or password!");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Database error occurred. Please try again.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}