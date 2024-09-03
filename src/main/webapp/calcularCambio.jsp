<%@include file="menu.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcular Cambio</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Calcular Cambio - Empresa X</h1>
        <form method="post" action="procesarCambio.jsp">
            <div class="form-group">
                <label for="monto">Monto Recibido:</label>
                <input type="number" step="0.01" class="form-control" id="monto" name="monto" required>
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
            <button type="submit" class="btn btn-primary">Calcular Cambio</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
