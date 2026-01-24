<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<!-- Display messages -->
<c:if test="${not empty message}">
    <div class="message">
        <span>${message}</span>
        <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
    </div>
</c:if>

<div class="heading">
    <h3>Shopping Cart</h3>
    <p><a href="${pageContext.request.contextPath}/home">home</a> / cart</p>
</div>

<section class="shopping-cart">
    <h1 class="title">Products Added</h1>

    <div class="box-container">
        <c:choose>
            <c:when test="${not empty cartItems}">
                <c:set var="grandTotal" value="0" />
                <c:forEach var="item" items="${cartItems}">
                    <div class="box">
                        <a href="${pageContext.request.contextPath}/cart?action=delete&delete=${item.id}" class="fas fa-times" onclick="return confirm('Remove this item from cart?');"></a>
                        <img src="${pageContext.request.contextPath}/uploaded_img/${item.image}" alt="${item.name}">
                        <div class="name">${item.name}</div>
                        <div class="type">Type: ${item.type}</div>
                        <div class="description">${item.description}</div>
                        <div class="location"><i class="fas fa-map-marker-alt"></i> ${item.address}</div>
                        <div class="contact"><i class="fas fa-phone"></i> ${item.mobileNo}</div>
                        <div class="price">₹<fmt:formatNumber value="${item.price}" pattern="#,##0.00"/>/-</div>
                        <div class="sub-total">Sub Total : <span>₹<fmt:formatNumber value="${item.price}" pattern="#,##0.00"/>/-</span></div>
                    </div>
                    <c:set var="grandTotal" value="${grandTotal + item.price}" />
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty">Your cart is empty</p>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${not empty cartItems}">
        <div style="margin-top: 2rem; text-align:center;">
            <a href="${pageContext.request.contextPath}/cart?delete_all=1" class="delete-btn" onclick="return confirm('Delete all items from cart?');">Delete All</a>
        </div>

        <div class="cart-total">
            <p>Grand Total : <span>₹<fmt:formatNumber value="${grandTotal}" pattern="#,##0.00"/>/-</span></p>
            <div class="flex">
                <a href="${pageContext.request.contextPath}/shop" class="option-btn">Continue Shopping</a>
                <a href="${pageContext.request.contextPath}/checkout" class="btn">Proceed to Checkout</a>
            </div>
        </div>
    </c:if>
</section>

<%@ include file="includes/footer.jsp" %>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>

</body>
</html>