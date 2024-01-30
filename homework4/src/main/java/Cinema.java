import org.apache.ibatis.jdbc.ScriptRunner;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static java.lang.Thread.sleep;

public class Cinema {
    static Reader reader;

    public static void main(String[] args) {

        // auto close connection
        try (Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/postgres", "postgres", "Aida!2432")) {

            if (conn != null) {
                System.out.println("Successfully connected to the database!\n");
                sleep(5000);

                //Initialize the script runner
                ScriptRunner sr = new ScriptRunner(conn);
                System.out.println("Starting script: 'createTable.sql'\n");
                //Creating a reader object
                reader = new BufferedReader(new FileReader("homework4/src/main/resources/createTable.sql"));
                //Running the script
                sr.runScript(reader);
                System.out.println("\nEnding script 'createTable.sql'\n");

                sleep(5000);

                System.out.println("Starting script: 'tasks.sql'");
                //Creating a reader object
                reader = new BufferedReader(new FileReader("homework4/src/main/resources/tasks.sql"));
                //Running the script
                sr.runScript(reader);
                System.out.println("\nEnding script 'tasks.sql'\n");

                sleep(5000);

            } else {
                System.out.println("Failed to make connection!");
            }

        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
