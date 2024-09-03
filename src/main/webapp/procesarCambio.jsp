<%@include file="menu.jsp" %>
<%@page import="modelo.Producto"%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado del Cambio</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Resultado del Cambio - Empresa X</h1>

        <%
            // Tasa de cambio (valores ficticios)
            Map<String, Double> tasaCambio = new HashMap<>();
            tasaCambio.put("USD", 1.0);
            tasaCambio.put("GTQ", 7.7);
            tasaCambio.put("HNL", 24.3);
            tasaCambio.put("EUR", 0.85);
            tasaCambio.put("NIO", 36.5);

            // Obtener el total a pagar de la sesión
            double totalPagar = 0;
            List<Producto> productos = (List<Producto>) session.getAttribute("productos");
            if (productos != null) {
                for (Producto producto : productos) {
                    totalPagar += producto.getTotal();
                }
            }

            // Capturar datos del formulario
            String moneda = request.getParameter("moneda");
            double monto = Double.parseDouble(request.getParameter("monto"));

            // Convertir el monto a dólares
            double montoEnDolares = monto / tasaCambio.get(moneda);

            // Calcular el cambio en dólares
            double cambio = montoEnDolares - totalPagar;

            // Redondear a 5 centavos (beneficiando a la empresa)
            cambio = Math.round(cambio * 20) / 20.0;
        %>

        <h3>Monto Recibido: <%= monto %> <%= moneda %></h3>
        <h3>Total a Pagar: $<%= String.format("%.2f", totalPagar) %></h3>
        <h3>Cambio a Dar: $<%= String.format("%.2f", cambio) %></h3>

        <a href="index.jsp" class="btn btn-primary mt-3">Regresar</a>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
