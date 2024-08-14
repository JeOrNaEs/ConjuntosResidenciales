/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnection;
import model.Vehiculo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehiculoDAO {

    public List<Vehiculo> listar() {
        List<Vehiculo> vehiculos = new ArrayList<>();
        String sql = "SELECT * FROM vehiculo";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Vehiculo vehiculo = new Vehiculo();
                vehiculo.setIdVehiculo(rs.getInt("id_vehiculo"));
                vehiculo.setPlaca(rs.getString("placa"));
                vehiculo.setMarca(rs.getString("marca"));
                vehiculo.setModelo(rs.getString("modelo"));
                vehiculo.setColor(rs.getString("color"));
                vehiculo.setIdResidente(rs.getInt("id_residente"));
                vehiculos.add(vehiculo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculos;
    }

    public void agregar(Vehiculo vehiculo) {
        String sql = "INSERT INTO vehiculo (placa, marca, modelo, color, id_residente) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehiculo.getPlaca());
            pstmt.setString(2, vehiculo.getMarca());
            pstmt.setString(3, vehiculo.getModelo());
            pstmt.setString(4, vehiculo.getColor());
            pstmt.setInt(5, vehiculo.getIdResidente());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizar(Vehiculo vehiculo) {
        String sql = "UPDATE vehiculo SET placa=?, marca=?, modelo=?, color=?, id_residente=? WHERE id_vehiculo=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehiculo.getPlaca());
            pstmt.setString(2, vehiculo.getMarca());
            pstmt.setString(3, vehiculo.getModelo());
            pstmt.setString(4, vehiculo.getColor());
            pstmt.setInt(5, vehiculo.getIdResidente());
            pstmt.setInt(6, vehiculo.getIdVehiculo());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int idVehiculo) {
        String sql = "DELETE FROM vehiculo WHERE id_vehiculo=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idVehiculo);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Vehiculo obtenerPorId(int idVehiculo) {
        Vehiculo vehiculo = null;
        String sql = "SELECT * FROM vehiculo WHERE id_vehiculo=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idVehiculo);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                vehiculo = new Vehiculo();
                vehiculo.setIdVehiculo(rs.getInt("id_vehiculo"));
                vehiculo.setPlaca(rs.getString("placa"));
                vehiculo.setMarca(rs.getString("marca"));
                vehiculo.setModelo(rs.getString("modelo"));
                vehiculo.setColor(rs.getString("color"));
                vehiculo.setIdResidente(rs.getInt("id_residente"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculo;
    }
}