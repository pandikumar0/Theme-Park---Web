<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat, Client.Member, Client.Ticket, Client.DBConnection" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation</title>
    <style>
        table {
            border: 1px inset black;
            border-collapse: collapse;
            border-radius: 3px;
        }
        th, td {
            border: 1px outset black;
            padding: 8px;
            text-align: left;
            border-radius: 3px;
        }
    </style>
    <%-- <link rel="stylesheet" href="./styles/styles.css"> --%>
</head>

<body>
<h1>Ticket Booking Confirmation</h1>
<hr>

<%

    List<Member> MemberList = new ArrayList<>();
    Ticket tkt = new Ticket();

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

    String date = request.getParameter("date");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date selectedDate = sdf.parse(date);
    java.util.Date currentDate = new java.util.Date();

    if( selectedDate.before(currentDate)){
     out.println("<p>Booking is not possible. Selected date is before the current date.</p>");
     out.println("Choose Alternate Date<br><br>");
     out.println("<button onclick=\"./BookingNew.html\">Choose Another Date</button>");
     return;
    }

    
    int t_id = DBConnection.generateTicketId();
    tkt.ticket_id= t_id;

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
    out.println("<section>");
    out.println("<h2>"+"Member Confirmation"+"</h2><br>");
    out.println("<p>User-Email-Id: " + mail + "</p>");
    out.println("<table><tr><th>Person Name </th><th>Age</th><th>Height</th><th>Unique ID</th><th>Ticket Price</th></tr>");
    
    double totalPrice = 0;
    for (Member member : MemberList) {
        out.println("<tr><td>" + member.name + "</td><td>" + member.age + "</td><td>" + member.height + "</td><td>" + member.aadhar + "</td>");
        double price;
        if (member.height <= 130 || member.age <= 12) {
            price = 250;  
        } else {
            price = 500.0;
        }
        totalPrice += price;
        out.println("<td>" + price + "</td></tr>");
    }
    out.println("<tr>"+"Total Ticket Fare: "+totalPrice+"</tr>");
    out.println("</table>");
    out.println("</section>");

    //Assign ticket object
    // public void setTicket(int id, int usr, double price, String date, String status, String email)
    tkt.setTicket(t_id, -1, totalPrice, sdf.format(currentDate) , "BOOKED", mail );

    session.setAttribute("MemberList", MemberList);
    session.setAttribute("ticket", tkt);
    
%>

<button type="submit" onclick=" redirectToPage('./Thankyou.jsp')">Confirm</button>
<button  onclick="redirectToPage('./index.html')">Cancel</button>
<script>
function redirectToPage(pageUrl) {
        window.location.href = pageUrl;
    }
</script>
</body>

</html>
