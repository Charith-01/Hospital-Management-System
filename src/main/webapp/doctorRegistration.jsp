<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="./partials/adminheader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Registration - Suwani Hospital</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 flex h-screen font-sans">


    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto p-8">
        <div class="max-w-4xl mx-auto bg-white p-8 rounded-lg shadow-md">
            <h2 class="text-2xl font-bold text-blue-700 mb-6 flex items-center">
                <i class="fas fa-user-md mr-2"></i>Doctor Registration
            </h2>

            <form action="AddDoctor" method="post" enctype="multipart/form-data" class="space-y-6">

                <!-- Full Name & Gender -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block font-medium">Full Name</label>
                        <input type="text" name="full_name" class="w-full border border-gray-300 p-3 rounded" required>
                    </div>
                    <div>
                        <label class="block font-medium">Gender</label>
                        <select name="gender" class="w-full border border-gray-300 p-3 rounded">
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>

                <!-- Email & Phone -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block font-medium">Email</label>
                        <input type="email" name="email" class="w-full border border-gray-300 p-3 rounded" required>
                    </div>
                    <div>
                        <label class="block font-medium">Phone</label>
                        <input type="text" name="phone" class="w-full border border-gray-300 p-3 rounded">
                    </div>
                </div>

                <!-- Address -->
                <div>
                    <label class="block font-medium">Address</label>
                    <textarea name="address" class="w-full border border-gray-300 p-3 rounded" rows="2"></textarea>
                </div>

				<!-- Specialization & Experience -->
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
				    <div>
				        <label class="block font-medium">Specialization</label>
				        <select name="specialization" class="w-full border border-gray-300 p-3 rounded">
				            <option value="">Select Specialization</option>
				            <option>Cardiology</option>
				            <option>Neurology</option>
				            <option>Orthopedics</option>
				            <option>Pediatrics</option>
				            <option>Dermatology</option>
				            <option>General Surgery</option>
				            <option>Psychiatry</option>
				        </select>
				    </div>
				    <div>
				        <label class="block font-medium">Years of Experience</label>
				        <input type="text" name="experience_years" class="w-full border border-gray-300 p-3 rounded">
				    </div>
				</div>

				<!-- License Number & Department -->
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
				    <div>
				        <label class="block font-medium">Medical License Number</label>
				        <input type="text" name="license_number" class="w-full border border-gray-300 p-3 rounded">
				    </div>
				    <div>
				        <label class="block font-medium">Department</label>
				        <select name="department" class="w-full border border-gray-300 p-3 rounded">
				            <option value="">Select Department</option>
				            <option>Emergency</option>
				            <option>Outpatient</option>
				            <option>Radiology</option>
				            <option>ICU</option>
				            <option>Laboratory</option>
				            <option>Pharmacy</option>
				        </select>
				    </div>
				</div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded shadow-md">
                        Register Doctor
                    </button>
                </div>

            </form>
        </div>
    </main>
</body>
</html>
