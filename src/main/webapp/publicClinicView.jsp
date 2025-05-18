<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Clinics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #e6f2ff;
            min-height: 100vh;
            padding: 20px 0;
        }
        .container {
            max-width: 1200px;
        }
        .clinic-card {
            transition: all 0.3s ease;
            height: 100%;
            border: none;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .clinic-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }
        .card-img-top {
            height: 220px;
            object-fit: cover;
            width: 100%;
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-title {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.75rem;
        }
        .card-text {
            color: #555;
            margin-bottom: 0.5rem;
        }
        .text-muted {
            color: #7f8c8d !important;
            font-size: 0.9rem;
        }
        .alert-warning {
            background-color: #fff3cd;
            border-color: #ffeeba;
            color: #856404;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
        }
        .page-title {
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 700;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
        }
        .page-title:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #3498db;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1 class="page-title">Our Clinics</h1>
    
    <c:choose>
        <c:when test="${not empty clinics}">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach items="${clinics}" var="clinic">
                    <div class="col">
                        <div class="card clinic-card h-100">
                            <c:choose>
                                <c:when test="${not empty clinic.image}">
                                    <img src="<c:url value='/${clinic.image}' />"
                                         class="card-img-top" 
                                         alt="<c:out value='${clinic.name}' />"
                                         loading="lazy"
                                         onerror="this.onerror=null;this.src='<c:url value='/assets/default-clinic.jpg' />';" />
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value='/assets/default-clinic.jpg' />" 
                                         class="card-img-top" 
                                         alt="Default clinic image"
                                         loading="lazy" />
                                </c:otherwise>
                            </c:choose>
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${clinic.name}" /></h5>
                                <p class="card-text"><i class="fas fa-map-marker-alt text-primary"></i> <c:out value="${clinic.address}" /></p>
                                <p class="text-muted"><i class="far fa-calendar-alt"></i> <c:out value="${clinic.date}" /></p>
                                <p class="card-text"><c:out value="${clinic.description}" /></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning">
                <i class="fas fa-exclamation-circle me-2"></i>No clinics found.
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
