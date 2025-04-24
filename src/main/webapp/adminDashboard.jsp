<%@ include file="./partials/adminheader.jsp" %>

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
