<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clinic Added Successfully</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { padding-top: 50px; text-align: center; }
        .success-message { color: #4CAF50; font-size: 24px; margin-bottom: 30px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-message">
            <i class="fas fa-check-circle"></i> Clinic has been added successfully!
        </div>
        
        <div class="d-grid gap-3 col-md-6 mx-auto">
            <a href="<%= request.getContextPath() %>/addClinic.jsp" class="btn btn-secondary">
                <i class="fas fa-plus-circle me-1"></i> Add Another Clinic
            </a>
            <a href="<%= request.getContextPath() %>/PublicClinicServlet" class="btn btn-primary">
                <i class="fas fa-hospital me-1"></i> View Public Clinic List
            </a>
            <a href="<%= request.getContextPath() %>/RetrieveClinicServlet" class="btn btn-info">
                <i class="fas fa-list me-1"></i> View Admin Clinic List
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
