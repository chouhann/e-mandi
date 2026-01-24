<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
</head>
<body>

<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
    
    if (errorMessage != null) {
%>
    <div class="message">
        <span><%= errorMessage %></span>
        <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
    </div>
<%
    }
    
    if (successMessage != null) {
%>
    <div class="message success">
        <span><%= successMessage %></span>
        <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
    </div>
<%
    }
%>

<div class="form-container">
    <div class="toy">
        <video autoplay loop muted class="background-video">
            <source src="${pageContext.request.contextPath}/videos/register-bg.mp4" type="video/mp4">
        </video>
        
        <form action="${pageContext.request.contextPath}/register" method="post" class="new">
            <h3>Register Now</h3>
            
            <input type="text" name="name" placeholder="Enter your name" required class="box">
            <input type="email" name="email" placeholder="Enter your email" required class="box">
            <input type="password" name="password" placeholder="Enter your password" required class="box">
            <input type="password" name="cpassword" placeholder="Confirm your password" required class="box">
            
            <select name="user_type" class="box">
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
            
            <input type="submit" name="submit" value="Register Now" class="btn">
            
            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login Now</a></p>
        </form>
    </div>
</div>

</body>
</html>