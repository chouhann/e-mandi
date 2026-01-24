<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - E-Mandi</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div class="heading">
    <h3>About Us</h3>
    <p><a href="${pageContext.request.contextPath}/home">home</a> / about</p>
</div>

<section class="about">
    <div class="flex">
        <div class="image">
            <img src="${pageContext.request.contextPath}/images/about-img.jpg" alt="About E-Mandi">
        </div>

        <div class="content">
            <h3>Why Choose Us?</h3>
            <p>E-Mandi is India's premier online agricultural marketplace, dedicated to connecting farmers directly with buyers. We believe in empowering farmers and providing consumers with fresh, quality agricultural products.</p>
            <p>Our mission is to eliminate middlemen, ensure fair prices for farmers, and deliver farm-fresh products to consumers at competitive rates. We support sustainable farming practices and local communities.</p>
            <p>With a vast network of verified farmers and a commitment to quality, we're transforming the way agricultural products are bought and sold in India.</p>
            <a href="${pageContext.request.contextPath}/contact" class="btn">Contact Us</a>
        </div>
    </div>
</section>

<section class="reviews">
    <h1 class="title">Client's Reviews</h1>

    <div class="box-container">
        <div class="box">
            <img src="${pageContext.request.contextPath}/images/pic-1.png" alt="Customer">
            <p>Excellent service! Fresh vegetables delivered right to my doorstep. The quality is outstanding and prices are very reasonable.</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>Rajesh Kumar</h3>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/pic-2.png" alt="Customer">
            <p>As a farmer, E-Mandi has been a game-changer for me. I get fair prices for my produce and direct access to buyers.</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <h3>Priya Sharma</h3>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/pic-3.png" alt="Customer">
            <p>Great platform! The variety of products is amazing and everything is fresh. Customer service is also very responsive.</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>Amit Patel</h3>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/pic-4.png" alt="Customer">
            <p>I love supporting local farmers through E-Mandi. The products are organic and the delivery is always on time.</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <h3>Sneha Reddy</h3>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/pic-5.png" alt="Customer">
            <p>Highly recommended! The quality of fruits and vegetables is exceptional. Will definitely order again.</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>Vikram Singh</h3>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/pic-6.png" alt="Customer">
            <p>Best agricultural marketplace in India! Fair prices, quality products, and excellent service. Thank you E-Mandi!</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <h3>Anjali Verma</h3>
        </div>
    </div>
</section>

<section class="authors">
    <h1 class="title">Our Team</h1>

    <div class="box-container">
        <div class="box">
            <img src="${pageContext.request.contextPath}/images/author-1.jpg" alt="Team Member">
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
            <h3>Rahul Mehta</h3>
            <span>Founder and CEO</span>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/author-2.jpg" alt="Team Member">
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
            <h3>Neha Gupta</h3>
            <span>Operations Manager</span>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/author-3.jpg" alt="Team Member">
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
            <h3>Arjun Desai</h3>
            <span>Technology Lead</span>
        </div>

        <div class="box">
            <img src="${pageContext.request.contextPath}/images/author-4.jpg" alt="Team Member">
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
            <h3>Meera Shah</h3>
            <span>Marketing Head</span>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>

</body>
</html>