<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register | Suwani Hospital</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

  <div class="min-h-screen flex items-center justify-center px-6">
    <div class="bg-white p-10 rounded-2xl shadow-xl w-full max-w-3xl">
      <h2 class="text-3xl font-bold text-center text-blue-600 mb-6">Create an Account</h2>
      <form action="register.php" method="POST" class="space-y-6">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <!-- Full Name -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Full Name</label>
            <input type="text" name="full_name" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>

          <!-- Email -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="email" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>

          <!-- Phone -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Phone Number</label>
            <input type="text" name="phone" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>

          <!-- Gender -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Gender</label>
            <select name="gender" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
              <option value="">Select</option>
              <option>Male</option>
              <option>Female</option>
              <option>Other</option>
            </select>
          </div>

          <!-- Date of Birth -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Date of Birth</label>
            <input type="date" name="dob" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>
        </div>

        <!-- Password -->
        <div>
          <label class="block mb-2 text-sm font-medium text-gray-700">Password</label>
          <input type="password" name="password" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
        </div>

        <!-- Confirm Password -->
        <div>
          <label class="block mb-2 text-sm font-medium text-gray-700">Confirm Password</label>
          <input type="password" name="confirm_password" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
        </div>

        <!-- Submit Button -->
        <div class="text-center">
          <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-8 py-3 rounded-lg shadow-md transition duration-300">
            Register
          </button>
        </div>

        <!-- Already Registered -->
        <p class="text-center text-gray-600 mt-4">
          Already have an account?
          <a href="login.html" class="text-blue-600 hover:underline">Login here</a>
        </p>
      </form>
    </div>
  </div>

</body>
</html>
