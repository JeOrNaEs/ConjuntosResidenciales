<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Vehículo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>${vehiculo != null ? "Editar Vehículo" : "Agregar Vehículo"}</h2>
<form action="VehiculoServlet" method="post">
    <input type="hidden" name="id" value="${vehiculo != null ? vehiculo.idVehiculo : ''}">
    <div>
        <label>Placa:</label>
        <input type="text" name="placa" value="${vehiculo != null ? vehiculo.placa : ''}" required>
    </div>
    <div>
        <label>Marca:</label>
        <input type="text" name="marca" value="${vehiculo != null ? vehiculo.marca : ''}" required>
    </div>
    <div>
        <label>Modelo:</label>
        <input type="text" name="modelo" value="${vehiculo != null ? vehiculo.modelo : ''}" required>
    </div>
    <div>
        <label>Color:</label>
        <input type="text" name="color" value="${vehiculo != null ? vehiculo.color : ''}" required>
    </div>
    <div>
        <label>ID Residente:</label>
        <input type="number" name="id_residente" value="${vehiculo != null ? vehiculo.idResidente : ''}" required>
    </div>
    <div>
        <input type="hidden" name="action" value="${vehiculo != null ? 'update' : 'insert'}">
        <button type="submit">${vehiculo != null ? "Actualizar" : "Agregar"}</button>
    </div>
</form>
<a href="VehiculoServlet">Volver a la lista</a>
</body>
</html>
