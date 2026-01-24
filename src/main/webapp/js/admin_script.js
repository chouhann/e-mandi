// User menu toggle
let userBtn = document.querySelector('#user-btn');
if (userBtn) {
    userBtn.onclick = () => {
        let accountBox = document.querySelector('.header .flex .account-box');
        if (accountBox) {
            accountBox.classList.toggle('active');
        }
        navbar.classList.remove('active');
    }
}

// Mobile menu toggle
let navbar = document.querySelector('.header .flex .navbar');
let menuBtn = document.querySelector('#menu-btn');
if (menuBtn) {
    menuBtn.onclick = () => {
        navbar.classList.toggle('active');
        let accountBox = document.querySelector('.header .flex .account-box');
        if (accountBox) {
            accountBox.classList.remove('active');
        }
    }
}

// Close menu on scroll
window.onscroll = () => {
    let accountBox = document.querySelector('.header .flex .account-box');
    if (accountBox) {
        accountBox.classList.remove('active');
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

// Product form validation
let productForm = document.querySelector('.add-products form');
if (productForm) {
    productForm.onsubmit = function(e) {
        let name = productForm.querySelector('input[name="name"]').value.trim();
        let price = productForm.querySelector('input[name="price"]').value;
        let type = productForm.querySelector('select[name="type"]').value;
        let mobileNo = productForm.querySelector('input[name="mobile_no"]').value.trim();
        let description = productForm.querySelector('textarea[name="description"]').value.trim();
        let address = productForm.querySelector('input[name="address"]').value.trim();
        let image = productForm.querySelector('input[name="image"]').files[0];

        if (!name || !price || !type || !mobileNo || !description || !address) {
            alert('Please fill in all fields');
            e.preventDefault();
            return false;
        }

        if (parseFloat(price) <= 0) {
            alert('Please enter a valid price');
            e.preventDefault();
            return false;
        }

        if (!/^[0-9]{10}$/.test(mobileNo)) {
            alert('Please enter a valid 10-digit mobile number');
            e.preventDefault();
            return false;
        }

        if (!image && productForm.querySelector('input[name="action"]').value === 'add') {
            alert('Please select an image');
            e.preventDefault();
            return false;
        }

        if (image) {
            let allowedTypes = ['image/jpeg', 'image/jpg', 'image/png'];
            if (!allowedTypes.includes(image.type)) {
                alert('Please select a valid image file (JPG, JPEG, or PNG)');
                e.preventDefault();
                return false;
            }

            if (image.size > 2 * 1024 * 1024) {
                alert('Image size should not exceed 2MB');
                e.preventDefault();
                return false;
            }
        }

        return true;
    }
}

// Confirm before deletion
let deleteButtons = document.querySelectorAll('.delete-btn');
deleteButtons.forEach(btn => {
    if (btn.getAttribute('onclick')) {
        // Already has onclick handler with confirm
        return;
    }
    btn.onclick = function(e) {
        if (!confirm('Are you sure you want to delete this?')) {
            e.preventDefault();
            return false;
        }
    }
});

// Order status update confirmation
let updateForms = document.querySelectorAll('.placed-orders form');
updateForms.forEach(form => {
    form.onsubmit = function(e) {
        let select = form.querySelector('select[name="paymentStatus"]');
        if (select.value === '') {
            alert('Please select a payment status');
            e.preventDefault();
            return false;
        }
        return confirm('Are you sure you want to update the payment status?');
    }
});