<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages - Admin Panel</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>

<%@ include file="includes/admin_header.jsp" %>

<section class="messages">
    <h1 class="title">Contact Messages</h1>

    <div class="box-container">
        <c:choose>
            <c:when test="${not empty messages}">
                <c:forEach var="msg" items="${messages}">
                    <div class="box">
                        <p>User ID : <span>${msg.userId}</span></p>
                        <p>Name : <span>${msg.name}</span></p>
                        <p>Email : <span>${msg.email}</span></p>
                        <p>Number : <span>${msg.number}</span></p>
                        <p>Message : <span>${msg.message}</span></p>
                        <a href="${pageContext.request.contextPath}/admin/contacts?action=delete&id=${msg.id}" onclick="return confirm('Delete this message?');" class="delete-btn">Delete Message</a>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty">No messages received yet!</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/admin_script.js"></script>

</body>
</html>