/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnection;
import model.Residente;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Residente;

/**
 *
 * @author JerNava
 */
public class ResidenteDAO {

    public List<Residente> listar() {
        List<Residente> residentes = new ArrayList<>();
        String sql = "SELECT * FROM residente";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Residente residente = new Residente();
                residente.setId(rs.getInt("id_residente"));
                residente.setNombre(rs.getString("nombre"));
                residente.setApellido(rs.getString("apellido"));
                residente.setTipoDocumento(rs.getString("tipo_documento"));
                residente.setNumeroDocumento(rs.getString("numero_documento"));
                residente.setTelefono(rs.getString("telefono"));
                residente.setEmail(rs.getString("email"));
                residentes.add(residente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return residentes;
    }

    // Implementar métodos de crear, actualizar y eliminar
}