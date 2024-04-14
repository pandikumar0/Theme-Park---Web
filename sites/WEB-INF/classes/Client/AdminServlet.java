package Client;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminServlet extends HttpServlet {
    public AdminServlet() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<body>");

        out.println("<h2>Booking List</h2>");
        out.println(
                "<table border='2'><tr><th>TicketId</th><th>Price</th><th>Email</th><th>Booked Date</th><th>Status</th></tr>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Astralland", "root", "root");

            Statement st = conn.createStatement();
            ResultSet set = st.executeQuery("select * from Ticket;");

            while (set.next()) {
                out.println("<tr>");
                int t_id = set.getInt("ticket_id");
                out.println("<td>" + t_id + "</td>");
                out.println("<td>" + set.getDouble("ticket_price") + "</td>");
                out.println("<td>" + set.getString("email") + "</td>");
                out.println("<td>" + set.getString("booking_date") + "</td>");
                out.println("<td>" + set.getString("status") + "</td>");

                PreparedStatement ps = conn.prepareStatement("Select * from member where member.ticket_id = ?");
                ps.setInt(1, t_id);
                ResultSet rs = ps.executeQuery();
                out.println("<tr><th>Name</th><th>Age</th><th>Height</th><th>aadhar</th><tr/>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getInt("age") + "</td>");
                    out.println("<td>" + rs.getDouble("Height") + "</td>");
                    out.println("<td>" + rs.getString("aadhar") + "</td>");
                    out.println("</tr>");
                }
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body>");

        } catch (Exception e) {
            out.println("Not Responding DB");
        }
    }
}
