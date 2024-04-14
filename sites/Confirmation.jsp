<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.ArrayList" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Handle Form</title>
        </head>

        <body>

            <%
            // Initialize ArrayList to store form data
            ArrayList<String> memberDetails = new ArrayList<>();
        
            // Get form parameters
            String mail = request.getParameter("mail");
            String memberCountStr = request.getParameter("member-count");
        
            int memberCount = 0;  // Default value
        
            if (memberCountStr != null && !memberCountStr.isEmpty()) {
                try {
                    memberCount = Integer.parseInt(memberCountStr);
                } catch (NumberFormatException e) {
                    // Handle invalid member-count value
                    out.println("<p>Error: Invalid member count value</p>");
                    return;  // Exit the script
                }
            } else {
                // Handle missing member-count parameter
                out.println("<p>Error: Missing member count value</p>");
                return;  // Exit the script
            }
        
            // Store mail
            memberDetails.add("Email-Id: " + mail);
        
            // Store member details
            for (int i = 1; i <= memberCount; i++) {
                // ... (rest of the code remains unchanged)
            }
        
            // Display stored data
            out.println("<h2>Booking Details</h2>");
            out.println("<p>Email-Id: " + mail + "</p>");
            out.println("<h3>Members:</h3>");
            for (String member : memberDetails) {
                out.println("<p>" + member + "</p>");
            }
        %>
        

        </body>

        </html>