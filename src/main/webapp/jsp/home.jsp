<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div class="home-bg">
    <section class="home">
        <div class="content">
            <span>Don't Compromise on Quality</span>
            <h3>Buy Fresh Agricultural Products</h3>
            <p>Fresh from farms directly to your doorstep. Supporting local farmers, delivering quality produce.</p>
            <a href="${pageContext.request.contextPath}/shop" class="white-btn">Discover More</a>
        </div>
    </section>
</div>

<section class="home-category">
    <h1 class="title">Shop by Category</h1>

    <div class="box-container">
        <a href="${pageContext.request.contextPath}/shop" class="box">
            <img src="${pageContext.request.contextPath}/images/cat-1.png" alt="Vegetables">
            <b>Vegetables</b>
        </a>

        <a href="${pageContext.request.contextPath}/shop" class="box">
            <img src="${pageContext.request.contextPath}/images/cat-2.png" alt="Fruits">
            <b>Fruits</b>
        </a>

        <a href="${pageContext.request.contextPath}/shop" class="box">
            <img src="${pageContext.request.contextPath}/images/cat-3.png" alt="Grains">
            <b>Grains</b>
        </a>

        <a href="${pageContext.request.contextPath}/shop" class="box">
            <img src="${pageContext.request.contextPath}/images/cat-4.png" alt="Dairy">
            <b>Dairy Products</b>
        </a>
    </div>
</section>

<section class="products">
    <h1 class="title">Latest Products</h1>

    <div class="box-container">
        <c:choose>
            <c:when test="${not empty products}">
                <c:forEach var="product" items="${products}">
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="box">
                        <img src="${pageContext.request.contextPath}/uploaded_img/${product.image}" alt="${product.name}">
                        <div class="name">${product.name}</div>
                        <div class="price">₹<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/>/-</div>
                        <input type="hidden" name="product_name" value="${product.name}">
                        <input type="hidden" name="product_price" value="${product.price}">
                        <input type="hidden" name="product_image" value="${product.image}">
                        <input type="hidden" name="product_type" value="${product.type}">
                        <input type="hidden" name="product_mobile_no" value="${product.mobileNo}">
                        <input type="hidden" name="product_description" value="${product.description}">
                        <input type="hidden" name="product_address" value="${product.address}">
                        <input type="submit" class="btn" name="add_to_cart" value="Add to Cart">
                    </form>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="empty">No products available yet!</p>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="load-more" style="margin-top: 2rem; text-align:center">
        <a href="${pageContext.request.contextPath}/shop" class="option-btn">Load More</a>
    </div>
</section>

<section class="about">
    <div class="flex">
        <div class="image">
            <img src="${pageContext.request.contextPath}/images/about-img.jpg" alt="About E-Mandi">
        </div>

        <div class="content">
            <h3>About Us</h3>
            <p>E-Mandi is your trusted online agricultural marketplace connecting farmers directly with buyers. We believe in fair trade, quality produce, and supporting local communities.</p>
            <p>Our platform ensures that farmers get the right price for their hard work while consumers get fresh, quality products at reasonable rates.</p>
            <a href="${pageContext.request.contextPath}/about" class="btn">Read More</a>
        </div>
    </div>
</section>

<section class="home-contact">
    <div class="content">
        <h3>Have Any Questions?</h3>
        <p>We're here to help! Reach out to us for any queries about our products, delivery, or services.</p>
        <a href="${pageContext.request.contextPath}/contact" class="white-btn">Contact Us</a>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>

</body>
</html>