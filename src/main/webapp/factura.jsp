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
    <title>Factura - Empresa X</title>
    <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Factura Actual</h1>

        <%
            // Capturar el dinero inicial en la caja si aún no se ha establecido
            if (Factura.getDineroInicialCaja() == 0) {
        %>
            <form method="post" action="establecerDineroInicial.jsp">
                <div class="form-group">
                    <label for="dineroInicial">Ingrese el dinero inicial en la caja (en USD):</label>
                    <input type="number" step="0.01" class="form-control" id="dineroInicial" name="dineroInicial" required>
                </div>
                <button type="submit" class="btn btn-primary">Establecer Dinero Inicial</button>
            </form>
        <% } else { 
            // Obtener la factura actual de la sesión
            Factura facturaActual = (Factura) session.getAttribute("facturaActual");

            if (facturaActual != null) {
        %>

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
                <% for (Producto producto : facturaActual.getProductos()) { %>
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

        <h3 class="text-right">Total a Pagar: $<%= String.format("%.2f", facturaActual.getTotal()) %></h3>

        <form method="post" action="finalizarFactura.jsp">
            <div class="form-group">
                <label for="montoRecibido">Monto Recibido:</label>
                <input type="number" step="0.01" class="form-control" min="0" id="montoRecibido" name="montoRecibido" required oninput="this.value = this.value.replace(/-/g, '');>
            </div>
            <div class="form-group">
                <label for="moneda">Moneda:</label>
                <select class="form-control" id="moneda" name="moneda" required>
                    <option value="USD">Dólar</option>
                    <option value="GTQ">Quetzal</option>
                    <option value="HNL">Lempira</option>
                    <option value="EUR">Euro</option>
                    <option value="NIO">Córdoba</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Finalizar Factura</button>
        </form>

        <a href="capturarProducto.jsp" class="btn btn-primary">Agregar otro producto</a>

        <% } else { %>
            <p class="text-center">No hay productos en la factura actual.</p>
            <a href="capturarProducto.jsp" class="btn btn-primary">Comenzar Nueva Factura</a>
        <% } } %>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
