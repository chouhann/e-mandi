<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>

<%@ include file="includes/admin_header.jsp" %>

<section class="dashboard">
    <h1 class="title">Dashboard</h1>

    <div class="box-container">
        <div class="box">
            <h3>₹<fmt:formatNumber value="${totalPending}" pattern="#,##0.00"/></h3>
            <p>Pending Payments</p>
        </div>

        <div class="box">
            <h3>₹<fmt:formatNumber value="${totalCompleted}" pattern="#,##0.00"/></h3>
            <p>Completed Payments</p>
        </div>

        <div class="box">
            <h3>${totalOrders}</h3>
            <p>Total Orders</p>
        </div>

        <div class="box">
            <h3>${totalProducts}</h3>
            <p>Products Added</p>
        </div>

        <div class="box">
            <h3>${totalUsers}</h3>
            <p>Total Users</p>
        </div>

        <div class="box">
            <h3>${normalUsers}</h3>
            <p>Normal Users</p>
        </div>

        <div class="box">
            <h3>${totalAdmins}</h3>
            <p>Admin Users</p>
        </div>

        <div class="box">
            <h3>${totalMessages}</h3>
            <p>New Messages</p>
        </div>
    </div>
</section>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/admin_script.js"></script>

</body>
</html>