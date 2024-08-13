package requestSample;

import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCTest {
    @Test
    public void testConnection() throws Exception {

        // DB Driver Class
        Class.forName("com.mysql.cj.jdbc.Driver");

        // URL
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/soomgodb",
                "root",
                "1234");

        System.out.println(connection);
        // username, password

        connection.close();
    }
}
