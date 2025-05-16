<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./partials/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <title>Update Appointment</title>
    <style>
        body {
            background-color: #036ffc !important;
            min-height: 100vh;
        }
        .container-wrapper {
            background-color: #036ffc;
            padding: 2rem 0;
        }
        .appointment-form {
            background-color: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .form-header {
            color: black;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f0f0f0;
        }
        .btn-update {
            background-color: #009900;
            border-color: black;
            padding: 0.5rem 2rem;
            color: white;
        }
        .btn-update:hover {
            background-color: #006600;
            border-color: #333;
            color: white;
        }
        .is-invalid {
            border-color: #dc3545;
        }
        .invalid-feedback {
            color: #dc3545;
            display: none;
        }
    </style>
</head>
<body>
<div class="container-wrapper">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="appointment-form">
                    <h1 class="form-header text-center">
                        <i class="fas fa-calendar-check me-2"></i>Update Appointment
                    </h1>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>

                    <form action="UpdateAppointmentServlet" method="post" id="appointmentForm" novalidate>
                        <input type="hidden" name="appointmentId" value="${appointment.id}" />

                        <div class="mb-3">
                            <label for="name" class="form-label">Patient Name</label>
                            <input type="text" class="form-control" id="name" name="name"
                                value="${appointment.patientName}" required />
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                value="${appointment.email}" required />
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone"
                                value="${appointment.phoneNumber}" required pattern="[0-9]{10}" maxlength="10" />
                            <div class="invalid-feedback" id="phoneError">
                                Please enter a valid 10-digit phone number (numbers only)
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="date" class="form-label">Appointment Date</label>
                            <input type="date" class="form-control" id="date" name="date"
                                value="${appointment.appointmentDate}" required />
                        </div>

                        <div class="mb-3">
                            <label for="doctor" class="form-label">Doctor</label>
                            <select class="form-select" id="doctor" name="doctor" required>
                                <option value="">Select a doctor</option>
                                <option value="Dr. John Smith - Cardiologist"
                                    <c:if test="${appointment.doctorName == 'Dr. John Smith - Cardiologist'}">selected</c:if>>
                                    Dr. John Smith - Cardiologist
                                </option>
                                <option value="Dr. Sarah Johnson - Neurologist"
                                    <c:if test="${appointment.doctorName == 'Dr. Sarah Johnson - Neurologist'}">selected</c:if>>
                                    Dr. Sarah Johnson - Neurologist
                                </option>
                                <option value="Dr. Michael Brown - Orthopedic Surgeon"
                                    <c:if test="${appointment.doctorName == 'Dr. Michael Brown - Orthopedic Surgeon'}">selected</c:if>>
                                    Dr. Michael Brown - Orthopedic Surgeon
                                </option>
                                <option value="Dr. Emily White - Pediatrician"
                                    <c:if test="${appointment.doctorName == 'Dr. Emily White - Pediatrician'}">selected</c:if>>
                                    Dr. Emily White - Pediatrician
                                </option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="note" class="form-label">Additional Notes</label>
                            <textarea class="form-control" id="note" name="note" rows="3">${appointment.additionalNotes}</textarea>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="viewAppointments.jsp" class="btn btn-secondary me-md-2">Cancel</a>
                            <button type="submit" class="btn btn-update">Update Appointment</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const phoneInput = document.getElementById('phone');
    const phoneError = document.getElementById('phoneError');

    phoneInput.addEventListener('input', function() {
        // Remove non-digit characters
        this.value = this.value.replace(/\D/g, '');

        // Validate length
        if (this.value.length !== 10) {
            this.classList.add('is-invalid');
            phoneError.style.display = 'block';
        } else {
            this.classList.remove('is-invalid');
            phoneError.style.display = 'none';
        }
    });

    document.getElementById('appointmentForm').addEventListener('submit', function(e) {
        if (phoneInput.value.length !== 10) {
            e.preventDefault();
            phoneInput.classList.add('is-invalid');
            phoneError.style.display = 'block';
            phoneInput.focus();
        }
    });
</script>

<%@ include file="./partials/footer.jsp" %>
</body>
</html>
