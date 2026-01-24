<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<!-- Display messages -->
<c:if test="${not empty successMessage}">
    <div class="message">
        <span>${successMessage}</span>
        <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
    </div>
</c:if>

<c:if test="${not empty errorMessage}">
    <div class="message">
        <span>${errorMessage}</span>
        <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
    </div>
</c:if>

<div class="heading">
    <h3>Contact Us</h3>
    <p><a href="${pageContext.request.contextPath}/home">home</a> / contact</p>
</div>

<section class="contact">
    <form action="${pageContext.request.contextPath}/contact" method="post">
        <h3>Say Something!</h3>
        <input type="text" name="name" required placeholder="Enter your name" class="box">
        <input type="email" name="email" required placeholder="Enter your email" class="box">
        <input type="tel" name="number" required placeholder="Enter your number" class="box" pattern="[0-9]{10}">
        <textarea name="message" class="box" placeholder="Enter your message" required cols="30" rows="10"></textarea>
        <input type="submit" value="Send Message" name="send" class="btn">
    </form>
</section>

<section class="contact-info">
    <h1 class="title">Contact Information</h1>

    <div class="box-container">
        <div class="box">
            <i class="fas fa-phone"></i>
            <h3>Phone Number</h3>
            <p>+91-123-456-7890</p>
            <p>+91-111-222-3333</p>
        </div>

        <div class="box">
            <i class="fas fa-envelope"></i>
            <h3>Email Address</h3>
            <p>info@emandi.com</p>
            <p>support@emandi.com</p>
        </div>

        <div class="box">
            <i class="fas fa-map-marker-alt"></i>
            <h3>Office Address</h3>
            <p>123 Agriculture Street, Mumbai, Maharashtra, India - 400001</p>
        </div>

        <div class="box">
            <i class="fas fa-clock"></i>
            <h3>Working Hours</h3>
            <p>Monday - Saturday: 9:00 AM - 6:00 PM</p>
            <p>Sunday: Closed</p>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>

</body>
</html>