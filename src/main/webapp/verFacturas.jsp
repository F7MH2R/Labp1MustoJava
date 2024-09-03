<%@include file="menu.jsp" %>
<%@page import="modelo.Factura"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Facturas - Empresa X</title>
    <!-- Bootstrap CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Facturas Generadas</h1>

        <%
            // Obtener la lista de transacciones del día
            List<Factura> transaccionesDia = Factura.getTransaccionesDia();

            if (transaccionesDia != null && !transaccionesDia.isEmpty()) {
                int i = 1;
                for (Factura factura : transaccionesDia) {
        %>
                    <h3 class="text-center">Factura <%= i %> - Total: $<%= String.format("%.2f", factura.getTotal()) %>, Cambio: <%= factura.getMoneda() %> $<%= String.format("%.2f", factura.getCambioEnMoneda()) %></h3>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Producto producto : factura.getProductos()) { %>
                                <tr>
                                    <td><%= producto.getCodigo() %></td>
                                    <td><%= producto.getNombre() %></td>
                                    <td><%= producto.getCantidad() %></td>
                                    <td>$<%= producto.getPrecio() %></td>
                                    <td>$<%= producto.getTotal() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
        <%           i++;
                }
            } else { %>
                <p class="text-center">No hay facturas generadas.</p>
        <% } %>

        <a href="capturarProducto.jsp" class="btn btn-primary mt-4">Comenzar Nueva Factura</a>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
