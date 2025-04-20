<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login | Suwani Hospital</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen px-4">

  <div class="bg-white p-10 rounded-2xl shadow-lg w-full max-w-md">
    <h2 class="text-3xl font-bold text-center text-blue-600 mb-6">Login to Suwani</h2>

    <form action="login.php" method="POST" class="space-y-6">

      <!-- Email -->
      <div>
        <label class="block mb-2 text-sm font-medium text-gray-700">Email</label>
        <input type="email" name="email" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
      </div>

      <!-- Password -->
      <div>
        <label class="block mb-2 text-sm font-medium text-gray-700">Password</label>
        <input type="password" name="password" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
      </div>

      <!-- Remember Me & Forgot -->
      <div class="flex items-center justify-between text-sm text-gray-600">
        <label class="flex items-center space-x-2">
          <input type="checkbox" name="remember" class="accent-blue-600">
          <span>Remember me</span>
        </label>
        <a href="#" class="text-blue-600 hover:underline">Forgot Password?</a>
      </div>

      <!-- Submit Button -->
      <div class="text-center">
        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-8 py-3 rounded-lg shadow-md transition duration-300">
          Login
        </button>
      </div>

      <!-- Register Redirect -->
      <p class="text-center text-gray-600 mt-4">
        Don't have an account?
        <a href="register.html" class="text-blue-600 hover:underline">Register here</a>
      </p>
    </form>
  </div>

</body>
</html>
