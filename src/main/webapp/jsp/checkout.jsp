<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - E-Mandi</title>
    
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
    <h3>Checkout</h3>
    <p><a href="${pageContext.request.contextPath}/home">home</a> / checkout</p>
</div>

<section class="display-order">
    <c:choose>
        <c:when test="${not empty cartItems}">
            <c:forEach var="item" items="${cartItems}">
                <p>
                    ${item.name} 
                    <span>(₹${item.price}/-)</span>
                </p>
            </c:forEach>
            <div class="grand-total">
                Grand Total : <span>₹<fmt:formatNumber value="${grandTotal}" pattern="#,##0.00"/>/-</span>
            </div>
        </c:when>
        <c:otherwise>
            <p class="empty">Your cart is empty</p>
        </c:otherwise>
    </c:choose>
</section>

<section class="checkout">
    <form action="${pageContext.request.contextPath}/checkout" method="post">
        <h3>Place Your Order</h3>
        
        <div class="flex">
            <div class="inputBox">
                <span>Your Name :</span>
                <input type="text" name="name" required placeholder="Enter your name">
            </div>
            
            <div class="inputBox">
                <span>Your Number :</span>
                <input type="tel" name="number" required placeholder="Enter your number" pattern="[0-9]{10}">
            </div>
            
            <div class="inputBox">
                <span>Your Email :</span>
                <input type="email" name="email" required placeholder="Enter your email">
            </div>
            
            <div class="inputBox">
                <span>Payment Method :</span>
                <select name="method">
                    <option value="cash on delivery">Cash on Delivery</option>
                    <option value="credit card">Credit Card</option>
                    <option value="paypal">PayPal</option>
                    <option value="paytm">Paytm</option>
                </select>
            </div>
            
            <div class="inputBox">
                <span>Address Line 01 :</span>
                <input type="text" name="flat" required placeholder="e.g. flat no.">
            </div>
            
            <div class="inputBox">
                <span>Address Line 02 :</span>
                <input type="text" name="street" required placeholder="e.g. street name">
            </div>
            
            <div class="inputBox">
                <span>City :</span>
                <input type="text" name="city" required placeholder="e.g. Mumbai">
            </div>
            
            <div class="inputBox">
                <span>State :</span>
                <input type="text" name="state" required placeholder="e.g. Maharashtra">
            </div>
            
            <div class="inputBox">
                <span>Country :</span>
                <input type="text" name="country" required placeholder="e.g. India">
            </div>
            
            <div class="inputBox">
                <span>Pin Code :</span>
                <input type="text" name="pin_code" required placeholder="e.g. 123456" pattern="[0-9]{6}">
            </div>
        </div>
        
        <input type="submit" value="Order Now" class="btn" name="order_btn">
    </form>
</section>

<%@ include file="includes/footer.jsp" %>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>

</body>
</html>