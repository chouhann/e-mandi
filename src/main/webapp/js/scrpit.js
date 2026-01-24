// User menu toggle
let userBtn = document.querySelector('#user-btn');
if (userBtn) {
    userBtn.onclick = () => {
        let userBox = document.querySelector('.header .header-2 .flex .user-box');
        if (userBox) {
            userBox.classList.toggle('active');
        }
        navbar.classList.remove('active');
    }
}

// Mobile menu toggle
let navbar = document.querySelector('.header .header-2 .flex .navbar');
let menuBtn = document.querySelector('#menu-btn');
if (menuBtn) {
    menuBtn.onclick = () => {
        navbar.classList.toggle('active');
        let userBox = document.querySelector('.header .header-2 .flex .user-box');
        if (userBox) {
            userBox.classList.remove('active');
        }
    }
}

// Close menu on scroll
window.onscroll = () => {
    let userBox = document.querySelector('.header .header-2 .flex .user-box');
    if (userBox) {
        userBox.classList.remove('active');
    }
    navbar.classList.remove('active');
}

// Auto-hide messages after 3 seconds
let messages = document.querySelectorAll('.message');
if (messages.length > 0) {
    messages.forEach(message => {
        setTimeout(() => {
            message.style.display = 'none';
        }, 3000);
    });
}

// Confirm before deleting from cart
let deleteLinks = document.querySelectorAll('.shopping-cart .box-container .box .fa-times');
deleteLinks.forEach(link => {
    link.onclick = function(e) {
        if (!confirm('Remove this item from cart?')) {
            e.preventDefault();
        }
    }
});

// Form validation
let checkoutForm = document.querySelector('.checkout form');
if (checkoutForm) {
    checkoutForm.onsubmit = function(e) {
        let name = checkoutForm.querySelector('input[name="name"]').value.trim();
        let number = checkoutForm.querySelector('input[name="number"]').value.trim();
        let email = checkoutForm.querySelector('input[name="email"]').value.trim();
        let flat = checkoutForm.querySelector('input[name="flat"]').value.trim();
        let street = checkoutForm.querySelector('input[name="street"]').value.trim();
        let city = checkoutForm.querySelector('input[name="city"]').value.trim();
        let state = checkoutForm.querySelector('input[name="state"]').value.trim();
        let country = checkoutForm.querySelector('input[name="country"]').value.trim();
        let pinCode = checkoutForm.querySelector('input[name="pin_code"]').value.trim();

        if (!name || !number || !email || !flat || !street || !city || !state || !country || !pinCode) {
            alert('Please fill in all fields');
            e.preventDefault();
            return false;
        }

        if (!/^[0-9]{10}$/.test(number)) {
            alert('Please enter a valid 10-digit mobile number');
            e.preventDefault();
            return false;
        }

        if (!/^[0-9]{6}$/.test(pinCode)) {
            alert('Please enter a valid 6-digit pin code');
            e.preventDefault();
            return false;
        }

        return confirm('Are you sure you want to place this order?');
    }
}

// Contact form validation
let contactForm = document.querySelector('.contact form');
if (contactForm) {
    contactForm.onsubmit = function(e) {
        let name = contactForm.querySelector('input[name="name"]').value.trim();
        let email = contactForm.querySelector('input[name="email"]').value.trim();
        let number = contactForm.querySelector('input[name="number"]').value.trim();
        let message = contactForm.querySelector('textarea[name="message"]').value.trim();

        if (!name || !email || !number || !message) {
            alert('Please fill in all fields');
            e.preventDefault();
            return false;
        }

        if (!/^[0-9]{10}$/.test(number)) {
            alert('Please enter a valid 10-digit mobile number');
            e.preventDefault();
            return false;
        }

        return true;
    }
}