<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section class="footer">
    <div class="box-container">
        <div class="box">
            <h3>Quick Links</h3>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/shop">Shop</a>
            <a href="${pageContext.request.contextPath}/about">About</a>
            <a href="${pageContext.request.contextPath}/contact">Contact</a>
        </div>

        <div class="box">
            <h3>Extra Links</h3>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register">Register</a>
            <a href="${pageContext.request.contextPath}/cart">Cart</a>
            <a href="${pageContext.request.contextPath}/orders">Orders</a>
        </div>

        <div class="box">
            <h3>Contact Info</h3>
            <p><i class="fas fa-phone"></i> +91-123-456-7890</p>
            <p><i class="fas fa-phone"></i> +91-111-222-3333</p>
            <p><i class="fas fa-envelope"></i> info@emandi.com</p>
            <p><i class="fas fa-map-marker-alt"></i> Mumbai, India - 400001</p>
        </div>

        <div class="box">
            <h3>Follow Us</h3>
            <a href="#"><i class="fab fa-facebook-f"></i> Facebook</a>
            <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#"><i class="fab fa-instagram"></i> Instagram</a>
            <a href="#"><i class="fab fa-linkedin"></i> LinkedIn</a>
        </div>
    </div>

    <p class="credit">&copy; Copyright @ <%= java.time.Year.now().getValue() %> by <span>E-Mandi Team</span> | All Rights Reserved!</p>
</section>