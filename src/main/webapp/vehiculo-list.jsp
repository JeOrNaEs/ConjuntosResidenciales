<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Vehículos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>Lista de Vehículos</h2>
<a href="vehiculo-form.jsp">Agregar Vehículo</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Placa</th>
        <th>Marca</th>
        <th>Modelo</th>
        <th>Color</th>
        <th>Residente</th>
        <th>Acciones</th>
    </tr>
    <c:forEach var="vehiculo" items="${vehiculos}">
        <tr>
            <td>${vehiculo.idVehiculo}</td>
            <td>${vehiculo.placa}</td>
            <td>${vehiculo.marca}</td>
            <td>${vehiculo.modelo}</td>
            <td>${vehiculo.color}</td>
            <td>${vehiculo.idResidente}</td>
            <td>
                <a href="VehiculoServlet?action=edit&id=${vehiculo.idVehiculo}">Editar</a>
                <a href="VehiculoServlet?action=delete&id=${vehiculo.idVehiculo}">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
