<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { padding: 20px; }
        .form-group { margin-bottom: 15px; }
        .current-image { max-width: 200px; margin-bottom: 10px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Clinic</h1>
    
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
            <c:out value="${errorMessage}" />
        </div>
    </c:if>
    
    <form action="<c:url value='/UpdateClinicServlet' />" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<c:out value='${clinic.id}' />" />
        
        <div class="form-group">
            <label for="name">Clinic Name:</label>
            <input type="text" class="form-control" id="name" name="name" 
                   value="<c:out value='${clinic.name}' />" required>
        </div>
        
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" name="address" 
                   value="<c:out value='${clinic.address}' />" required>
        </div>
        
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" class="form-control" id="date" name="date" 
                   value="<c:out value='${clinic.date}' />" required>
        </div>
        
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" required><c:out value="${clinic.description}" /></textarea>
        </div>
        
        <div class="form-group">
            <label>Current Image:</label><br>
            <img src="<c:url value='/${clinic.image}' />" 
                 class="current-image img-thumbnail"
                 alt="Current Clinic Image"
                 onerror="this.onerror=null;this.src='<c:url value='/assets/default-clinic.jpg' />';" />
        </div>
        
        <div class="form-group">
            <label for="image">Update Image (leave blank to keep current):</label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*">
        </div>
        
        <button type="submit" class="btn btn-primary">
            <i class="fas fa-save"></i> Update Clinic
        </button>
        <a href="<c:url value='/RetrieveClinicServlet' />" class="btn btn-secondary">
            <i class="fas fa-times"></i> Cancel
        </a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
