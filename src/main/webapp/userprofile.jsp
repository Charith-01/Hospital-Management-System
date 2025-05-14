<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./partials/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Profile | Suwani Hospital</title>
  <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#2563eb',
            secondary: '#1e40af',
            accent: '#9333ea',
            dark: '#1f2937',
            light: '#f9fafb'
          }
        }
      }
    }
  </script>
</head>
<body class="bg-gradient-to-br from-gray-50 to-blue-50 font-sans">

<c:set var="user" value="${user}"/> 

<!-- Profile Section -->
<main class="container mx-auto py-12 px-4 sm:px-6">
  <div class="bg-white rounded-3xl shadow-xl overflow-hidden max-w-6xl mx-auto">
    <!-- Profile Header -->
    <div class="bg-gradient-to-r from-primary to-secondary p-6 text-white">
      <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center">
        <div>
          <h1 class="text-3xl font-bold"><c:out value="${user.fullname}"/></h1>
          <p class="text-blue-100 mt-1">Patient at Suwani Hospital</p>
        </div>
        <span class="mt-3 sm:mt-0 bg-white/20 px-4 py-1 rounded-full text-sm font-medium">
          ID: <c:out value="${user.userid}"/>
        </span>
      </div>
    </div>

    <!-- Profile Content -->
    <div class="flex flex-col lg:flex-row">
      <!-- Left Column - Avatar and Basic Info -->
      <div class="w-full lg:w-1/3 p-8 border-b lg:border-b-0 lg:border-r border-gray-200">
        <div class="flex flex-col items-center">
          <div class="relative">
            <div class="w-40 h-40 bg-gradient-to-br from-primary to-accent rounded-full flex items-center justify-center text-7xl text-white shadow-lg">
              <i class="fas fa-user-circle"></i>
            </div>
            <span class="absolute -bottom-2 -right-2 bg-green-500 text-white text-xs font-bold px-3 py-1 rounded-full shadow-md">
              <i class="fas fa-check-circle mr-1"></i> Verified
            </span>
          </div>
          
          <div class="mt-6 text-center">
            <h3 class="text-xl font-semibold text-gray-800"><c:out value="${user.fullname}"/></h3>
            <p class="text-gray-500 mt-1"><c:out value="${user.email}"/></p>
            
            <div class="mt-4 flex justify-center space-x-4">
              <a href="#" class="w-10 h-10 bg-blue-100 text-primary rounded-full flex items-center justify-center hover:bg-blue-200 transition">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="w-10 h-10 bg-blue-100 text-primary rounded-full flex items-center justify-center hover:bg-blue-200 transition">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="w-10 h-10 bg-blue-100 text-primary rounded-full flex items-center justify-center hover:bg-blue-200 transition">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Column - Detailed Information -->
      <div class="w-full lg:w-2/3 p-8">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <!-- Personal Information Card -->
          <div class="bg-gray-50 p-6 rounded-xl border border-gray-200">
            <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
              <i class="fas fa-user-tag mr-2 text-primary"></i> Personal Information
            </h3>
            <ul class="space-y-3">
              <li class="flex items-start">
                <i class="fas fa-venus-mars mt-1 mr-3 text-accent"></i>
                <div>
                  <span class="block text-sm text-gray-500">Gender</span>
                  <span class="font-medium"><c:out value="${user.gender}"/></span>
                </div>
              </li>
              <li class="flex items-start">
                <i class="fas fa-birthday-cake mt-1 mr-3 text-accent"></i>
                <div>
                  <span class="block text-sm text-gray-500">Date of Birth</span>
                  <span class="font-medium"><c:out value="${user.dob}"/></span>
                </div>
              </li>
              <li class="flex items-start">
                <i class="fas fa-tint mt-1 mr-3 text-accent"></i>
                <div>
                  <span class="block text-sm text-gray-500">Blood Group</span>
                  <span class="font-medium"><c:out value="${user.bloodgroup}"/></span>
                </div>
              </li>
            </ul>
          </div>

          <!-- Contact Information Card -->
          <div class="bg-gray-50 p-6 rounded-xl border border-gray-200">
            <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
              <i class="fas fa-address-book mr-2 text-primary"></i> Contact Information
            </h3>
            <ul class="space-y-3">
              <li class="flex items-start">
                <i class="fas fa-phone-alt mt-1 mr-3 text-accent"></i>
                <div>
                  <span class="block text-sm text-gray-500">Phone</span>
                  <span class="font-medium"><c:out value="${user.phone}"/></span>
                </div>
              </li>
              <li class="flex items-start">
                <i class="fas fa-envelope mt-1 mr-3 text-accent"></i>
                <div>
                  <span class="block text-sm text-gray-500">Email</span>
                  <span class="font-medium"><c:out value="${user.email}"/></span>
                </div>
              </li>
              <li class="flex items-start">
                <i class="fas fa-map-marker-alt mt-1 mr-3 text-accent"></i>
                <div>
                  <span class="block text-sm text-gray-500">Address</span>
                  <span class="font-medium"><c:out value="${user.address}"/></span>
                </div>
              </li>
            </ul>
          </div>

          <!-- Medical Information Card -->
          <div class="md:col-span-2 bg-gray-50 p-6 rounded-xl border border-gray-200">
            <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
              <i class="fas fa-notes-medical mr-2 text-primary"></i> Medical Information
            </h3>
            <div class="flex items-start">
              <i class="fas fa-file-medical mt-1 mr-3 text-accent"></i>
              <div>
                <span class="block text-sm text-gray-500">Medical Condition</span>
                <span class="font-medium"><c:out value="${user.medicalcon}"/></span>
              </div>
            </div>
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="mt-8 flex flex-wrap gap-4">
          <a href="editprofile.jsp" class="flex-1 sm:flex-none items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-primary to-secondary text-white rounded-lg shadow hover:shadow-lg transition-all hover:scale-[1.02]">
            <i class="fas fa-edit mr-2"></i> Edit Profile
          </a>
          <form action="DeleteUserProfile" method="POST" onsubmit="return confirmDelete();" class="flex-1 sm:flex-none">
            <input type="hidden" name="id" value="${user.userid}">
            <button type="submit" class="w-full flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-red-600 to-red-700 text-white rounded-lg shadow hover:shadow-lg transition-all hover:scale-[1.02]">
              <i class="fas fa-trash-alt mr-2"></i> Delete Profile
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- Confirmation Script -->
<script>
  function confirmDelete() {
    return confirm("Are you sure you want to permanently delete this profile?");
  }
</script>

</body>
</html>
<%@ include file="./partials/footer.jsp" %>