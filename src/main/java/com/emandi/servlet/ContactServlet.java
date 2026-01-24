package com.emandi.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emandi.dao.MessageDAO;
import com.emandi.model.Message;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MessageDAO messageDAO;
    
    @Override
    public void init() throws ServletException {
        messageDAO = new MessageDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/jsp/contact.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        int userId = 0;
        
        // Get user ID if logged in
        if (session != null && session.getAttribute("userId") != null) {
            userId = (Integer) session.getAttribute("userId");
        }
        
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String messageText = request.getParameter("message");
        
        try {
            // Check if message already exists
            if (messageDAO.messageExists(name, email, number, messageText)) {
                request.setAttribute("errorMessage", "Message already sent!");
                request.getRequestDispatcher("/jsp/contact.jsp").forward(request, response);
                return;
            }
            
            // Create new message
            Message message = new Message();
            message.setUserId(userId);
            message.setName(name);
            message.setEmail(email);
            message.setNumber(number);
            message.setMessage(messageText);
            
            // Save message
            if (messageDAO.addMessage(message)) {
                request.setAttribute("successMessage", "Message sent successfully!");
                request.getRequestDispatcher("/jsp/contact.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to send message. Please try again.");
                request.getRequestDispatcher("/jsp/contact.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred. Please try again.");
            request.getRequestDispatcher("/jsp/contact.jsp").forward(request, response);
        }
    }
}