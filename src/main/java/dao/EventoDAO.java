/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnection;
import model.Evento;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventoDAO {

    public List<Evento> listar() {
        List<Evento> eventos = new ArrayList<>();
        String sql = "SELECT * FROM evento";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setId(rs.getInt("id_evento"));
                evento.setNombreEvento(rs.getString("nombre_evento"));
                evento.setFechaEvento(rs.getString("fecha_evento"));
                evento.setDescripcion(rs.getString("descripcion"));
                evento.setIdResidente(rs.getInt("id_residente"));
                eventos.add(evento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventos;
    }

    public boolean crear(Evento evento) {
        String sql = "INSERT INTO evento (nombre_evento, fecha_evento, descripcion, id_residente) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setString(2, evento.getFechaEvento());
            pstmt.setString(3, evento.getDescripcion());
            pstmt.setInt(4, evento.getIdResidente());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizar(Evento evento) {
        String sql = "UPDATE evento SET nombre_evento = ?, fecha_evento = ?, descripcion = ?, id_residente = ? WHERE id_evento = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, evento.getNombreEvento());
            pstmt.setString(2, evento.getFechaEvento());
            pstmt.setString(3, evento.getDescripcion());
            pstmt.setInt(4, evento.getIdResidente());
            pstmt.setInt(5, evento.getId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM evento WHERE id_evento = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}