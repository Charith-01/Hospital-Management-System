package com.suwani.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.suwani.model.Clinic;
import com.suwani.service.ClinicService;

@WebServlet("/addClinic")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class AddClinicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ClinicService clinicService = new ClinicService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/addClinic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String date = request.getParameter("date");
            String description = request.getParameter("description");

            String imagePath = null;
            Part filePart = request.getPart("image");

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getFileName(filePart);
                if (fileName != null && !fileName.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "assets";

                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
                    File file = new File(uploadPath + File.separator + uniqueFileName);

                    try (InputStream fileContent = filePart.getInputStream()) {
                        Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                        imagePath = "assets/" + uniqueFileName;
                    }
                }
            }

            Clinic clinic = new Clinic();
            clinic.setName(name);
            clinic.setAddress(address);
            clinic.setDate(date);
            clinic.setDescription(description);
            clinic.setImage(imagePath);

            boolean success = clinicService.addClinic(clinic);

            if (success) {
                response.sendRedirect("RetrieveClinicServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to add clinic.");
                request.getRequestDispatcher("addClinic.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("addClinic.jsp").forward(request, response);
        }
    }

    // Utility method to extract filename from content-disposition header
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            String[] tokens = contentDisp.split(";");
            for (String token : tokens) {
                if (token.trim().startsWith("filename")) {
                    String fileName = token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
                    return Paths.get(fileName).getFileName().toString(); // MSIE fix
                }
            }
        }
        return null;
    }
}
