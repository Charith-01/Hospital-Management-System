<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./partials/adminheader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Update - Suwani Hospital</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 flex h-screen font-sans">

    <!-- Main Content -->
    <main class="flex-1 overflow-y-auto p-8">
        <div class="max-w-4xl mx-auto bg-white p-8 rounded-lg shadow-md">
            <h2 class="text-2xl font-bold text-blue-700 mb-6 flex items-center">
                <i class="fas fa-user-md mr-2"></i>Doctor Update
            </h2>

            <form action="AdminUpdateDoctor" method="post" class="space-y-6">
            
            	<input type="hidden" name="doctor_id" value="${param.doctorid}">

                <!-- Full Name & Gender -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block font-medium">Full Name</label>
                        <input type="text" name="full_name" value="${param.full_name}" class="w-full border border-gray-300 p-3 rounded" required>
                    </div>
					<div>
					    <label class="block font-medium">Gender</label>
					    <select name="gender" class="w-full border border-gray-300 p-3 rounded">
					        <option value="">Select</option>
					        <option value="Male" ${param.gender == 'Male' ? 'selected' : ''}>Male</option>
					        <option value="Female" ${param.gender == 'Female' ? 'selected' : ''}>Female</option>
					        <option value="Other" ${param.gender == 'Other' ? 'selected' : ''}>Other</option>
					    </select>
					</div>
                </div>

                <!-- Email & Phone -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block font-medium">Email</label>
                        <input type="email" name="email" value="${param.email}" class="w-full border border-gray-300 p-3 rounded" required>
                    </div>
                    <div>
                        <label class="block font-medium">Phone</label>
                        <input type="text" name="phone" value="${param.phone}" class="w-full border border-gray-300 p-3 rounded">
                    </div>
                </div>

                <!-- Address -->
                <div>
                    <label class="block font-medium">Address</label>
                    <textarea name="address" class="w-full border border-gray-300 p-3 rounded" rows="2">${param.address}"</textarea>
                </div>

				<!-- Specialization & Experience -->
				<select name="specialization" value="${param.department}" class="w-full border border-gray-300 p-3 rounded">
				  <option value="">Select Specialization</option>
				  <option value="Cardiology" ${param.specialization == 'Cardiology' ? 'selected' : ''}>Cardiology</option>
				  <option value="Neurology" ${param.specialization == 'Neurology' ? 'selected' : ''}>Neurology</option>
				  <option value="Orthopedics" ${param.specialization == 'Orthopedics' ? 'selected' : ''}>Orthopedics</option>
				  <option value="Pediatrics" ${param.specialization == 'Pediatrics' ? 'selected' : ''}>Pediatrics</option>
				  <option value="Dermatology" ${param.specialization == 'Dermatology' ? 'selected' : ''}>Dermatology</option>
				  <option value="General_Surgery" ${param.specialization == 'General_Surgery' ? 'selected' : ''}>General Surgery</option>
				  <option value="Psychiatry" ${param.specialization == 'Psychiatry' ? 'selected' : ''}>Psychiatry</option>
				</select>

				<!-- License Number & Department -->
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
				    <div>
				        <label class="block font-medium">Department</label>
				        <select name="department" class="w-full border border-gray-300 p-3 rounded">
				            <option value="">Select Department</option>
				            <option value="Emergency" ${param.department == 'Emergency' ? 'selected' : ''}>Emergency</option>
				            <option value="Outpatient" ${param.department == 'Outpatient' ? 'selected' : ''}>Outpatient</option>
				            <option value="Radiology" ${param.department == 'Radiology' ? 'selected' : ''}>Radiology</option>
				            <option value="ICU" ${param.department == 'ICU' ? 'selected' : ''}>ICU</option>
				            <option value="Laboratory" ${param.department == 'Laboratory' ? 'selected' : ''}>Laboratory</option>
				            <option value="Pharmacy" ${param.department == 'Pharmacy' ? 'selected' : ''}>Pharmacy</option>
				        </select>
				    </div>
				</div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded shadow-md">
                        Update Doctor
                    </button>
                </div>

            </form>
        </div>
    </main>
</body>
</html>
