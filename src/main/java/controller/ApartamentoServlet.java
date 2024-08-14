/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ApartamentoDAO;
import model.Apartamento;
import java.io.IOException;
/**
 *
 * @author jerso
 */
@WebServlet("/apartamento")
public class ApartamentoServlet extends HttpServlet {
    
    private ApartamentoDAO apartamentoDAO = new ApartamentoDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if ("edit".equals(action)) {
            Apartamento apartamento = apartamentoDAO.listar().stream().filter(a -> a.getId() == Integer.parseInt(id)).findFirst().orElse(null);
            request.setAttribute("apartamento", apartamento);
            request.getRequestDispatcher("apartamento-form.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            apartamentoDAO.eliminar(Integer.parseInt(id));
            response.sendRedirect("apartamento-list.jsp");
        } else {
            request.setAttribute("apartamentos", apartamentoDAO.listar());
            request.getRequestDispatcher("apartamento-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String numeroApartamento = request.getParameter("numeroApartamento");
        String torre = request.getParameter("torre");
        float area = Float.parseFloat(request.getParameter("area"));
        int numeroHabitaciones = Integer.parseInt(request.getParameter("numeroHabitaciones"));
        int numeroBanos = Integer.parseInt(request.getParameter("numeroBanos"));
        int idResidente = Integer.parseInt(request.getParameter("idResidente"));

        Apartamento apartamento = new Apartamento();
        apartamento.setNumeroApartamento(numeroApartamento);
        apartamento.setTorre(torre);
        apartamento.setArea(area);
        apartamento.setNumeroHabitaciones(numeroHabitaciones);
        apartamento.setNumeroBanos(numeroBanos);
        apartamento.setIdResidente(idResidente);

        if (id == null || id.isEmpty()) {
            apartamentoDAO.crear(apartamento);
        } else {
            apartamento.setId(Integer.parseInt(id));
            apartamentoDAO.actualizar(apartamento);
        }
        response.sendRedirect("apartamento");
    }
}