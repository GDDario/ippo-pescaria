package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

// @WebServlet("/contact")
public class ContactController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/ippo";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = """
                    INSERT INTO
                    	contacts (name, email, subject, message)
                    VALUES
                        (?, ?, ?, ?)
                    """;
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, subject); // Assunto tratado como "phone" no banco.
                statement.setString(4, message);
                statement.executeUpdate();
            }
            response.sendRedirect("index.jsp?success=true"); // Redirecione para uma página de sucesso.
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?success=false"); // Redirecione para uma página de erro.
        }
    }
}
