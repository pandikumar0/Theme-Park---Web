
package Client;

import java.util.*;

public class Member {
    public int memberId;
    public int ticket_id;
    public String name;
    public int age;
    public double height;
    public String aadhar;

    public void createMember(int ticket_id, String name, int age, double height, String aadhar) {
        this.ticket_id = ticket_id;
        this.name = name;
        this.age = age;
        this.height = height;
        this.aadhar = aadhar;
    }

}