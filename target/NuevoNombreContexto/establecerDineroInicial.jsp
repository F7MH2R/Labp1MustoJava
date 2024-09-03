<%@page import="modelo.Factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Establecer Dinero Inicial</title>
</head>
<body>
<%
    double dineroInicial = Double.parseDouble(request.getParameter("dineroInicial"));
    Factura.setDineroInicialCaja(dineroInicial);
    response.sendRedirect("factura.jsp");
%>
</body>
</html>
