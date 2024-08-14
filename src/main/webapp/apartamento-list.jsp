<%-- 
    Document   : apartamento-list
    Created on : 10/08/2024, 3:36:43 p. m.
    Author     : jerso
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lista de Apartamentos</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Lista de Apartamentos</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Número de Apartamento</th>
            <th>Torre</th>
            <th>Área</th>
            <th>Número de Habitaciones</th>
            <th>Número de Baños</th>
            <th>ID Residente</th>
            <th>Acciones</th>
        </tr>
        <c:forEach var="apartamento" items="${apartamentos}">
            <tr>
                <td>${apartamento.id}</td>
                <td>${apartamento.numeroApartamento}</td>
                <td>${apartamento.torre}</td>
                <td>${apartamento.area}</td>
                <td>${apartamento.numeroHabitaciones}</td>
                <td>${apartamento.numeroBanos}</td>
                <td>${apartamento.idResidente}</td>
                <td>
                    <a href="ApartamentoServlet?action=edit&id=${apartamento.id}">Editar</a>
                    <a href="ApartamentoServlet?action=delete&id=${apartamento.id}" onclick="return confirm('¿Estás seguro?')">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="apartamento-form.jsp">Agregar Nuevo Apartamento</a>
</body>
</html>