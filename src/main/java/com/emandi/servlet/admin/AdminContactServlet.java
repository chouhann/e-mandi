package com.emandi.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emandi.dao.MessageDAO;
import com.emandi.model.Message;

@WebServlet("/admin/contacts")
public class AdminContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MessageDAO messageDAO;
    
    @Override
    public void init() throws ServletException {
        messageDAO = new MessageDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        try {
            if ("delete".equals(action)) {
                handleDelete(request, response);
                return;
            }
            
            // Display all messages
            List<Message> messages = messageDAO.getAllMessages();
            request.setAttribute("messages", messages);
            
            request.getRequestDispatcher("/jsp/admin/contacts.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    private void handleDelete(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        messageDAO.deleteMessage(id);
        
        response.sendRedirect(request.getContextPath() + "/admin/contacts");
    }
}