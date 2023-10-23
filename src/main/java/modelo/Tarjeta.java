
package modelo;

import java.util.Date;


public class Tarjeta {
    //Atributos de Tarjeta
    private int id;
    private String codigo_tarjeta;
    private String numero_tarjeta;
    private String fecha_activacion;
    private String fecha_vencimiento;    
    private int estado;
    private double saldo;
    private int idUsuario;

    public Tarjeta() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo_tarjeta() {
        return codigo_tarjeta;
    }

    public void setCodigo_tarjeta(String codigo_tarjeta) {
        this.codigo_tarjeta = codigo_tarjeta;
    }

    public String getNumero_tarjeta() {
        return numero_tarjeta;
    }

    public void setNumero_tarjeta(String numero_tarjeta) {
        this.numero_tarjeta = numero_tarjeta;
    }

    

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFecha_activacion() {
        return fecha_activacion;
    }

    public void setFecha_activacion(String fecha_activacion) {
        this.fecha_activacion = fecha_activacion;
    }

    public String getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(String fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
    
}
