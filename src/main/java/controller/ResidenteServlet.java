/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ResidenteDAO;
import model.Residente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/residente")
public class ResidenteServlet extends HttpServlet {

    private ResidenteDAO residenteDAO = new ResidenteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Residente> residentes = residenteDAO.listar();
        request.setAttribute("residentes", residentes);
        request.getRequestDispatcher("residente.jsp").forward(request, response);
    }

    // Implementar métodos POST para crear, actualizar y eliminar
}
