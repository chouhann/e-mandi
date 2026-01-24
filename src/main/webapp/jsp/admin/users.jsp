<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users - Admin Panel</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>

<%@ include file="includes/admin_header.jsp" %>

<section class="accounts">
    <h1 class="title">User Accounts</h1>

    <div class="box-container">
        <c:choose>
            <c:when test="${not empty users}">
                <c:forEach var="user" items="${users}">
                    <div class="box">
                        <p>User ID : <span>${user.id}</span></p>
                        <p>Username : <span>${user.name}</span></p>
                        <p>Email : <span>${user.email}</span></p>
                        <p>User Type : <span style="color: ${user.userType == 'admin' ? 'orange' : 'green'};">${user.userType}</span></p>
                        <a href="${pageContext.request.contextPath}/admin/users?action=delete&id=${user.id}" onclick="return confirm('Delete this user?');" class="delete-btn">Delete User</a>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty">No users registered yet!</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/admin_script.js"></script>

</body>
</html>