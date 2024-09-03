<%@page import="modelo.Factura"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizar Factura</title>
</head>
<body>
<%
    // Obtener la lista de facturas de la sesión
    List<Factura> facturas = (List<Factura>) session.getAttribute("facturas");

    if (facturas != null) {
        // Obtener la factura actual de la sesión
        Factura facturaActual = (Factura) session.getAttribute("facturaActual");

        if (facturaActual != null) {
            // Capturar la moneda seleccionada y el monto recibido
            String moneda = request.getParameter("moneda");
            double montoRecibido = Double.parseDouble(request.getParameter("montoRecibido"));

            // Validación de montos negativos
            if (montoRecibido < 0) {
                throw new IllegalArgumentException("El monto recibido no puede ser negativo.");
            }

            // Establecer la moneda en la factura y calcular el cambio
            facturaActual.setMoneda(moneda);
            facturaActual.calcularCambio(montoRecibido);

            // Registrar la transacción del día
            Factura.registrarTransaccion(facturaActual);

            // Agregar la factura actual a la lista de facturas
            facturas.add(facturaActual);

            // Limpiar la factura actual para permitir la creación de una nueva
            session.removeAttribute("facturaActual");
        }
    }

    // Redirigir a la página de visualización de todas las facturas
    response.sendRedirect("verFacturas.jsp");
%>
</body>
</html>
