<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register - E-Mandi</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">

<style>
/* Layout */
.registration-wrapper {
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
}

/* Tabs */
.tab-buttons {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}

.tab-btn {
    flex: 1;
    padding: 12px;
    color: #fff;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    border: 2px solid transparent;
    transition: 0.3s;
}

/* USER MODE (PURPLE) */
.registration-wrapper.user-mode .tab-btn,
.registration-wrapper.user-mode .btn {
    background: #8e44ad;
    border-color: #8e44ad;
    box-shadow: 0 5px 15px rgba(142, 68, 173, 0.4);
}

/* ADMIN MODE (RED) */
.registration-wrapper.admin-mode .tab-btn,
.registration-wrapper.admin-mode .btn {
    background: linear-gradient(135deg, #e74c3c, #c0392b);
    border-color: #e74c3c;
    box-shadow: 0 5px 15px rgba(231, 76, 60, 0.45);
}

/* Forms */
.registration-form {
    display: none;
}

.registration-form.active {
    display: block;
}

/* Badges */
.user-badge, .admin-badge {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 15px;
}

.user-badge {
    background: #8e44ad;
}

.admin-badge {
    background: #e74c3c;
}

.user-badge i,
.admin-badge i {
    font-size: 32px;
    color: #fff;
}

/* ADMIN WARNING */
.admin-notice {
    display: flex;
    align-items: center;
    gap: 10px;

    background: rgba(231, 76, 60, 0.18);
    border-left: 5px solid #e74c3c;

    color: #fff;
    padding: 14px 16px;
    margin: 15px 0 20px;

    font-size: 14px;
    font-weight: 600;
    line-height: 1.4;

    border-radius: 8px;
    backdrop-filter: blur(6px);

    animation: adminPulse 1.2s ease-in-out infinite alternate;
}

@keyframes adminPulse {
    from {
        box-shadow: 0 0 0 rgba(231, 76, 60, 0.4);
    }
    to {
        box-shadow: 0 0 14px rgba(231, 76, 60, 0.8);
    }
}

/* Login link */
.login-link {
    margin-top: 15px;
    text-align: center;
}
</style>
</head>

<body>

<div class="form-container">
<div class="toy">

<video autoplay loop muted class="background-video">
    <source src="${pageContext.request.contextPath}/videos/register-bg.mp4" type="video/mp4">
</video>

<div class="registration-wrapper user-mode">

    <!-- TAB BAR -->
    <div class="tab-buttons">
        <button type="button" class="tab-btn" onclick="switchTab('user')">
            <i class="fas fa-user"></i> User
        </button>
        <button type="button" class="tab-btn" onclick="switchTab('admin')">
            <i class="fas fa-user-shield"></i> Admin
        </button>
    </div>

    <!-- USER FORM -->
    <form id="userForm" action="${pageContext.request.contextPath}/register" method="post" class="registration-form active">

        <div class="user-badge">
            <i class="fas fa-user"></i>
        </div>

        <h3>User Registration</h3>

        <input type="text" name="name" placeholder="Name" required class="box">
        <input type="email" name="email" placeholder="Email" required class="box">
        <input type="password" name="password" placeholder="Password" required class="box">
        <input type="password" name="cpassword" placeholder="Confirm Password" required class="box">

        <input type="hidden" name="user_type" value="user">
        <input type="submit" value="Register User" class="btn">

        <p class="login-link">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </p>
    </form>

    <!-- ADMIN FORM -->
    <form id="adminForm" action="${pageContext.request.contextPath}/register" method="post" class="registration-form">

        <div class="admin-badge">
            <i class="fas fa-user-shield"></i>
        </div>

        <h3>Admin Registration</h3>

        <p class="admin-notice">
            ⚠️ Admin accounts have full system access
        </p>

        <input type="text" name="name" placeholder="Name" required class="box">
        <input type="email" name="email" placeholder="Email" required class="box">
        <input type="password" name="password" placeholder="Password" required class="box">
        <input type="password" name="cpassword" placeholder="Confirm Password" required class="box">

        <input type="hidden" name="user_type" value="admin">
        <input type="submit" value="Register Admin" class="btn">

        <p class="login-link">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </p>
    </form>

</div>
</div>
</div>

<script>
function switchTab(type) {
    const wrapper = document.querySelector('.registration-wrapper');
    const userForm = document.getElementById('userForm');
    const adminForm = document.getElementById('adminForm');

    wrapper.classList.remove('user-mode', 'admin-mode');
    userForm.classList.remove('active');
    adminForm.classList.remove('active');

    if (type === 'user') {
        wrapper.classList.add('user-mode');
        userForm.classList.add('active');
    } else {
        wrapper.classList.add('admin-mode');
        adminForm.classList.add('active');
    }
}
</script>

</body>
</html>
