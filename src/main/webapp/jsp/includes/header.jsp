<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    HttpSession userSession = request.getSession(false);
    String userName = null;
    Integer userId = null;
    
    if (userSession != null) {
        userName = (String) userSession.getAttribute("userName");
        userId = (Integer) userSession.getAttribute("userId");
    }
%>

<header class="header">
    <div class="header-1">
        <div class="flex">
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
            <p>New <a href="${pageContext.request.contextPath}/login">Login</a> | <a href="${pageContext.request.contextPath}/register">Register</a></p>
        </div>
    </div>

    <div class="header-2">
        <div class="flex">
            <a href="${pageContext.request.contextPath}/home" class="logo">E-Mandi</a>

            <nav class="navbar">
                <a href="${pageContext.request.contextPath}/home">Home</a>
                <a href="${pageContext.request.contextPath}/shop">Shop</a>
                <a href="${pageContext.request.contextPath}/about">About</a>
                <a href="${pageContext.request.contextPath}/contact">Contact</a>
                <a href="${pageContext.request.contextPath}/orders">Orders</a>
            </nav>

            <div class="icons">
                <div id="menu-btn" class="fas fa-bars"></div>
                <a href="${pageContext.request.contextPath}/shop" class="fas fa-search"></a>
                <div id="user-btn" class="fas fa-user"></div>
                <% 
                    if (userId != null) {
                        com.emandi.dao.CartDAO cartDAO = new com.emandi.dao.CartDAO();
                        try {
                            int cartCount = cartDAO.countCartItems(userId);
                %>
                            <a href="${pageContext.request.contextPath}/cart" class="cart-btn">
                                <i class="fas fa-shopping-cart"></i>
                                <span>(<%= cartCount %>)</span>
                            </a>
                <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                %>
                        <a href="${pageContext.request.contextPath}/cart" class="fas fa-shopping-cart"></a>
                <%
                    }
                %>
            </div>

            <div class="user-box">
                <% if (userName != null) { %>
                    <p>Username : <span><%= userName %></span></p>
                    <a href="${pageContext.request.contextPath}/logout" class="delete-btn">Logout</a>
                <% } else { %>
                    <p>Please login first!</p>
                    <a href="${pageContext.request.contextPath}/login" class="delete-btn">Login</a>
                <% } %>
            </div>
        </div>
    </div>
</header>