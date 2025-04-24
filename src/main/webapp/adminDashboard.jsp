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
            <i class="fas fa-user-shield mr-2"></i> Admin Panel
        </div>
        <nav class="flex-1 px-4 py-6 space-y-3">
            <a href="#" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                <i class="fas fa-users mr-3 text-blue-600"></i> Users
            </a>
            <a href="#" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                <i class="fas fa-user-md mr-3 text-green-600"></i> Doctors
            </a>
            <a href="#" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                <i class="fas fa-clinic-medical mr-3 text-purple-600"></i> Clinics
            </a>
            <a href="#" class="flex items-center p-3 text-gray-700 hover:bg-blue-100 rounded-lg transition">
                <i class="fas fa-calendar-alt mr-3 text-yellow-600"></i> Appointments
            </a>
        </nav>
        <div class="p-4">
            <a href="Logout" class="w-full flex items-center justify-center py-2 px-4 bg-red-600 text-white rounded-lg hover:bg-red-700 transition">
                <i class="fas fa-sign-out-alt mr-2"></i> Logout
            </a>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
        <!-- Welcome Banner -->
        <div class="bg-gradient-to-r from-blue-100 to-blue-200 rounded-xl p-6 mb-8 shadow-md">
            <h1 class="text-3xl font-semibold text-blue-800">Welcome to Suwani Hospital Admin Dashboard</h1>
            <p class="text-gray-600 mt-2">Monitor hospital operations efficiently.</p>
        </div>

        <!-- Cards Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Users Card -->
            <div class="bg-white shadow-lg hover:shadow-xl rounded-xl p-5 transition-transform transform hover:-translate-y-1 flex items-center space-x-4">
                <div class="p-3 bg-blue-100 rounded-full">
                    <i class="fas fa-users text-2xl text-blue-600"></i>
                </div>
                <div>
                    <p class="text-gray-600">Total Users</p>
                    <p class="text-xl font-bold text-gray-800">10</p>
                </div>
            </div>

            <!-- Doctors Card -->
            <div class="bg-white shadow-lg hover:shadow-xl rounded-xl p-5 transition-transform transform hover:-translate-y-1 flex items-center space-x-4">
                <div class="p-3 bg-green-100 rounded-full">
                    <i class="fas fa-user-md text-2xl text-green-600"></i>
                </div>
                <div>
                    <p class="text-gray-600">Doctors</p>
                    <p class="text-xl font-bold text-gray-800">20</p>
                </div>
            </div>

            <!-- Clinics Card -->
            <div class="bg-white shadow-lg hover:shadow-xl rounded-xl p-5 transition-transform transform hover:-translate-y-1 flex items-center space-x-4">
                <div class="p-3 bg-purple-100 rounded-full">
                    <i class="fas fa-clinic-medical text-2xl text-purple-600"></i>
                </div>
                <div>
                    <p class="text-gray-600">Clinics</p>
                    <p class="text-xl font-bold text-gray-800">10</p>
                </div>
            </div>

            <!-- Appointments Card -->
            <div class="bg-white shadow-lg hover:shadow-xl rounded-xl p-5 transition-transform transform hover:-translate-y-1 flex items-center space-x-4">
                <div class="p-3 bg-yellow-100 rounded-full">
                    <i class="fas fa-calendar-check text-2xl text-yellow-600"></i>
                </div>
                <div>
                    <p class="text-gray-600">Appointments</p>
                    <p class="text-xl font-bold text-gray-800">10</p>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
