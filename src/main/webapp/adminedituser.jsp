<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.suwani.model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="./partials/adminheader.jsp" %>

<%
    User user = (User) request.getAttribute("user");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String dobFormatted = (user.getDob() != null) ? sdf.format(user.getDob()) : "";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Edit User</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    <div class="max-w-xl mx-auto mt-10 bg-white p-8 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-6 text-center">Edit User Profile</h2>
        <form action="AdminUpdateUsers" method="post">
            <input type="hidden" name="id" value="<%= user.getUserid() %>" />

            <div class="mb-4">
                <label>Full Name</label>
                <input type="text" name="fullname" value="<%= user.getFullname() %>" required class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="mb-4">
                <label>Email</label>
                <input type="email" name="email" value="<%= user.getEmail() %>" required class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="mb-4">
                <label>Phone</label>
                <input type="text" name="phone" value="<%= user.getPhone() %>" required class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="mb-4">
                <label>Address</label>
                <input type="text" name="address" value="<%= user.getAddress() %>" class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="mb-4">
                <label>Gender</label>
                <select name="gender" class="w-full border px-3 py-2 rounded">
                    <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>

            <div class="mb-4">
                <label>Date of Birth</label>
                <input type="date" name="dob" value="<%= dobFormatted %>" class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="mb-4">
                <label>Blood Group</label>
                <input type="text" name="bloodgroup" value="<%= user.getBloodgroup() %>" class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="mb-4">
                <label>Medical Condition</label>
                <input type="text" name="medicalcon" value="<%= user.getMedicalcon() %>" class="w-full border px-3 py-2 rounded"/>
            </div>

            <div class="text-center">
                <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Update</button>
            </div>
        </form>
    </div>

</body>
</html>
