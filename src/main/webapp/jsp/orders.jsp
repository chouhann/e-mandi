<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div class="heading">
    <h3>Your Orders</h3>
    <p><a href="${pageContext.request.contextPath}/home">home</a> / orders</p>
</div>

<section class="placed-orders">
    <h1 class="title">Placed Orders</h1>
    
    <div class="box-container">
        <c:choose>
            <c:when test="${not empty orders}">
                <c:forEach var="order" items="${orders}">
                    <div class="box">
                        <p>Placed on : <span><fmt:formatDate value="${order.placedOn}" pattern="dd-MMM-yyyy"/></span></p>
                        <p>Name : <span>${order.name}</span></p>
                        <p>Number : <span>${order.number}</span></p>
                        <p>Email : <span>${order.email}</span></p>
                        <p>Address : <span>${order.address}</span></p>
                        <p>Payment Method : <span>${order.method}</span></p>
                        <p>Your Orders : <span>${order.totalProducts}</span></p>
                        <p>Total Price : <span>₹<fmt:formatNumber value="${order.totalPrice}" pattern="#,##0.00"/>/-</span></p>
                        <p>Payment Status : 
                            <span style="color: ${order.paymentStatus == 'pending' ? 'red' : 'green'};">
                                ${order.paymentStatus}
                            </span>
                        </p>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty">No orders placed yet!</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>

</body>
</html>