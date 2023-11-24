import java.sql.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 *
 * To get started you need to download
 *
 * mysql-connector-j-8.0.31.jar slf4j-api-2.0.3.jar slf4j-simple-2.0.3.jar
 * 
 * from Maven Central and put them in the directory lib
 * 
 */

public class App {
    private static Logger log = LoggerFactory.getLogger(App.class);

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/dbLektion4",
                "root", "yrgoP4ssword")) {

            printAll(conn);

            printMatching(conn, true);

            long theKey = insert(conn, "foo@example.com", true, true);
            System.out.println("Skapade rad med id: " + theKey);
        }
        catch (SQLException ex) {
            log.error("problem with SQL query", ex);
            System.err.println("Oh noes: " + ex.getMessage());
        }
    }

    private static void printAll(Connection conn) throws SQLException {
        final String query = "SELECT id, email, newsletter, spam FROM contacts";
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                boolean news = rs.getBoolean("newsletter");
                boolean spam = rs.getBoolean("spam");

                System.out.printf("%d %s %b %b%n", id, email, news, spam);
            }
        }
    }

    private static void printMatching(Connection conn, boolean newsletter) throws SQLException {
        String query = "SELECT email FROM contacts WHERE newsletter=?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setBoolean(1, newsletter);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String email = rs.getString("email");
                System.out.printf("%s %b%n", email, newsletter);
            }
        }
    }

    private static long insert(Connection conn, String email, boolean news, boolean spam)
            throws SQLException {
        String insertStmt = "INSERT INTO contacts (email, newsletter, spam)" + " VALUES (?, ?, ?)";
        try (PreparedStatement stmt =
                conn.prepareStatement(insertStmt, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, email);
            stmt.setBoolean(2, news);
            stmt.setBoolean(3, spam);
            stmt.executeUpdate();
            ResultSet keys = stmt.getGeneratedKeys();
            if (keys.next()) {
                return keys.getLong(1);
            }

            throw new RuntimeException("oops!");
        }
    }

}
