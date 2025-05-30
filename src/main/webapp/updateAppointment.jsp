<%@ page import="com.suwani.model.Appointment" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Appointment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center px-4 py-12">

    <div class="bg-white shadow-xl rounded-2xl w-full max-w-2xl p-10">
        <!-- Form Header -->
        <div class="mb-8 text-center">
            <h1 class="text-3xl font-bold text-gray-800 flex justify-center items-center gap-2">
                <i class="fas fa-calendar-check text-blue-600"></i> Update Appointment
            </h1>
            <p class="text-gray-500 mt-2 text-sm">Modify your appointment details below</p>
        </div>

        <!-- Update Form -->
        <form action="UpdateAppointmentServlet" method="post" class="space-y-6" onsubmit="return validatePhoneNumber()">

            <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>"/>

            <!-- Name -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Name</label>
                <input type="text" name="name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" 
                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required />
            </div>

            <!-- Email -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Email</label>
                <input type="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" 
                    class="w-full border border-gray-200 bg-gray-100 rounded-lg px-4 py-2" readonly />
            </div>

            <!-- Phone -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Phone</label>
                <input type="text" name="phone" id="phone" value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>" 
                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                    required 
                    oninput="validatePhoneNumberLive(this)" />
                <p id="phoneError" class="text-red-500 text-sm mt-1 hidden">Phone number must start with 0 and contain exactly 10 digits</p>
            </div>

            <!-- Date -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Appointment Date</label>
                <input type="date" name="date" value="<%= request.getParameter("date") != null ? request.getParameter("date") : "" %>" 
                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required />
            </div>

            <!-- Doctor -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Doctor</label>
                <input type="text" name="doctor" value="<%= request.getParameter("doctor") != null ? request.getParameter("doctor") : "" %>" 
                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required />
            </div>

            <!-- Notes -->
            <div>
                <label class="block text-gray-700 font-medium mb-1">Additional Notes</label>
                <textarea name="note" rows="4" 
                    class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"><%= request.getParameter("note") != null ? request.getParameter("note") : "" %></textarea>
            </div>

            <!-- Submit Button -->
            <div class="flex justify-center">
                <button type="submit" 
                    class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-2 rounded-lg flex items-center gap-2 shadow-sm transition duration-200">
                    <i class="fas fa-save"></i> Update
                </button>
            </div>
        </form>

     
    </div>

    <script>
        // Live validation as user types
        function validatePhoneNumberLive(input) {
            const phone = input.value;
            const errorElement = document.getElementById('phoneError');
            
            if (!phone.startsWith('0') || !/^\d{10}$/.test(phone)) {
                input.classList.add('border-red-500');
                input.classList.remove('border-gray-300');
                errorElement.classList.remove('hidden');
            } else {
                input.classList.remove('border-red-500');
                input.classList.add('border-gray-300');
                errorElement.classList.add('hidden');
            }
        }

        // Form submission validation
        function validatePhoneNumber() {
            const phone = document.getElementById('phone').value;
            const errorElement = document.getElementById('phoneError');
            
            if (!phone.startsWith('0') || !/^\d{10}$/.test(phone)) {
                document.getElementById('phone').classList.add('border-red-500');
                document.getElementById('phone').classList.remove('border-gray-300');
                errorElement.classList.remove('hidden');
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</body>
</html>