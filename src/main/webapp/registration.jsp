<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function toggleOtherInput(checkbox) {
            const otherInput = document.getElementById('otherCondition');
            otherInput.style.display = checkbox.checked ? 'inline-block' : 'none';
            if (!checkbox.checked) {
                otherInput.value = "";
            }
        }
    </script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <form action="AddUser" method="POST" class="bg-white p-8 rounded-2xl shadow-md w-full max-w-2xl">
        <h2 class="text-3xl font-bold mb-6 text-center text-blue-600">User Registration</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <!-- Full Name -->
            <div>
                <label class="block mb-1 font-medium">Full Name</label>
                <input type="text" name="fullname" class="w-full p-2 border rounded-md" required>
            </div>

            <!-- Email -->
            <div>
                <label class="block mb-1 font-medium">Email</label>
                <input type="email" name="email" class="w-full p-2 border rounded-md" required>
            </div>

            <!-- Phone -->
            <div>
                <label class="block mb-1 font-medium">Phone</label>
                <input type="text" name="phone" class="w-full p-2 border rounded-md">
            </div>

            <!-- Address -->
            <div>
                <label class="block mb-1 font-medium">Address</label>
                <input type="text" name="address" class="w-full p-2 border rounded-md">
            </div>

            <!-- Gender -->
            <div>
                <label class="block mb-1 font-medium">Gender</label>
                <select name="gender" class="w-full p-2 border rounded-md">
                    <option value="">Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <!-- DOB -->
            <div class="mb-4">
                <label for="dob" class="block text-sm font-medium text-gray-700 mb-1">Date of Birth</label>
                <input type="date" id="dob" name="dob" required
                       class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </div>

            <!-- Blood Group -->
            <div>
                <label class="block mb-1 font-medium">Blood Group</label>
                <select name="bloodgroup" class="w-full p-2 border rounded-md">
                    <option value="">Select</option>
                    <option value="A+">A+</option>
                    <option value="A-">A-</option>
                    <option value="B+">B+</option>
                    <option value="B-">B-</option>
                    <option value="O+">O+</option>
                    <option value="O-">O-</option>
                    <option value="AB+">AB+</option>
                    <option value="AB-">AB-</option>
                    <option value="Unknown">Unknown</option>
                </select>
            </div>
        </div>

        <!-- Existing Medical Conditions -->
        <div class="mt-6">
            <label class="block text-sm font-medium mb-2">Existing Medical Conditions</label>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <label><input type="checkbox" name="conditions" value="Diabetes" class="mr-1">Diabetes</label>
                <label><input type="checkbox" name="conditions" value="Hypertension" class="mr-1">Hypertension</label>
                <label><input type="checkbox" name="conditions" value="Asthma" class="mr-1">Asthma</label>
                <label><input type="checkbox" name="conditions" value="Heart Disease" class="mr-1">Heart Disease</label>
                <label><input type="checkbox" name="conditions" value="Cancer" class="mr-1">Cancer</label>
                <label><input type="checkbox" name="conditions" value="Arthritis" class="mr-1">Arthritis</label>
                <label><input type="checkbox" name="conditions" value="Allergies" class="mr-1">Allergies</label>
                <label><input type="checkbox" name="conditions" value="Thyroid Problems" class="mr-1">Thyroid Problems</label>
                <label><input type="checkbox" name="conditions" value="Kidney Disease" class="mr-1">Kidney Disease</label>
                <label><input type="checkbox" name="conditions" value="Mental Health Issues" class="mr-1">Mental Health Issues</label>
                <label><input type="checkbox" name="conditions" value="Chronic Pain" class="mr-1">Chronic Pain</label>
                <label><input type="checkbox" name="conditions" value="Liver Disease" class="mr-1">Liver Disease</label>

                <!-- Other -->
                <label class="col-span-full flex items-center">
                    <input type="checkbox" name="conditions" value="Other" class="mr-1" onclick="toggleOtherInput(this)">Other
                </label>
                <input type="text" name="otherCondition" id="otherCondition"
                       class="col-span-full p-2 border rounded-md w-full mt-2" style="display: none;" placeholder="Please specify other condition">
            </div>
        </div>

        <!-- Password Fields -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-6">
            <div>
                <label class="block mb-1 font-medium">Password</label>
                <input type="password" name="password" class="w-full p-2 border rounded-md" required>
            </div>
            <div>
                <label class="block mb-1 font-medium">Confirm Password</label>
                <input type="password" name="confirmPassword" class="w-full p-2 border rounded-md" required>
            </div>
        </div><br>

      <!-- Submit Button -->
      <div class="text-center">
        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-8 py-3 rounded-lg shadow-md transition duration-300">
          Register
        </button>
      </div>

      <!-- Register Redirect -->
      <p class="text-center text-gray-600 mt-4">
        Already have an account?
        <a href="login.jsp" class="text-blue-600 hover:underline">Login here</a><br>
        <a href="index.jsp" class="text-blue-600 hover:underline">Continue as guest</a>
      </p>
    </form>

</body>
</html>
