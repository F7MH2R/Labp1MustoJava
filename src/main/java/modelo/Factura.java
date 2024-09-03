package modelo;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Factura {
    private List<Producto> productos;
    private double total;
    private double cambio;
    private String moneda;
    private static double dineroInicialCaja;

    // Mapa para almacenar las tasas de cambio por moneda
    private static final Map<String, Double> tasasDeCambio = new HashMap<>();

    // Lista para almacenar todas las transacciones del día
    private static final List<Factura> transaccionesDia = new ArrayList<>();

    // Inicialización estática de las tasas de cambio
    static {
        tasasDeCambio.put("USD", 1.0);
        tasasDeCambio.put("GTQ", 7.7);
        tasasDeCambio.put("HNL", 24.3);
        tasasDeCambio.put("EUR", 0.85);
        tasasDeCambio.put("NIO", 36.5);
    }

    public Factura() {
        this.productos = new ArrayList<>();
        this.total = 0;
        this.cambio = 0;
        this.moneda = "USD"; // Moneda por defecto
    }

    public static void setDineroInicialCaja(double dineroInicial) {
        dineroInicialCaja = dineroInicial;
    }

    public static double getDineroInicialCaja() {
        return dineroInicialCaja;
    }

    public void agregarProducto(Producto producto) {
        this.productos.add(producto);
        this.total += producto.getTotal();
    }

    public List<Producto> getProductos() {
        return productos;
    }

    public double getTotal() {
        return total;
    }

    public double getCambio() {
        return cambio;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public void calcularCambio(double montoRecibido) {
        if (montoRecibido < total) {
            throw new IllegalArgumentException("El monto recibido no puede ser menor que el total.");
        }

        double montoRecibidoEnUSD = montoRecibido / tasasDeCambio.get(moneda);
        double cambioEnUSD = montoRecibidoEnUSD - total;

        // Redondear el cambio a 5 céntimos beneficiando a la empresa
        cambioEnUSD = Math.ceil(cambioEnUSD * 20) / 20.0;

        this.cambio = cambioEnUSD;
    }

    public double getCambioEnMoneda() {
        return cambio * tasasDeCambio.get(moneda);
    }

    public static double getTasaDeCambio(String moneda) {
        return tasasDeCambio.getOrDefault(moneda, 1.0);
    }

    public static void registrarTransaccion(Factura factura) {
        transaccionesDia.add(factura);
    }

    public static List<Factura> getTransaccionesDia() {
        return transaccionesDia;
    }
}
