<%-- 
    Document   : apartamento-form
    Created on : 10/08/2024, 3:36:02 p. m.
    Author     : jerso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- apartamento-form.jsp -->
        <form action="ApartamentoServlet" method="post">
            <input type="hidden" name="id" value="${apartamento.id}">
            <label for="numeroApartamento">Número de Apartamento:</label>
            <input type="text" id="numeroApartamento" name="numeroApartamento" value="${apartamento.numeroApartamento}" required><br>
            <label for="torre">Torre:</label>
            <input type="text" id="torre" name="torre" value="${apartamento.torre}" required><br>
            <label for="area">Área:</label>
            <input type="text" id="area" name="area" value="${apartamento.area}" required><br>
            <label for="numeroHabitaciones">Número de Habitaciones:</label>
            <input type="number" id="numeroHabitaciones" name="numeroHabitaciones" value="${apartamento.numeroHabitaciones}" required><br>
            <label for="numeroBanos">Número de Baños:</label>
            <input type="number" id="numeroBanos" name="numeroBanos" value="${apartamento.numeroBanos}" required><br>
            <label for="idResidente">ID Residente:</label>
            <input type="number" id="idResidente" name="idResidente" value="${apartamento.idResidente}" required><br>
            <button type="submit">Guardar</button>
        </form>
    </body>
</html>
