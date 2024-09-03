<%@page import="modelo.Producto"%>
<%@page import="modelo.Factura"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Producto</title>
</head>
<body>
<%
    // Obtener la lista de facturas de la sesión
    List<Factura> facturas = (List<Factura>) session.getAttribute("facturas");
    if (facturas == null) {
        facturas = new ArrayList<>();
        session.setAttribute("facturas", facturas);
    }

    // Obtener o crear la factura actual
    Factura facturaActual = (Factura) session.getAttribute("facturaActual");
    if (facturaActual == null) {
        facturaActual = new Factura();
        session.setAttribute("facturaActual", facturaActual);
    }

    // Capturar los datos del formulario
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precio = Double.parseDouble(request.getParameter("precio"));

    // Crear un nuevo producto y agregarlo a la factura actual
    Producto producto = new Producto(codigo, nombre, cantidad, precio);
    facturaActual.agregarProducto(producto);

    // Redirigir a la página de factura
    response.sendRedirect("factura.jsp");
%>
</body>
</html>
