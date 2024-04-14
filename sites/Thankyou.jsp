    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat, Client.Member, Client.Ticket, Client.DBConnection" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thankyou</title>
    </head>

    <body style="text-align: center;">
        <h2>Thank you for Booking!</h2>
        <hr>
        <p>Your booking has been successfully processed.</p>

        <p>Soon, you will receive an email containing your ticket details and safety instructions.</p>

        <p>We hope you have a great experience!</p>
    </body>

    <%
        // Receive from session
        List<Member> MemberList = (List<Member>) session.getAttribute("MemberList");
        Ticket tkt = (Ticket)session.getAttribute("ticket"); 
        Connection conn = DBConnection.getConnection();
        //Write in DB for Ticket
        
        Statement stmt = conn.createStatement();
       PreparedStatement pstm = conn.prepareStatement("INSERT INTO ticket (ticket_id, ticket_price, booking_date, status, email) VALUES (?, ?, ?, ?, ?)");
        pstm.setInt(1, tkt.ticket_id);
        pstm.setDouble(2, tkt.ticket_price);
        pstm.setString(3, tkt.booking_date);
        pstm.setString(4, tkt.status);
        pstm.setString(5, tkt.email);
        pstm.executeUpdate();
        


        //Write in DB for Member

        for(Member m : MemberList){
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO MEMBER(ticket_id, name, age, height, aadhar) VALUES(?,?,?,?,?)");
            pstmt.setInt(1, m.ticket_id);
            pstmt.setString(2,m.name);
            pstmt.setInt(3,m.age);
            pstmt.setDouble(4,m.height);
            pstmt.setString(5,m.aadhar);
            pstmt.executeUpdate();
        }
       
    %>

    </html>