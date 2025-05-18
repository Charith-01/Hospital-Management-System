<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }
        .form-group { 
            margin-bottom: 20px; 
        }
        label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: 500;
            color: #495057;
        }
        input[type="text"], 
        input[type="date"], 
        textarea,
        input[type="file"] { 
            width: 100%; 
            padding: 12px; 
            border: 1px solid #ced4da; 
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, 
        input[type="date"]:focus, 
        textarea:focus,
        input[type="file"]:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        textarea { 
            height: 120px; 
            resize: vertical;
        }
        button { 
            background-color: #28a745;
            color: white; 
            padding: 12px 20px; 
            border: none; 
            border-radius: 6px; 
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            width: 100%;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        button:hover { 
            background-color: #218838; 
        }
        .error { 
            color: #dc3545;
            background-color: #f8d7da;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
        }
        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add New Clinic</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="error">
                <i class="fas fa-exclamation-circle"></i> ${errorMessage}
            </div>
        </c:if>
        
        <form action="addClinic" method="post" enctype="multipart/form-data" id="clinicForm">
            <div class="form-group">
                <label for="name"><i class="fas fa-hospital"></i> Clinic Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="address"><i class="fas fa-map-marker-alt"></i> Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            
            <div class="form-group">
                <label for="date"><i class="fas fa-calendar-alt"></i> Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            
            <div class="form-group">
                <label for="description"><i class="fas fa-align-left"></i> Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="image"><i class="fas fa-image"></i> Clinic Image:</label>
                <input type="file" id="image" name="image" accept="image/*">
                <small class="text-muted">Max file size: 5MB</small>
            </div>
            
            <button type="submit">
                <i class="fas fa-plus-circle"></i> Add Clinic
            </button>
        </form>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Form validation
        document.getElementById('clinicForm').addEventListener('submit', function(e) {
            const fileInput = document.getElementById('image');
            if (fileInput.files.length > 0) {
                const fileSize = fileInput.files[0].size / 1024 / 1024; // in MB
                if (fileSize > 5) {
                    e.preventDefault();
                    alert('File size exceeds 5MB limit');
                }
            }
            
            // You can add more validation here if needed
        });
        
        // Date picker enhancement
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.getElementById('date');
            if (!dateInput.value) {
                const today = new Date().toISOString().split('T')[0];
                dateInput.value = today;
            }
        });
    </script>
</body>
</html>