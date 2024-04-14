package Client;

import java.sql.*;
import java.util.*;

public class DBConnection {

    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Astralland";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    // Load MySQL JDBC driver and get database connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // Generate unique ticket_id not in the ticket table
    public static synchronized int generateTicketId() {
        Connection conn = getConnection();
        int t_id = 1; // default value

        try {
            // Fetch all ticket_ids from ticket table
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT MAX(ticket_id) FROM ticket");
            int maxTicketId = 0;
            if (rs.next()) {
                maxTicketId = rs.getInt(1);
            }
            int newTicketId = maxTicketId + 1;
            t_id = newTicketId;

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn);
        }

        return t_id;
    }

    // Close database connection
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
