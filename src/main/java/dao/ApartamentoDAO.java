/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import db.DBConnection;
import model.Apartamento;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApartamentoDAO {

    public List<Apartamento> listar() {
        List<Apartamento> apartamentos = new ArrayList<>();
        String sql = "SELECT * FROM apartamento";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Apartamento apartamento = new Apartamento();
                apartamento.setId(rs.getInt("id_apartamento"));
                apartamento.setNumeroApartamento(rs.getString("numero_apartamento"));
                apartamento.setTorre(rs.getString("torre"));
                apartamento.setArea(rs.getFloat("area"));
                apartamento.setNumeroHabitaciones(rs.getInt("numero_habitaciones"));
                apartamento.setNumeroBanos(rs.getInt("numero_banos"));
                apartamento.setIdResidente(rs.getInt("id_residente"));
                apartamentos.add(apartamento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return apartamentos;
    }

    public boolean crear(Apartamento apartamento) {
        String sql = "INSERT INTO apartamento (numero_apartamento, torre, area, numero_habitaciones, numero_banos, id_residente) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, apartamento.getNumeroApartamento());
            pstmt.setString(2, apartamento.getTorre());
            pstmt.setFloat(3, apartamento.getArea());
            pstmt.setInt(4, apartamento.getNumeroHabitaciones());
            pstmt.setInt(5, apartamento.getNumeroBanos());
            pstmt.setInt(6, apartamento.getIdResidente());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizar(Apartamento apartamento) {
        String sql = "UPDATE apartamento SET numero_apartamento = ?, torre = ?, area = ?, numero_habitaciones = ?, numero_banos = ?, id_residente = ? WHERE id_apartamento = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, apartamento.getNumeroApartamento());
            pstmt.setString(2, apartamento.getTorre());
            pstmt.setFloat(3, apartamento.getArea());
            pstmt.setInt(4, apartamento.getNumeroHabitaciones());
            pstmt.setInt(5, apartamento.getNumeroBanos());
            pstmt.setInt(6, apartamento.getIdResidente());
            pstmt.setInt(7, apartamento.getId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM apartamento WHERE id_apartamento = ?";
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