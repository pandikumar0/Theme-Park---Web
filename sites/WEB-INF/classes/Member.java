import java.util.*;

public class Member {
    static int memberId = 123;
    int ticket_id;
    String name;
    int age;
    double height;
    String aadhar;

    public void createMember(int ticket_id, String name, int age, double height, String aadhar) {
        this.ticket_id = ticket_id;
        this.name = name;
        this.age = age;
        this.height = height;
        this.aadhar = aadhar;
    }

}