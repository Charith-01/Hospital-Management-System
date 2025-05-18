<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clinic List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-img { max-width: 100px; max-height: 100px; }
        .action-btns { white-space: nowrap; }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1>Clinics</h1>
    
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    
    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Date</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clinics}" var="clinic">
                <tr>
                    <td>${clinic.id}</td>
                    <td>${clinic.name}</td>
                    <td>${clinic.address}</td>
                    <td>${clinic.date}</td>
                    <td>${clinic.description}</td>
                    <td>
                        <c:if test="${not empty clinic.image}">
                            <img src="<c:url value='/${clinic.image}' />" 
                                 class="table-img" 
                                 alt="Clinic Image"
                                 onerror="this.src='<c:url value='/assets/default-clinic.jpg' />'">
                        </c:if>
                    </td>
                    <td class="action-btns">
                        <a href="<c:url value='/UpdateClinicServlet?id=${clinic.id}' />" 
                           class="btn btn-warning btn-sm">
                            <i class="fas fa-edit"></i> Update
                        </a>
                        <button onclick="confirmDelete(${clinic.id})" 
                                class="btn btn-danger btn-sm">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="<c:url value='/addClinic' />" class="btn btn-primary">Add New Clinic</a>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this clinic?</p>
                <p class="text-danger"><strong>This action cannot be undone!</strong></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a id="confirmDeleteBtn" href="#" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script>
function confirmDelete(clinicId) {
    const contextPath = "<%= request.getContextPath() %>";
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    document.getElementById('confirmDeleteBtn').href = contextPath + '/DeleteClinicServlet?id=' + clinicId;
    deleteModal.show();
}
</script>
</body>
</html>
