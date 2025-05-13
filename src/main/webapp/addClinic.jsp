<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Clinic</title>
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100">

  <section class="py-10">
    <div class="max-w-3xl mx-auto bg-white p-8 rounded-xl shadow-md">
      <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center gap-2">
        <i class="fas fa-clinic-medical text-blue-600"></i> Add Clinic
      </h2>

      <form action="AddClinic" method="POST" enctype="multipart/form-data" class="space-y-5">

        <!-- Clinic Name -->
        <div>
          <label for="clinicName" class="block text-gray-700 font-semibold mb-1">
            <i class="fas fa-hospital-symbol mr-2 text-blue-500"></i>Clinic Name
          </label>
          <input type="text" id="clinicName" name="clinicName" required
                 class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <!-- Doctor Name -->
        <div>
          <label for="doctorName" class="block text-gray-700 font-semibold mb-1">
            <i class="fas fa-user-md mr-2 text-blue-500"></i>Doctor Name
          </label>
          <input type="text" id="doctorName" name="doctorName" required
                 class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <!-- Location -->
        <div>
          <label for="location" class="block text-gray-700 font-semibold mb-1">
            <i class="fas fa-map-marker-alt mr-2 text-blue-500"></i>Location
          </label>
          <input type="text" id="location" name="location" required
                 class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <!-- Contact Number -->
        <div>
          <label for="contact" class="block text-gray-700 font-semibold mb-1">
            <i class="fas fa-phone mr-2 text-blue-500"></i>Contact Number
          </label>
          <input type="text" id="contact" name="contact" required
                 class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <!-- Opening Hours -->
        <div>
          <label for="hours" class="block text-gray-700 font-semibold mb-1">
            <i class="fas fa-clock mr-2 text-blue-500"></i>Opening Hours
          </label>
          <input type="text" id="hours" name="hours" placeholder="e.g. Mon-Fri: 9am - 5pm"
                 class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        
        
		<!-- Clinic Image Upload -->
		<div>
		  <label for="clinicImage" class="block text-gray-700 font-semibold mb-1">
		    <i class="fas fa-image mr-2 text-blue-500"></i>Clinic Image
		  </label>
		  <input type="file" id="clinicImage" name="clinicImage" accept="image/*" required
		         class="w-full text-gray-600 file:border-0 file:bg-blue-100 file:px-4 file:py-2 file:rounded-lg file:text-blue-700 hover:file:bg-blue-200">
		</div>
		

        <!-- Submit Button -->
        <div class="pt-4">
          <button type="submit"
                  class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg shadow flex items-center justify-center gap-2">
            <i class="fas fa-plus-circle"></i> Add Clinic
          </button>
        </div>

      </form>
    </div>
  </section>

</body>
</html>
