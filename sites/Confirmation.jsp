<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="Member" %>
<%@ page import="Ticket" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Handle Form</title>
</head>

<body>

<%

    List<Member> MemberList = new ArrayList<>();
    List<Ticket> TicketList = new ArrayList<>();

    String mail = request.getParameter("mail");
    String memberCountStr = request.getParameter("member-count");

    int memberCount = 0;  

    if (memberCountStr != null && !memberCountStr.isEmpty()) {
        try {
            memberCount = Integer.parseInt(memberCountStr);
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid member count value</p>");
            return;  
        }
    } else {
        out.println("<p>Error: Missing member count value</p>");
        return;  
    }

    Random rand = new Random();
    int t_id = rand.nextInt(1000);

    // Store member details
    for (int i = 1; i <= memberCount; i++) {
        Member member = new Member();
        member.name = request.getParameter("name" + i);
        member.age = Integer.parseInt(request.getParameter("age" + i));
        member.height = Double.parseDouble(request.getParameter("height" + i));
        member.aadhar = request.getParameter("aadhar" + i);
        member.ticket_id = t_id;
        MemberList.add(member);
    }

    // Display stored data
    out.println("<section style=\"text-align:center;\">");
    out.println("<h2>Booking Details</h2>");
    out.println("<p>Email-Id: " + mail + "</p>");
    out.println("<table><tr><th>Person Name </th><th>Age</th><th>Height</th><th>Unique ID</th><th>Ticket Price</th></tr>");
    
    double totalPrice = 0;
    for (Member member : MemberList) {
        out.println("<tr><td>" + member.name + "</td><td>" + member.age + "</td><td>" + member.height + "</td><td>" + member.aadhar + "</td>");
        double price;
        if (member.height <= 140 || member.age <= 12) {
            price = 250;  
        } else {
            price = 500.0;
        }
        out.println("<td>" + price + "</td></tr>");
    }
    out.println("</section>");
%>

</body>

</html>
