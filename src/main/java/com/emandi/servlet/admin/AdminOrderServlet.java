package com.emandi.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emandi.dao.OrderDAO;
import com.emandi.model.Order;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;
    
    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        try {
            if ("delete".equals(action)) {
                handleDelete(request, response);
                return;
            } else if ("updateStatus".equals(action)) {
                handleUpdateStatus(request, response);
                return;
            }
            
            // Display all orders
            List<Order> orders = orderDAO.getAllOrders();
            request.setAttribute("orders", orders);
            
            request.getRequestDispatcher("/jsp/admin/orders.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        try {
            if ("updateStatus".equals(action)) {
                handleUpdateStatus(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    private void handleUpdateStatus(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String paymentStatus = request.getParameter("paymentStatus");
        
        orderDAO.updatePaymentStatus(orderId, paymentStatus);
        
        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
    
    private void handleDelete(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        orderDAO.deleteOrder(id);
        
        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}