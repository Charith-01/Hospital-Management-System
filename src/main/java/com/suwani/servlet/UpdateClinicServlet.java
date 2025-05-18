package com.suwani.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.suwani.model.Clinic;
import com.suwani.service.ClinicService;

@WebServlet("/UpdateClinicServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class UpdateClinicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClinicService clinicService = new ClinicService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Clinic clinic = clinicService.getClinicById(id);
            request.setAttribute("clinic", clinic);
            request.getRequestDispatcher("/updateClinic.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading clinic for update");
            request.getRequestDispatcher("/clinicList.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String date = request.getParameter("date");
            String description = request.getParameter("description");
            
            // Get existing clinic data
            Clinic existingClinic = clinicService.getClinicById(id);
            String imagePath = existingClinic.getImage();
            
            // Handle file upload if new image is provided
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                // Use alternative method to get filename from Part header
                String fileName = getFileName(filePart);
                if (fileName != null && !fileName.isEmpty()) {
                    // Generate unique filename
                    String uniqueFileName = System.currentTimeMillis() + "_" + fileName.replace(" ", "_");
                    
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "assets";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdirs();
                    
                    // Delete old image if exists
                    if (existingClinic.getImage() != null && !existingClinic.getImage().isEmpty()) {
                        File oldFile = new File(getServletContext().getRealPath("") + File.separator + existingClinic.getImage());
                        if (oldFile.exists()) {
                            oldFile.delete();
                        }
                    }
                    
                    // Save new file
                    String filePath = uploadPath + File.separator + uniqueFileName;
                    try (InputStream fileContent = filePart.getInputStream()) {
                        Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                    }
                    imagePath = "assets/" + uniqueFileName;
                }
            }
            
            // Update clinic object
            Clinic clinic = new Clinic();
            clinic.setId(id);
            clinic.setName(name);
            clinic.setAddress(address);
            clinic.setDate(date);
            clinic.setDescription(description);
            clinic.setImage(imagePath);
            
            // Update in database
            boolean isSuccess = clinicService.updateClinic(clinic);
            
            if (isSuccess) {
                response.sendRedirect(request.getContextPath() + "/RetrieveClinicServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to update clinic");
                request.setAttribute("clinic", clinic);
                request.getRequestDispatcher("/updateClinic.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating clinic: " + e.getMessage());
            request.getRequestDispatcher("/updateClinic.jsp").forward(request, response);
        }
    }
    
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp == null)
            return null;
        
        for (String cd : contentDisp.split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf(File.separator) + 1); // handle IE or other full paths
            }
        }
        return null;
    }
}
