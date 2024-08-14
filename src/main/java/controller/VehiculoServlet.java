/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.VehiculoDAO;
import model.Vehiculo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehiculo")
public class VehiculoServlet extends HttpServlet {

    private VehiculoDAO vehiculoDAO =  new VehiculoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            mostrarFormularioEdicion(request, response);
        } else if ("delete".equals(action)) {
            eliminarVehiculo(request, response);
        } else {
            listarVehiculos(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            agregarVehiculo(request, response);
        } else if ("update".equals(action)) {
            actualizarVehiculo(request, response);
        }
    }

    private void listarVehiculos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Vehiculo> vehiculos = vehiculoDAO.listar();
        request.setAttribute("vehiculos", vehiculos);
        request.getRequestDispatcher("vehiculo-list.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idVehiculo = Integer.parseInt(request.getParameter("id"));
        Vehiculo vehiculo = vehiculoDAO.obtenerPorId(idVehiculo);
        request.setAttribute("vehiculo", vehiculo);
        request.getRequestDispatcher("vehiculo-form.jsp").forward(request, response);
    }

    private void agregarVehiculo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Vehiculo vehiculo = new Vehiculo();
        vehiculo.setPlaca(request.getParameter("placa"));
        vehiculo.setMarca(request.getParameter("marca"));
        vehiculo.setModelo(request.getParameter("modelo"));
        vehiculo.setColor(request.getParameter("color"));
        vehiculo.setIdResidente(Integer.parseInt(request.getParameter("id_residente")));
        vehiculoDAO.agregar(vehiculo);
        response.sendRedirect("VehiculoServlet");
    }

    private void actualizarVehiculo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idVehiculo = Integer.parseInt(request.getParameter("id"));
        Vehiculo vehiculo = new Vehiculo();
        vehiculo.setIdVehiculo(idVehiculo);
        vehiculo.setPlaca(request.getParameter("placa"));
        vehiculo.setMarca(request.getParameter("marca"));
        vehiculo.setModelo(request.getParameter("modelo"));
        vehiculo.setColor(request.getParameter("color"));
        vehiculo.setIdResidente(Integer.parseInt(request.getParameter("id_residente")));
        vehiculoDAO.actualizar(vehiculo);
        response.sendRedirect("VehiculoServlet");
    }

    private void eliminarVehiculo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idVehiculo = Integer.parseInt(request.getParameter("id"));
        vehiculoDAO.eliminar(idVehiculo);
        response.sendRedirect("VehiculoServlet");
    }
}