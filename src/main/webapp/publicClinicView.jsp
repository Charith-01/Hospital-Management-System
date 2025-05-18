<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Clinics</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .fade-in {
            animation: fadeIn 1s ease-in-out both;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 via-white to-green-50 text-gray-800 min-h-screen">



<!-- Header Section -->
<div class="max-w-7xl mx-auto px-4 py-12">
    <div class="text-center mb-12">
        <div class="inline-block text-blue-600 text-4xl mb-3 animate-pulse">
            <i class="fas fa-clinic-medical"></i>
        </div>
        <h1 class="text-5xl font-bold text-blue-700 mb-4">Our Clinics</h1>
        <p class="text-gray-600 text-lg max-w-xl mx-auto">Explore our top-rated clinics across the country. Trusted doctors, clean facilities, and reliable care.</p>
        <div class="h-1 w-24 bg-blue-500 mx-auto mt-4 rounded-full"></div>
    </div>

    <!-- Clinic Cards Section -->
    <c:choose>
        <c:when test="${not empty clinics}">
            <div class="grid gap-10 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 fade-in">
                <c:forEach items="${clinics}" var="clinic">
                    <div class="bg-white rounded-3xl shadow-xl overflow-hidden hover:shadow-2xl hover:scale-[1.03] transition-transform duration-300 border border-gray-100">
                        <c:choose>
                            <c:when test="${not empty clinic.image}">
                                <img src="<c:url value='/${clinic.image}' />"
                                     alt="<c:out value='${clinic.name}' />"
                                     class="w-full h-60 object-cover"
                                     loading="lazy"
                                     onerror="this.onerror=null;this.src='<c:url value='/assets/default-clinic.jpg' />';" />
                            </c:when>
                            <c:otherwise>
                                <img src="<c:url value='/assets/default-clinic.jpg' />"
                                     alt="Default clinic image"
                                     class="w-full h-60 object-cover"
                                     loading="lazy" />
                            </c:otherwise>
                        </c:choose>
                        <div class="p-6">
                            <h2 class="text-2xl font-semibold text-gray-900 mb-2">
                                <i class="fas fa-hospital mr-2 text-blue-500"></i>
                                <c:out value="${clinic.name}" />
                            </h2>
                            <p class="text-sm text-gray-600 mb-1">
                                <i class="fas fa-map-marker-alt text-red-500 mr-1"></i>
                                <c:out value="${clinic.address}" />
                            </p>
                            <p class="text-sm text-gray-500 mb-3">
                                <i class="far fa-calendar-alt text-green-600 mr-1"></i>
                                <c:out value="${clinic.date}" />
                            </p>
                            <p class="text-gray-700 text-sm mb-4 leading-relaxed">
                                <c:out value="${clinic.description}" />
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center bg-yellow-100 text-yellow-800 border border-yellow-300 p-8 rounded-xl mt-12 shadow-md fade-in">
                <i class="fas fa-exclamation-triangle text-3xl mb-3"></i>
                <p class="text-xl font-medium">No clinics found at the moment.</p>
                <p class="text-sm text-yellow-700">Please check back later or contact support.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
