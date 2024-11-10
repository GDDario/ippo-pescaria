/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private final String bd;
    private final String usuario;
    private final String senha;

    public DatabaseConnection() {
        bd = "jdbc:postgresql://127.0.0.1:5432/ippo-pescaria";
        usuario = "postgres";
        senha = "postgres";
    }

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(bd, usuario, senha);
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
//            System.out.println("Erro na conexão: " + erro);
            return null;
        }
    }
}
