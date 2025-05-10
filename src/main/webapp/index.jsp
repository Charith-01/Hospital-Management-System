<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./partials/header.jsp" %>

        <!-- Hero Section -->
        <section class="relative w-full h-screen">
            <!-- Swiper Container -->
            <div class="swiper mySwiper w-full h-full">
                <div class="swiper-wrapper">
    
                    <!-- Slide 1 -->
                    <div class="swiper-slide relative w-full h-full">
                        <img src="assets/hero1.jpg" alt="Hospital" class="w-full h-full object-cover">
                        <div class="absolute inset-0 bg-black/50 flex flex-col items-center justify-center text-center text-white px-6">
                            <h1 class="text-4xl md:text-6xl font-bold">Your Health, Our Priority</h1>
                            <p class="text-lg md:text-xl mt-4">Providing world-class healthcare services with compassion and expertise.</p>
                            <a href="appoinment.jsp" class="mt-6 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg text-lg transition">
                                <i class="fas fa-calendar-alt mr-2"></i> Book an Appointment
                            </a>
                        </div>
                    </div>
    
                    <!-- Slide 2 -->
                    <div class="swiper-slide relative w-full h-full">
                        <img src="assets/hero2.jpg" alt="Doctor" class="w-full h-full object-cover">
                        <div class="absolute inset-0 bg-black/50 flex flex-col items-center justify-center text-center text-white px-6">
                            <h1 class="text-4xl md:text-6xl font-bold">Advanced Medical Care</h1>
                            <p class="text-lg md:text-xl mt-4">Bringing you the latest in medical technology and expert care.</p>
                            <a href="appoinment.jsp" class="mt-6 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg text-lg transition">
                                <i class="fas fa-calendar-alt mr-2"></i> Book an Appointment
                            </a>
                        </div>
                    </div>
    
                    <!-- Slide 3 -->
                    <div class="swiper-slide relative w-full h-full">
                        <img src="assets/hero3.jpg" alt="Medical Team" class="w-full h-full object-cover">
                        <div class="absolute inset-0 bg-black/50 flex flex-col items-center justify-center text-center text-white px-6">
                            <h1 class="text-4xl md:text-6xl font-bold">Caring for Every Life</h1>
                            <p class="text-lg md:text-xl mt-4">Dedicated healthcare professionals committed to your well-being.</p>
                            <a href="appoinment.jsp" class="mt-6 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg text-lg transition">
                                <i class="fas fa-calendar-alt mr-2"></i> Book an Appointment
                            </a>
                        </div>
                    </div>
    
                </div>
    
                <!-- Swiper Pagination & Navigation -->
                <div class="swiper-pagination"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </section>
    
        <!-- Swiper.js Script -->
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper(".mySwiper", {
                loop: true, // Enable loop
                autoplay: {
                    delay: 4000,
                    disableOnInteraction: false
                },
                speed: 800, // Smooth transition speed
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev"
                }
            });
        </script>

<!-- About Us Section -->
<section class="bg-white py-20 h-screen flex items-center">
    <div class="container mx-auto px-6 md:px-12 lg:px-16">
        <div class="flex flex-col md:flex-row items-center gap-10">
            
            <!-- Image Section -->
            <div class="md:w-1/2">
                <img src="assets/about.jpg" alt="About Us" class="w-full rounded-lg shadow-lg">
            </div>

            <!-- Content Section -->
            <div class="md:w-1/2 text-center md:text-left">
                <h2 class="text-5xl font-bold text-gray-800">About Suwani Hospital</h2>
                <p class="text-xl text-gray-600 mt-4">
                    Suwani Hospital is dedicated to providing the highest quality healthcare services. 
                    With state-of-the-art facilities and a team of experienced professionals, we ensure 
                    the best medical care for our patients.
                </p>
                <p class="text-xl text-gray-600 mt-4">
                    Our hospital specializes in various medical fields, including cardiology, pediatrics, 
                    and general surgery. We strive to offer compassionate and personalized healthcare services.
                </p>
                
                <!-- Call to Action -->
                <div class="mt-6">
                    <a href="#" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-lg text-xl transition">
                        <i class="fas fa-hospital mr-2"></i> Learn More
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>


<!-- Key Features / Services Section -->
<section class="bg-gray-100 py-20">
    <div class="container mx-auto px-6 md:px-12 lg:px-16 text-center">
        <h2 class="text-5xl font-bold text-gray-800 mb-10">Our Key Services</h2>
        <p class="text-lg text-gray-600 max-w-2xl mx-auto">
            We provide high-quality healthcare services with modern technology and expert medical professionals.
        </p>

        <!-- Service Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10 mt-12">

            <!-- Service 1 -->
            <div class="bg-white p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-heartbeat text-5xl text-blue-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Emergency Care</h3>
                <p class="text-gray-600 mt-2 text-center">
                    24/7 emergency services with rapid response and high-quality medical support.
                </p>
            </div>

            <!-- Service 2 -->
            <div class="bg-white p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-user-md text-5xl text-green-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Qualified Doctors</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Our experienced doctors provide the best treatment with personalized care.
                </p>
            </div>

            <!-- Service 3 -->
            <div class="bg-white p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-briefcase-medical text-5xl text-red-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Advanced Equipment</h3>
                <p class="text-gray-600 mt-2 text-center">
                    State-of-the-art medical technology for accurate diagnostics and treatments.
                </p>
            </div>

            <!-- Service 4 -->
            <div class="bg-white p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-procedures text-5xl text-purple-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Patient-Centered Care</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Compassionate and personalized care to ensure patient satisfaction and comfort.
                </p>
            </div>

            <!-- Service 5 -->
            <div class="bg-white p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-flask text-5xl text-yellow-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Laboratory Services</h3>
                <p class="text-gray-600 mt-2 text-center">
                    High-quality lab tests with fast and accurate results for better diagnosis.
                </p>
            </div>

            <!-- Service 6 -->
            <div class="bg-white p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-ambulance text-5xl text-teal-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">24/7 Ambulance</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Fast and reliable ambulance service for emergencies and patient transport.
                </p>
            </div>

        </div>
    </div>
</section>

<!-- Departments & Specialties Section -->
<section class="bg-white py-20">
    <div class="container mx-auto px-6 md:px-12 lg:px-16 text-center">
        <h2 class="text-5xl font-bold text-gray-800 mb-10">Our Departments & Specialties</h2>
        <p class="text-lg text-gray-600 max-w-2xl mx-auto">
            We provide a wide range of medical services with specialized departments for high-quality care.
        </p>

        <!-- Departments Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-10 mt-12">

            <!-- Department 1 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-heart text-5xl text-red-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Cardiology</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Advanced heart care services, including diagnostics and treatments.
                </p>
            </div>

            <!-- Department 2 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-brain text-5xl text-blue-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Neurology</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Specialized care for neurological disorders and brain-related conditions.
                </p>
            </div>

            <!-- Department 3 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-lungs text-5xl text-green-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Pulmonology</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Expert care for respiratory diseases and lung disorders.
                </p>
            </div>

            <!-- Department 4 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-user-nurse text-5xl text-purple-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Pediatrics</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Comprehensive child healthcare from infancy to adolescence.
                </p>
            </div>

            <!-- Department 5 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-bone text-5xl text-yellow-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Orthopedics</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Bone, joint, and muscle care with advanced treatments.
                </p>
            </div>

            <!-- Department 6 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-flask text-5xl text-teal-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Laboratory</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Accurate diagnostic tests for better medical insights.
                </p>
            </div>

            <!-- Department 7 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-user-md text-5xl text-indigo-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">General Medicine</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Primary care and general medical consultations.
                </p>
            </div>

            <!-- Department 8 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-hospital-user text-5xl text-pink-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Gynecology</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Women's health services, maternity, and fertility care.
                </p>
            </div>

            <!-- Department 9 -->
            <div class="bg-gray-100 p-8 rounded-2xl shadow-lg flex flex-col items-center transition transform hover:scale-105">
                <i class="fas fa-teeth-open text-5xl text-orange-600"></i>
                <h3 class="text-2xl font-semibold text-gray-800 mt-4">Dentistry</h3>
                <p class="text-gray-600 mt-2 text-center">
                    Comprehensive oral health and dental care services.
                </p>
            </div>

        </div>
    </div>
</section>

<!-- Contact Us Section -->
<section class="bg-blue-600 py-20 text-white">
    <div class="container mx-auto px-6 md:px-12 lg:px-16">
        <h2 class="text-5xl font-bold  text-center mb-10">Contact Us</h2>
        <p class="text-lg max-w-2xl mx-auto text-center">
            Have questions? Feel free to reach out to us using the form below or visit our hospital.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-10 mt-12">
            <!-- Contact Form -->
            <div class="bg-white p-8 rounded-xl shadow-lg">
                <h3 class="text-2xl font-semibold text-gray-800 mb-4">Get in Touch</h3>
                <form action="#" method="POST" class="space-y-6">
                    <div>
                        <label class="text-gray-600 font-semibold block mb-2">Full Name</label>
                        <input type="text" placeholder="Enter your name" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="text-gray-600 font-semibold block mb-2">Email Address</label>
                        <input type="email" placeholder="Enter your email" class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="text-gray-600 font-semibold block mb-2">Message</label>
                        <textarea rows="4" placeholder="Write your message here..." class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"></textarea>
                    </div>
                    <button class="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition">Send Message</button>
                </form>
            </div>

            <!-- Contact Details & Map -->
            <div class="bg-white p-8 rounded-xl shadow-lg">
                <h3 class="text-2xl font-semibold text-gray-800 mb-4">Our Contact Details</h3>
                <p class="text-gray-600">Feel free to visit or call us at any time.</p>
                <div class="mt-6 space-y-4">
                    <p class="flex items-center space-x-3">
                        <i class="fas fa-map-marker-alt text-blue-600 text-xl"></i>
                        <span class="text-gray-700">123, Hospital Road, Colombo, Sri Lanka</span>
                    </p>
                    <p class="flex items-center space-x-3">
                        <i class="fas fa-phone-alt text-blue-600 text-xl"></i>
                        <span class="text-gray-700">+94 11 234 5678</span>
                    </p>
                    <p class="flex items-center space-x-3">
                        <i class="fas fa-envelope text-blue-600 text-xl"></i>
                        <span class="text-gray-700">info@suwanihospital.com</span>
                    </p>
                </div>

                <!-- Google Map -->
                <div class="mt-6">
                    <iframe class="w-full h-56 rounded-lg shadow-lg" src="https://maps.google.com/maps?q=colombo%20sri%20lanka&t=&z=13&ie=UTF8&iwloc=&output=embed"></iframe>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="bg-white py-20">
    <div class="container mx-auto px-6 md:px-12 lg:px-16 text-center">
        <h2 class="text-5xl font-bold text-gray-800 mb-6">What Our Patients Say</h2>
        <p class="text-lg text-gray-600 max-w-2xl mx-auto mb-12">
            Hear from some of our satisfied patients who have experienced exceptional care at Suwani Hospital.
        </p>

        <!-- Testimonials Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">

            <!-- Testimonial 1 -->
            <div class="bg-gray-100 p-6 rounded-xl shadow-lg text-left">
                <p class="text-gray-700 italic">"The doctors and staff were incredibly caring and professional. I felt safe and well taken care of during my entire stay."</p>
                
                <!-- Rating Stars -->
                <div class="flex items-center mt-4 text-yellow-400">
                    <span class="text-sm mr-2 font-semibold text-gray-600">Rating:</span>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                </div>

                <div class="mt-4 flex items-center">
                    <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Patient" class="w-12 h-12 rounded-full mr-4 object-cover">
                    <div>
                        <h4 class="text-lg font-semibold text-gray-800">Anjali Perera</h4>
                        <span class="text-sm text-gray-500">Colombo</span>
                    </div>
                </div>
            </div>

            <!-- Testimonial 2 -->
            <div class="bg-gray-100 p-6 rounded-xl shadow-lg text-left">
                <p class="text-gray-700 italic">"Suwani Hospital uses advanced equipment and offers top-notch services."</p>

                <!-- Rating Stars -->
                <div class="flex items-center mt-4 text-yellow-400">
                    <span class="text-sm mr-2 font-semibold text-gray-600">Rating:</span>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                </div>

                <div class="mt-4 flex items-center">
                    <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Patient" class="w-12 h-12 rounded-full mr-4 object-cover">
                    <div>
                        <h4 class="text-lg font-semibold text-gray-800">Ruwan Silva</h4>
                        <span class="text-sm text-gray-500">Galle</span>
                    </div>
                </div>
            </div>

            <!-- Testimonial 3 -->
            <div class="bg-gray-100 p-6 rounded-xl shadow-lg text-left">
                <p class="text-gray-700 italic">"From the moment I walked in, I was treated with kindness and respect. The entire team is amazing!"</p>

                <!-- Rating Stars -->
                <div class="flex items-center mt-4 text-yellow-400">
                    <span class="text-sm mr-2 font-semibold text-gray-600">Rating:</span>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                    <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09L5.8 12.18.9 7.91l6.095-.89L10 2l2.995 5.02 6.095.89-4.9 4.27 1.678 5.91z"/></svg>
                </div>

                <div class="mt-4 flex items-center">
                    <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Patient" class="w-12 h-12 rounded-full mr-4 object-cover">
                    <div>
                        <h4 class="text-lg font-semibold text-gray-800">Meera Fernando</h4>
                        <span class="text-sm text-gray-500">Kandy</span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>




<%@ include file="./partials/footer.jsp" %>

   