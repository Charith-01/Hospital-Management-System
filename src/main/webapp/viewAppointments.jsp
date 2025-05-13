<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="./partials/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>My Appointments</title>
    <style>
    /* Previous styles remain the same */
    body {
        background-color: #036ffc !important;
        min-height: 100vh;
    }
    .container-wrapper {
        background-color: ##036ffc;
        padding: 2rem 0;
    }
    .appointment-card {
        transition: transform 0.3s;
        width: 100%;
        border-radius: 15px;
        overflow: hidden;
        border: none;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .appointment-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.15);
    }
    .card-container {
        max-width: 800px;
        margin: 0 auto;
    }
    .card-body {
        padding: 2rem;
        background-color: white;
    }
    .card-header {
        border-radius: 15px 15px 0 0 !important;
        background-color: black !important;
        color: white !important;
    }
    .appointment-title {
        color: #6c757d !important;
        background-color: white;
        padding: 1.5rem;
        border-radius: 10px;
        margin-bottom: 2rem;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .btn-primary {
        background-color: #339933;
        border-color: black;
    }
    .text-primary {
        color: black !important;
    }
    .appointment-details {
        background-color: #f8f9fa !important;
    }
    .badge.bg-light.text-primary {
        color: black !important;
        background-color: #f8f9fa !important;
    }

    /* New styles to prevent overflow */
    .appointment-details .list-group-item span.fw-bold {
        word-break: break-all;
        max-width: 60%;
        text-align: right;
    }
    .appointment-details .list-group-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .notes-section .bg-light p {
        word-break: break-word;
        white-space: pre-wrap;
    }
</style>
</head>
<body>
    <div class="container-wrapper">
        <!-- Success/Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show text-center">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <c:remove var="successMessage" scope="session"/>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show text-center">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <c:remove var="errorMessage" scope="session"/>
        </c:if>

        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center appointment-title">
                <h1 class="display-4 fw-bold m-0">
                    <i class="fas fa-calendar-check me-3"></i>My Appointments
                </h1>
                <a href="Appointment.jsp" class="btn btn-primary btn-lg">
                    <i class="fas fa-plus me-2"></i>New Appointment
                </a>
            </div>

            <c:choose>
                <c:when test="${not empty appointments}">
                    <div class="row">
                        <c:forEach var="appointment" items="${appointments}">
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card appointment-card h-100">
                                    <div class="card-header bg-primary text-white">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h4 class="card-title mb-0"><i class="fas fa-calendar-day me-2"></i>Appointment</h4>
                                            <span class="badge bg-light text-primary fs-6">Confirmed</span>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex mb-4">
                                            <div class="flex-shrink-0">
                                                <i class="fas fa-user-md fa-3x text-primary"></i>
                                            </div>
                                            <div class="flex-grow-1 ms-4">
                                                <h3 class="card-title text-dark">${appointment.doctorName}</h3>
                                                <p class="text-muted">Patient: ${appointment.patientName}</p>
                                            </div>
                                        </div>
                                        <div class="appointment-details p-4 rounded mb-4">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item bg-transparent d-flex justify-content-between align-items-center fs-5 py-3">
                                                    <span class="text-primary"><i class="far fa-calendar me-2"></i>Date</span>
                                                    <span class="fw-bold text-dark">${appointment.appointmentDate}</span>
                                                </li>
                                                <li class="list-group-item bg-transparent d-flex justify-content-between align-items-center fs-5 py-3">
                                                    <span class="text-primary"><i class="fas fa-phone me-2"></i>Contact</span>
                                                    <span class="fw-bold text-dark">${appointment.phoneNumber}</span>
                                                </li>
                                                <li class="list-group-item bg-transparent d-flex justify-content-between align-items-center fs-5 py-3">
                                                    <span class="text-primary"><i class="fas fa-envelope me-2"></i>Email</span>
                                                    <span class="fw-bold text-dark">${appointment.email}</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="notes-section mt-4">
                                            <h5 class="text-primary mb-3"><i class="fas fa-notes-medical me-2"></i>Notes</h5>
                                            <div class="p-3 bg-light rounded">
                                                <p class="fs-5 mb-0">${appointment.additionalNotes}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-white py-3 border-top-0">
                                        <div class="d-flex justify-content-end">
                                            <button class="btn btn-outline-danger btn-lg px-4" 
                                                 onclick="confirmDelete('${appointment.email}', '${appointment.doctorName}', '${appointment.patientName}')">
                                                <i class="fas fa-trash-alt me-2"></i>Cancel Appointment
                                            </button>
                                            <button class="btn btn-outline-primary btn-lg px-4 me-2" 
                                                onclick="window.location.href='UpdateAppointmentServlet?email=${appointment.email}'">
                                                <i class="fas fa-edit me-2"></i>Edit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning text-center">
                        <h4>No appointments found</h4>
                        <p>You don't have any upcoming appointments. Click "New Appointment" to schedule one.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function confirmDelete(email, doctorName, patientName) {
        if (confirm("Are you sure you want to cancel this appointment with Dr. " + doctorName + "?")) {
            // Create a form dynamically
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = 'DeleteAppointmentServlet';
            
            // Add parameters as hidden inputs
            var emailInput = document.createElement('input');
            emailInput.type = 'hidden';
            emailInput.name = 'email';
            emailInput.value = email;
            form.appendChild(emailInput);
            
            var doctorInput = document.createElement('input');
            doctorInput.type = 'hidden';
            doctorInput.name = 'doctorName';
            doctorInput.value = doctorName;
            form.appendChild(doctorInput);
            
            var patientInput = document.createElement('input');
            patientInput.type = 'hidden';
            patientInput.name = 'patientName';
            patientInput.value = patientName;
            form.appendChild(patientInput);
            
            // Add redirect parameter
            var redirectInput = document.createElement('input');
            redirectInput.type = 'hidden';
            redirectInput.name = 'redirectToAppointment';
            redirectInput.value = 'true';
            form.appendChild(redirectInput);
            
            // Submit the form
            document.body.appendChild(form);
            form.submit();
        }
    }
    </script>
    <%@ include file="./partials/footer.jsp" %>
</body>
</html>