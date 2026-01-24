
<!-- error404.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Not Found - E-Mandi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .error-container { text-align: center; background: white; padding: 50px; border-radius: 10px; box-shadow: 0 10px 40px rgba(0,0,0,0.2); max-width: 500px; }
        .error-container .error-code { font-size: 120px; font-weight: bold; color: #667eea; margin-bottom: 10px; }
        .error-container h1 { font-size: 32px; color: #333; margin-bottom: 15px; }
        .error-container p { color: #666; margin-bottom: 30px; font-size: 16px; }
        .btn { display: inline-block; padding: 12px 30px; background: #667eea; color: white; text-decoration: none; border-radius: 5px; transition: 0.3s; margin: 5px; }
        .btn:hover { background: #764ba2; transform: translateY(-2px); }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-code">404</div>
        <h1>Page Not Found</h1>
        <p>The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
        <a href="${pageContext.request.contextPath}/home" class="btn">
            <i class="fas fa-home"></i> Go Home
        </a>
        <a href="${pageContext.request.contextPath}/shop" class="btn">
            <i class="fas fa-shopping-bag"></i> Browse Shop
        </a>
    </div>
</body>
</html>
