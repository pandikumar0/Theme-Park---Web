import java.util.*;

public class Ticket {
    int ticket_id;
    int user_id;
    double ticket_price;
    String booking_date;
    String status;
    String email;

    public void setTicket(int id, int usr, double price, String date, String status, String email) {
        this.ticket_id = id;
        this.user_id = usr;
        this.ticket_price = price;
        this.booking_date = date;
        this.status = status;
        this.email = email;
    }
}
