package com.emandi.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emandi.dao.CartDAO;
import com.emandi.dao.OrderDAO;
import com.emandi.model.Cart;
import com.emandi.model.Order;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;
    private OrderDAO orderDAO;
    
    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
        orderDAO = new OrderDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        
        try {
            // Get cart items for display
            List<Cart> cartItems = cartDAO.getCartItemsByUserId(userId);
            
            // Calculate grand total
            double grandTotal = 0;
            for (Cart item : cartItems) {
                grandTotal += item.getPrice();
            }
            
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("grandTotal", grandTotal);
            
            request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        
        // Get form data
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String email = request.getParameter("email");
        String method = request.getParameter("method");
        
        // Build address from form fields
        String flat = request.getParameter("flat");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String pinCode = request.getParameter("pin_code");
        
        String address = "flat no. " + flat + ", " + street + ", " + 
                        city + ", " + state + ", " + country + " - " + pinCode;
        
        try {
            // Get cart items
            List<Cart> cartItems = cartDAO.getCartItemsByUserId(userId);
            
            if (cartItems.isEmpty()) {
                request.setAttribute("errorMessage", "Your cart is empty");
                doGet(request, response);
                return;
            }
            
            // Calculate total and build products string
            double cartTotal = 0;
            StringBuilder productsBuilder = new StringBuilder();
            
            for (Cart item : cartItems) {
                if (productsBuilder.length() > 0) {
                    productsBuilder.append(", ");
                }
                productsBuilder.append(item.getName());
                cartTotal += item.getPrice();
            }
            
            String totalProducts = productsBuilder.toString();
            
            // Check if order already exists
            if (orderDAO.orderExists(name, number, email, method, address, 
                                     totalProducts, cartTotal)) {
                request.setAttribute("errorMessage", "Order already placed!");
                doGet(request, response);
                return;
            }
            
            // Create new order
            Order order = new Order();
            order.setUserId(userId);
            order.setName(name);
            order.setNumber(number);
            order.setEmail(email);
            order.setMethod(method);
            order.setAddress(address);
            order.setTotalProducts(totalProducts);
            order.setTotalPrice(cartTotal);
            order.setPlacedOn(new Date());
            order.setPaymentStatus("pending");
            
            // Place order
            if (orderDAO.placeOrder(order)) {
                // Clear cart after successful order
                cartDAO.deleteAllCartItems(userId);
                
                request.setAttribute("successMessage", "Order placed successfully!");
                response.sendRedirect(request.getContextPath() + "/orders");
            } else {
                request.setAttribute("errorMessage", "Failed to place order. Please try again.");
                doGet(request, response);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred. Please try again.");
            doGet(request, response);
        }
    }
}