package com.suwani.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.suwani.util.DBconnect;

@WebServlet("/ClinicImage")
public class ClinicImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int clinicId = Integer.parseInt(request.getParameter("clinicid")); // Getting the clinic ID from the request

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT clinic_image FROM clinics WHERE clinic_id = ?")) {

            stmt.setInt(1, clinicId); // Setting the clinicId parameter to fetch the correct image
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("clinic_image"); // Getting the image as a byte array

                if (imageData != null && imageData.length > 0) {
                    response.setContentType("image/jpeg"); // Set response content type as JPEG image
                    response.setContentLength(imageData.length); // Set the content length header

                    OutputStream out = response.getOutputStream();
                    out.write(imageData); // Write the image data to the response output stream
                    out.flush(); // Ensure all data is written to the output stream
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Set 404 if no image is found
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Set 404 if clinic ID doesn't exist
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Set 500 on error
        }
    }
}
