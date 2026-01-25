<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession adminSession = request.getSession(false);
    String adminName = null;
    
    if (adminSession != null) {
        adminName = (String) adminSession.getAttribute("userName");
    }
%>

<header class="header">
    <div class="flex">
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo">Admin<span>Panel</span></a>

        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products">Products</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
            <a href="${pageContext.request.contextPath}/admin/contacts">Messages</a>
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="user-btn" class="fas fa-user"></div>
        </div>

        <div class="account-box">
            <% if (adminName != null) { %>
                <p>Username : <span><%= adminName %></span></p>
                <p>Email: <span><%= session.getAttribute("userEmail") %></span></p>
                <a href="${pageContext.request.contextPath}/logout" class="delete-btn">Logout</a>
            <% } else { %>
                <p>Please login first!</p>
                <a href="${pageContext.request.contextPath}/login" class="delete-btn">Login</a>
            <% } %>
        </div>
    </div>
</header>

<script>
document.addEventListener('DOMContentLoaded', function () {

    const accountBox = document.querySelector('.header .flex .account-box');


    // Close popup when clicking anywhere else
    document.addEventListener('click', function (e) {
        if (accountBox && userBtn) {
            if (
                !accountBox.contains(e.target) &&
                !userBtn.contains(e.target)
            ) {
                accountBox.classList.remove('active');
            }
        }
    });

});
</script>