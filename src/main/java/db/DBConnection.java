/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author JerNava
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/conjunto_residencial";
    private static final String USER = "root";  // Reemplaza con tu usuario
    private static final String PASSWORD = "";  // Reemplaza con tu contraseña

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Error al conectar con la base de datos", e);
        }
    }
}
