<%-- 
    Document   : residente
    Created on : Aug 9, 2024, 3:09:57 PM
    Author     : JerNava
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Residentes</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Lista de Residentes</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Tipo Documento</th>
                <th>Número Documento</th>
                <th>Teléfono</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="residente" items="${residentes}">
                <tr>
                    <td>${residente.id}</td>
                    <td>${residente.nombre}</td>
                    <td>${residente.apellido}</td>
                    <td>${residente.tipoDocumento}</td>
                    <td>${residente.numeroDocumento}</td>
                    <td>${residente.telefono}</td>
                    <td>${residente.email}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>