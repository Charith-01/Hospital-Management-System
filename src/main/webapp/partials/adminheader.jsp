<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Suwani Hospital</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 flex h-screen font-sans">

    <!-- Sidebar -->
    <aside class="w-64 bg-white shadow-md flex flex-col">
        <div class="p-6 bg-gradient-to-r from-blue-500 to-blue-700 text-white font-bold text-2xl flex items-center">
            <a href="adminDashboard.jsp"><i class="fas fa-user-shield mr-2"></i> Admin Panel</a>
        </div>
        <nav class="flex-1 px-4 py-6 space-y-3">
            <!-- Form for submitting to the AdminUsers -->
            <form action="AdminUsers" method="POST">
                <button type="submit" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition w-full">
                    <i class="fas fa-users mr-3 text-blue-600"></i> Users
                </button>
            </form>
            
            <!-- Form for submitting to the adminDoctors-->
            <form action="adminDoctors" method="POST" class="w-full">
                <button type="submit" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                    <i class="fas fa-user-md mr-3 text-green-600"></i> Doctors
                </button>
            </form>
            
            <!-- Form for submitting to the AdminClinics -->
			<a href="<%= request.getContextPath() %>/RetrieveClinicServlet" 
			   class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
			    <i class="fas fa-clinic-medical mr-3 text-purple-600"></i> Clinics
			</a>
            
            <!-- Form for submitting to AppointmentReadServlet -->
            <form action="AppointmentReadServlet" method="POST" class="w-full">
                <button type="submit" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                    <i class="fas fa-calendar-alt mr-3 text-yellow-600"></i> Appointments
                </button>
            </form>
            
            <!-- New Feedback Section -->
            <form action="AdminFeedback" method="POST" class="w-full">
                <button type="submit" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                    <i class="fas fa-comment-alt mr-3 text-indigo-600"></i> Feedback
                </button>
            </form>
        </nav>
        <div class="p-4">
            <a href="Logout" class="w-full flex items-center justify-center py-2 px-4 bg-red-600 text-white rounded-lg hover:bg-red-700 transition">
                <i class="fas fa-sign-out-alt mr-2"></i> Logout
            </a>
        </div>
    </aside>
</body>
</html>