<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
</head>
<body>

<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
    <div class="message">
        <span><%= errorMessage %></span>
        <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
    </div>
<%
    }
%>

<div class="form-container">
    <div class="toy">
        <video autoplay loop muted class="background-video">
            <source src="${pageContext.request.contextPath}/videos/login-bg.mp4" type="video/mp4">
        </video>
        
        <form action="${pageContext.request.contextPath}/login" method="post" class="old">
            <h1>Welcome to E-Mandi</h1>
            <h1>-------------------------------</h1>
            <h3>Login Now</h3>
            
            <input type="email" name="email" placeholder="Enter your email" required class="box">
            <input type="password" name="password" placeholder="Enter your password" required class="box">
            
            <input type="submit" name="submit" value="Login Now" class="btn">
            
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register Now</a></p>
        </form>
        
        <h2>Welcome to E-Mandi</h2>
    </div>
</div>

</body>
</html>