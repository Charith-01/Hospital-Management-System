<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./partials/adminheader.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Clinic List - Suwani Hospital</title>
    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 font-sans min-h-screen flex">

    <!-- Sidebar included from adminheader.jsp -->

    <!-- Main content -->
    <main class="flex-1 p-6 overflow-auto">
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-3xl font-bold text-gray-800 flex-1 text-center">Clinics Records</h1>
            <a href="<c:url value='/addClinic' />" 
               class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition">
               <i class="fas fa-user-plus mr-2"></i>Add New Clinic
            </a>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="mb-4 p-4 bg-red-100 text-red-700 rounded border border-red-300">${errorMessage}</div>
        </c:if>

        <div class="overflow-x-auto rounded-lg shadow-md bg-white">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-blue-600">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">ID</th>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">Address</th>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">Date</th>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">Description</th>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">Image</th>
                        <th class="px-6 py-3 text-left text-xs font-semibold text-white uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <c:forEach items="${clinics}" var="clinic">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${clinic.id}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${clinic.name}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${clinic.address}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${clinic.date}</td>
                            <td class="px-6 py-4 max-w-xs text-sm text-gray-700 truncate" title="${clinic.description}">${clinic.description}</td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <c:if test="${not empty clinic.image}">
                                    <img src="<c:url value='/${clinic.image}' />" 
                                         alt="Clinic Image"
                                         class="w-20 h-20 object-cover rounded-md border border-gray-300"
                                         onerror="this.src='<c:url value='/assets/default-clinic.jpg' />'"/>
                                </c:if>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap space-x-2">
                                <a href="<c:url value='/UpdateClinicServlet?id=${clinic.id}' />"
                                   class="inline-flex items-center px-3 py-1 text-sm font-medium text-yellow-700 bg-yellow-100 rounded hover:bg-yellow-200 transition">
                                    <i class="fas fa-edit mr-1"></i> Update
                                </a>
                                <button onclick="confirmDelete(${clinic.id})"
                                        class="inline-flex items-center px-3 py-1 text-sm font-medium text-red-700 bg-red-100 rounded hover:bg-red-200 transition">
                                    <i class="fas fa-trash-alt mr-1"></i> Delete
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </main>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
        <div class="bg-white rounded-lg shadow-lg max-w-md w-full p-6">
            <h3 class="text-xl font-semibold text-red-600 mb-4">Confirm Deletion</h3>
            <p>Are you sure you want to delete this clinic?</p>
            <p class="text-red-600 font-semibold mt-2">This action cannot be undone!</p>
            <div class="mt-6 flex justify-end space-x-3">
                <button onclick="closeModal()" class="px-4 py-2 rounded border border-gray-300 hover:bg-gray-100">Cancel</button>
                <a id="confirmDeleteBtn" href="#" class="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700 transition">Delete</a>
            </div>
        </div>
    </div>

<script>
    function confirmDelete(clinicId) {
        const contextPath = "<%= request.getContextPath() %>";
        const deleteModal = document.getElementById('deleteModal');
        const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
        confirmDeleteBtn.href = contextPath + '/DeleteClinicServlet?id=' + clinicId;
        deleteModal.classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('deleteModal').classList.add('hidden');
    }

    // Close modal when clicking outside content
    window.onclick = function(event) {
        const modal = document.getElementById('deleteModal');
        if (event.target === modal) {
            closeModal();
        }
    }
</script>

</body>
</html>
