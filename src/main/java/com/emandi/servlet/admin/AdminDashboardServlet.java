package com.emandi.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emandi.dao.ProductDAO;
import com.emandi.dao.UserDAO;
import com.emandi.dao.OrderDAO;
import com.emandi.dao.MessageDAO;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private UserDAO userDAO;
    private OrderDAO orderDAO;
    private MessageDAO messageDAO;
    
    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
        messageDAO = new MessageDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get statistics for dashboard
            int totalProducts = productDAO.countTotalProducts();
            int totalUsers = userDAO.countTotalUsers();
            int totalAdmins = userDAO.countUsersByType("admin");
            int normalUsers = userDAO.countUsersByType("user");
            int totalOrders = orderDAO.countTotalOrders();
            int totalMessages = messageDAO.countTotalMessages();
            
            double totalPending = orderDAO.getTotalPendingAmount();
            double totalCompleted = orderDAO.getTotalCompletedAmount();
            
            // Set attributes for JSP
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalAdmins", totalAdmins);
            request.setAttribute("normalUsers", normalUsers);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalMessages", totalMessages);
            request.setAttribute("totalPending", totalPending);
            request.setAttribute("totalCompleted", totalCompleted);
            
            request.getRequestDispatcher("/jsp/admin/dashboard.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}