<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Admin Panel</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>

<%@ include file="includes/admin_header.jsp" %>

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

<section class="add-products">
    <h1 class="title">Add New Product</h1>

    <form action="${pageContext.request.contextPath}/admin/products" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="add">
        <div class="flex">
            <div class="inputBox">
                <input type="text" name="name" class="box" required placeholder="Enter product name">
                <input type="number" name="price" min="0" class="box" required placeholder="Enter product price" step="0.01">
            </div>
            <div class="inputBox">
                <select name="type" class="box" required>
                    <option value="" disabled selected>Select product type</option>
                    <option value="vegetables">Vegetables</option>
                    <option value="fruits">Fruits</option>
                    <option value="grains">Grains</option>
                    <option value="dairy">Dairy</option>
                    <option value="other">Other</option>
                </select>
                <input type="tel" name="mobile_no" class="box" required placeholder="Enter mobile number" pattern="[0-9]{10}">
            </div>
            <div class="inputBox">
                <textarea name="description" class="box" required placeholder="Enter product description" cols="30" rows="3"></textarea>
                <input type="text" name="address" class="box" required placeholder="Enter location/address">
            </div>
            <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box" required>
        </div>
        <input type="submit" value="Add Product" class="btn" name="add_product">
    </form>
</section>

<section class="show-products">
    <h1 class="title">Products Added</h1>

    <div class="box-container">
        <c:choose>
            <c:when test="${not empty products}">
                <c:forEach var="product" items="${products}">
                    <div class="box">
                        <img src="${pageContext.request.contextPath}/uploaded_img/${product.image}" alt="${product.name}">
                        <div class="name">${product.name}</div>
                        <div class="type">Type: ${product.type}</div>
                        <div class="description">${product.description}</div>
                        <div class="location"><i class="fas fa-map-marker-alt"></i> ${product.address}</div>
                        <div class="contact"><i class="fas fa-phone"></i> ${product.mobileNo}</div>
                        <div class="price">₹<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/>/-</div>
                        <div class="flex-btn">
                            <a href="${pageContext.request.contextPath}/admin/products?action=delete&id=${product.id}" class="delete-btn" onclick="return confirm('Delete this product?');">Delete</a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty">No products added yet!</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/admin_script.js"></script>

</body>
</html>