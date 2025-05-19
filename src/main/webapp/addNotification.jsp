<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Notification</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded shadow-md w-full max-w-md">
        <h2 class="text-2xl font-bold mb-6 text-center text-blue-600">Send Notification</h2>

        <!-- Success or Error Message -->
        <c:if test="${param.msg != null}">
            <div class="mb-4 text-green-600">${param.msg}</div>
        </c:if>
        <c:if test="${param.error != null}">
            <div class="mb-4 text-red-600">${param.error}</div>
        </c:if>

        <form action="SendNotificationServlet" method="post" class="space-y-4">
            <div>
                <label for="userEmail" class="block font-medium text-gray-700">User Email</label>
                <input type="email" id="userEmail" name="userEmail" readonly value="${param.email}"
                       class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400">
            </div>

            <div>
                <label for="message" class="block font-medium text-gray-700">Message</label>
                <textarea id="message" name="message" rows="4" required
                          class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition duration-200">
                Send Notification
            </button>
        </form>
    </div>
</body>
</html>
