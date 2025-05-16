document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    
    form.addEventListener('submit', function(event) {
        // Email validation
        const email = form.elements['email'].value;
        if (!email.includes('@') || !email.includes('.')) {
            alert('Please enter a valid email address');
            event.preventDefault();
            return;
        }
        
        // Phone validation
        const phone = form.elements['phone'].value;
        if (phone && (phone.length < 10 || phone.length > 15 || !/^\d+$/.test(phone))) {
            alert('Phone number must be 10 digits');
            event.preventDefault();
            return;
        }
        
        // Password validation
        const password = form.elements['password'].value;
        const confirmPassword = form.elements['confirmPassword'].value;
        
        if (password.length < 8) {
            alert('Password must be at least 8 characters');
            event.preventDefault();
            return;
        }
        
        if (password !== confirmPassword) {
            alert('Passwords do not match');
            event.preventDefault();
            return;
        }
    });
});