/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnection;
import model.Pago;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PagoDAO {

    public List<Pago> listar() {
        List<Pago> pagos = new ArrayList<>();
        String sql = "SELECT * FROM pago";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Pago pago = new Pago();
                pago.setId(rs.getInt("id_pago"));
                pago.setIdResidente(rs.getInt("id_residente"));
                pago.setMonto(rs.getDouble("monto"));
                pago.setDescripcion(rs.getString("descripcion"));
                pagos.add(pago);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pagos;
    }

    public boolean crear(Pago pago) {
        String sql = "INSERT INTO pago (id_residente, monto, descripcion) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pago.getIdResidente());
            pstmt.setDouble(2, pago.getMonto());
            pstmt.setString(3, pago.getDescripcion());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizar(Pago pago) {
        String sql = "UPDATE pago SET id_residente = ?, monto = ?, descripcion = ? WHERE id_pago = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pago.getIdResidente());
            pstmt.setDouble(2, pago.getMonto());
            pstmt.setString(3, pago.getDescripcion());
            pstmt.setInt(4, pago.getId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM pago WHERE id_pago = ?";
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