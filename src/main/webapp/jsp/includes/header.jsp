<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    HttpSession userSession = request.getSession(false);
    String userName = null;
    String userEmail = null;
    Integer userId = null;

    if (userSession != null) {
        userName = (String) userSession.getAttribute("userName");
        userEmail = (String) userSession.getAttribute("userEmail");
        userId = (Integer) userSession.getAttribute("userId");
    }
%>

<!-- ================= ACCOUNT BOX CSS ================= -->
<style>
.header .header-2 .flex .account-box {
    position: absolute;
    top: 120%;
    right: 2rem;

    background-color: #fff;
    border-radius: 0.5rem;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
    border: 0.1rem solid #333;
    padding: 2rem;
    text-align: center;

    display: none;
    animation: fadeIn 0.2s linear;
    z-index: 1000;

    /* 🔑 dynamic width */
    width: max-content;
    max-width: 90vw;
}

.header .header-2 .flex .account-box.active {
    display: inline-block;
}

.header .header-2 .flex .account-box p {
    font-size: 2rem;
    color: #666;
    margin-bottom: 1rem;
    white-space: nowrap; /* single line */
}

.header .header-2 .flex .account-box p span {
    color: #8e44ad;
    font-weight: 600;
    white-space: nowrap; /* single line */
}

.header .header-2 .flex .account-box .delete-btn {
    margin-top: 1rem;
    display: inline-block;
    padding: 1rem 3rem;
    cursor: pointer;
    color: #fff;
    font-size: 1.8rem;
    border-radius: 0.5rem;
    text-transform: capitalize;
    background-color: #c0392b;
}

.header .header-2 .flex .account-box .delete-btn:hover {
    background-color: #333;
}

@keyframes fadeIn {
    from {
        transform: translateY(1rem);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}
</style>

<!-- ================= HEADER ================= -->
<header class="header">

    <!-- HEADER TOP (UPDATED AS REQUESTED) -->
    <div class="header-1">
        <div class="flex">
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>

            <p>
                <% if (userName == null) { %>
                    New
                    <a href="${pageContext.request.contextPath}/login">Login</a> |
                    <a href="${pageContext.request.contextPath}/register">Register</a>
                <% } else { %>
                    Welcome, <strong><%= userName %></strong>!
                <% } %>
            </p>
        </div>
    </div>

    <!-- HEADER MAIN -->
    <div class="header-2">
        <div class="flex">

            <!-- LOGO -->
            <a href="${pageContext.request.contextPath}/home" class="logo">E-Mandi</a>

            <!-- NAVBAR -->
            <nav class="navbar">
                <a href="${pageContext.request.contextPath}/home">Home</a>
                <a href="${pageContext.request.contextPath}/shop">Shop</a>
                <a href="${pageContext.request.contextPath}/orders">Orders</a>
                <a href="${pageContext.request.contextPath}/contact">Contact</a>
            </nav>

            <!-- ICONS -->
            <div class="icons">
                <div id="menu-btn" class="fas fa-bars"></div>
                <a href="${pageContext.request.contextPath}/shop" class="fas fa-search"></a>
                <div id="user-btn" class="fas fa-user"></div>

                <% if (userId != null) { %>
                    <a href="${pageContext.request.contextPath}/cart" class="fas fa-shopping-cart"></a>
                <% } %>
            </div>

            <!-- ACCOUNT BOX -->
            <div class="account-box">
                <% if (userName != null && userEmail != null) { %>
                    <p>Username: <span><%= userName %></span></p>
                    <p>Email: <span><%= userEmail %></span></p>
                    <a href="${pageContext.request.contextPath}/logout" class="delete-btn">Logout</a>
                <% } else { %>
                    <p>Please login first!</p>
                    <a href="${pageContext.request.contextPath}/login" class="delete-btn">Login</a>
                <% } %>
            </div>

        </div>
    </div>
</header>

<!-- ================= JAVASCRIPT ================= -->
<script>
(function () {
    const userBtn = document.getElementById('user-btn');
    const menuBtn = document.getElementById('menu-btn');
    const accountBox = document.querySelector('.account-box');
    const navbar = document.querySelector('.navbar');

    userBtn?.addEventListener('click', (e) => {
        e.stopPropagation();
        accountBox.classList.toggle('active');
        navbar?.classList.remove('active');
    });

    menuBtn?.addEventListener('click', (e) => {
        e.stopPropagation();
        navbar.classList.toggle('active');
        accountBox?.classList.remove('active');
    });

    document.addEventListener('click', () => {
        accountBox?.classList.remove('active');
        navbar?.classList.remove('active');
    });

    window.addEventListener('scroll', () => {
        accountBox?.classList.remove('active');
        navbar?.classList.remove('active');
    });
})();
</script>
