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
          
          <!-- Address -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Address</label>
            <input type="text" name="address" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>
          
          <!-- City -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">City</label>
            <input type="text" name="city" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>
          
          <!-- Postal/Zip Code -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Postal/Zip Code</label>
            <input type="text" name="postal" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
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
          
          <!-- Blood Group -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Blood Group</label>
            <select name="bloodgroup" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
              <option value="">Select</option>
              <option>A+/A-</option>
              <option>B+/B-</option>
              <option>AB+/AB-</option>
              <option>O+/O-</option>
              <option>Unknown</option>
            </select>
          </div>
          
          <!-- Existing Medical Conditions Section -->
		 <div class="mb-6">
		  <label class="block text-sm font-medium text-gray-700 mb-2">Existing Medical Conditions</label>
		
		  <div class="space-y-2">
		    <label class="flex items-center space-x-2">
		      <input type="checkbox" name="conditions[]" value="Diabetes" required class="accent-blue-600" />
		      <span>Diabetes</span>
		    </label>
		
		    <label class="flex items-center space-x-2">
		      <input type="checkbox" name="conditions[]" value="Hypertension" required class="accent-blue-600" />
		      <span>Hypertension</span>
		    </label>
		
		    <label class="flex items-center space-x-2">
		      <input type="checkbox" name="conditions[]" value="Heart Disease" required class="accent-blue-600" />
		      <span>Heart Disease</span>
		    </label>
		    
		    <label class="flex items-center space-x-2">
		      <input type="checkbox" name="conditions[]" value="Asthma" required class="accent-blue-600" />
		      <span>Asthma</span>
		    </label>
		
		    <label class="flex items-center space-x-2">
		      <input type="checkbox" id="otherCheckbox" required class="accent-blue-600" />
		      <span>Other</span>
		    </label>
		
		    <input type="text" name="conditions_other" id="otherConditionInput" placeholder="Please specify" class="w-full mt-2 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 hidden" />
		  </div>
		</div>
		
		<!-- Existing Medical Conditions other check box JS part -->
        <script>
		  const otherCheckbox = document.getElementById('otherCheckbox');
		  const otherInput = document.getElementById('otherConditionInput');
		
		  otherCheckbox.addEventListener('change', function () {
		    if (this.checked) {
		      otherInput.classList.remove('hidden');
		    } else {
		      otherInput.classList.add('hidden');
		    }
		  });
		</script>

          <!-- Date of Birth -->
          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Date of Birth</label>
            <input type="date" name="dob" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>
        </div>
        
		<div class="mb-6 grid grid-cols-1 md:grid-cols-2 gap-6">
		  <!-- Password -->
		  <div>
		    <label for="password" class="block text-sm font-medium text-gray-700 mb-2">Password</label>
		    <input
		      type="password"
		      id="password"
		      name="password"
		      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
		      required
		    />
		  </div>
		
		  <!-- Confirm Password -->
		  <div>
		    <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-2">Confirm Password</label>
		    <input
		      type="password"
		      id="confirmPassword"
		      name="confirmPassword"
		      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
		      required
		    />
		  </div>
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
          <a href="login.jsp" class="text-blue-600 hover:underline">Login here</a><br>
          <a href="index.jsp" class="text-blue-600 hover:underline">Continue as guest</a>
        </p>
          
      </form>
    </div>
  </div>

</body>
</html>
