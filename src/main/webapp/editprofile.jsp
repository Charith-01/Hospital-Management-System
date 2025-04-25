<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.suwani.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>

    <!-- Tailwind CSS (CDN) -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Font Awesome (CDN) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">

    <div class="max-w-2xl mx-auto my-10 bg-white p-6 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-center mb-6 text-gray-700">Edit Profile</h2>
        
        <form action="UpdateUser" method="post">
            <input type="hidden" name="id" value="<%= user.getUserid() %>"/>

            <div class="mb-4">
                <label for="fullname" class="block text-gray-700 font-medium mb-2">Full Name:</label>
                <input type="text" name="fullname" value="<%= user.getFullname() %>" required 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>

            <div class="mb-4">
                <label for="email" class="block text-gray-700 font-medium mb-2">Email:</label>
                <input type="email" name="email" value="<%= user.getEmail() %>" required 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>

            <div class="mb-4">
                <label for="phone" class="block text-gray-700 font-medium mb-2">Phone:</label>
                <input type="text" name="phone" value="<%= user.getPhone() %>" required 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>

            <div class="mb-4">
                <label for="address" class="block text-gray-700 font-medium mb-2">Address:</label>
                <textarea name="address" rows="4" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"><%= user.getAddress() %></textarea>
            </div>

            <div class="mb-4">
                <label for="gender" class="block text-gray-700 font-medium mb-2">Gender:</label>
                <select name="gender" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>

            <div class="mb-4">
                <label for="dob" class="block text-gray-700 font-medium mb-2">Date of Birth:</label>
                <input type="date" name="dob" value="<%= user.getDob() %>" required 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
            </div>

            <div class="mb-4">
                <label for="bloodgroup" class="block text-gray-700 font-medium mb-2">Blood Group:</label>
                <select name="bloodgroup" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <%
                        String[] groups = {"A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"};
                        for(String g : groups) {
                    %>
                        <option value="<%= g %>" <%= g.equals(user.getBloodgroup()) ? "selected" : "" %>><%= g %></option>
                    <%
                        }
                    %>
                </select>
            </div>

<div class="mb-4">
    <label class="block text-gray-700 font-medium mb-2">Medical Conditions:</label>
    <div class="flex flex-wrap items-center space-x-4">
        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Diabetes" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Diabetes") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Diabetes</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Hypertension" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Hypertension") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Hypertension</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Asthma" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Asthma") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Asthma</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Heart Disease" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Heart Disease") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Heart Disease</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Cancer" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Cancer") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Cancer</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Arthritis" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Arthritis") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Arthritis</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Allergies" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Allergies") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Allergies</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Thyroid Problems" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Thyroid Problems") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Thyroid Problems</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Kidney Disease" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Kidney Disease") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Kidney Disease</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Mental Health Issues" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Mental Health Issues") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Mental Health Issues</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Chronic Pain" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Chronic Pain") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Chronic Pain</span>
        </label>

        <label class="flex items-center">
            <input type="checkbox" name="medicalcon" value="Liver Disease" 
                <%= user.getMedicalcon() != null && user.getMedicalcon().contains("Liver Disease") ? "checked" : "" %> 
                class="form-checkbox text-blue-500"/>
            <span class="ml-2">Liver Disease</span>
        </label>
    </div>
</div>
            <div class="mb-4 text-center">
                <button type="submit" 
                    class="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <i class="fas fa-save"></i> Update Profile
                </button>
            </div>
        </form>
    </div>
</body>
</html>
