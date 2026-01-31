package com.emandi.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emandi.dao.UserDAO;
import com.emandi.model.User;
import com.emandi.util.PasswordUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get registration type from URL parameter
        String type = request.getParameter("type");
        
        if ("admin".equals(type)) {
            // Show admin registration page
            request.getRequestDispatcher("/register_admin.jsp").forward(request, response);
        } else {
            // Default: show user registration page
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("cpassword");
        String userType = request.getParameter("user_type"); // Hidden field
        
        try {
            // Check if user already exists
            if (userDAO.userExists(email)) {
                request.setAttribute("errorMessage", "User already exists!");
                
                // Forward back to appropriate page
                if ("admin".equals(userType)) {
                    request.getRequestDispatcher("/register_admin.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                }
                return;
            }
            
            // Check if passwords match
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match!");
                
                if ("admin".equals(userType)) {
                    request.getRequestDispatcher("/register_admin.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                }
                return;
            }
            
            // Hash password
            String hashedPassword = PasswordUtil.hashPassword(password);
            
            // Create new user
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(hashedPassword);
            user.setUserType(userType);
            
            // Register user
            if (userDAO.registerUser(user)) {
                request.setAttribute("successMessage", "Registered successfully!");
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                
                if ("admin".equals(userType)) {
                    request.getRequestDispatcher("/register_admin.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred. Please try again.");
            
            if ("admin".equals(userType)) {
                request.getRequestDispatcher("/register_admin.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        }
    }
}