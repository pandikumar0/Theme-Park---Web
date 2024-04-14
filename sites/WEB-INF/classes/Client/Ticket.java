package Client;

import java.util.*;

public class Ticket {
    public int ticket_id;
    public int user_id;
    public double ticket_price;
    public String booking_date;
    public String status;
    public String email;

    public void setTicket(int id, int usr, double price, String date, String status, String email) {
        this.ticket_id = id;
        this.user_id = usr;
        this.ticket_price = price;
        this.booking_date = date;
        this.status = status;
        this.email = email;
    }
}
