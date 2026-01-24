<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is already logged in
    HttpSession userSession = request.getSession(false);
    if (userSession != null && userSession.getAttribute("userId") != null) {
        String userType = (String) userSession.getAttribute("userType");
        
        // Redirect based on user type
        if ("admin".equalsIgnoreCase(userType)) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/home");
        }
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Mandi - Online Agricultural Marketplace</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .landing-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            max-width: 1200px;
            width: 100%;
            overflow: hidden;
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: 600px;
        }

        .landing-left {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: white;
        }

        .landing-left h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .landing-left p {
            font-size: 1.2rem;
            line-height: 1.8;
            margin-bottom: 30px;
            opacity: 0.95;
        }

        .features {
            margin-top: 30px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .feature-item i {
            font-size: 1.5rem;
            margin-right: 15px;
            color: #ffd700;
        }

        .landing-right {
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .landing-right h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
        }

        .landing-right p {
            color: #666;
            margin-bottom: 40px;
            text-align: center;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 100%;
            max-width: 400px;
        }

        .btn {
            padding: 15px 40px;
            font-size: 1.1rem;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
        }

        .btn-secondary:hover {
            background: #667eea;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.2);
        }

        .info-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 40px;
        }

        .info-card {
            text-align: center;
            padding: 20px;
        }

        .info-card i {
            font-size: 2.5rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 10px;
        }

        .info-card h3 {
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .info-card p {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        @media (max-width: 968px) {
            .landing-container {
                grid-template-columns: 1fr;
            }

            .landing-left {
                padding: 40px;
            }

            .landing-left h1 {
                font-size: 2rem;
            }

            .info-cards {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .landing-left {
                padding: 30px;
            }

            .landing-right {
                padding: 30px;
            }

            .landing-left h1 {
                font-size: 1.8rem;
            }

            .landing-right h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>

<div class="landing-container">
    <div class="landing-left">
        <h1>E-Mandi</h1>
        <p>Your trusted online agricultural marketplace connecting farmers directly with buyers. Fresh produce, fair prices, convenient delivery.</p>
        
        <div class="features">
            <div class="feature-item">
                <i class="fas fa-check-circle"></i>
                <span>Fresh Agricultural Products</span>
            </div>
            <div class="feature-item">
                <i class="fas fa-check-circle"></i>
                <span>Direct from Farmers</span>
            </div>
            <div class="feature-item">
                <i class="fas fa-check-circle"></i>
                <span>Fair and Transparent Pricing</span>
            </div>
            <div class="feature-item">
                <i class="fas fa-check-circle"></i>
                <span>Secure Payment Options</span>
            </div>
        </div>

        <div class="info-cards">
            <div class="info-card">
                <i class="fas fa-users"></i>
                <h3>1000+</h3>
                <p>Happy Customers</p>
            </div>
            <div class="info-card">
                <i class="fas fa-seedling"></i>
                <h3>500+</h3>
                <p>Products</p>
            </div>
            <div class="info-card">
                <i class="fas fa-truck"></i>
                <h3>24/7</h3>
                <p>Delivery</p>
            </div>
        </div>
    </div>

    <div class="landing-right">
        <h2>Get Started Today</h2>
        <p>Join thousands of satisfied customers and farmers on our platform</p>
        
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">
                <i class="fas fa-sign-in-alt"></i> Login to Your Account
            </a>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">
                <i class="fas fa-user-plus"></i> Create New Account
            </a>
        </div>

        <div style="margin-top: 40px; text-align: center; color: #999;">
            <p style="font-size: 0.9rem;">
                <i class="fas fa-shield-alt"></i> Secure and Trusted Platform
            </p>
        </div>
    </div>
</div>

</body>
</html>