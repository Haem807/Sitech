
package modelo;

import java.util.Date;


public class ViajeUsuario {
    //Atributos de ViajeUsuario
    private int id;
    private int id_usuario;
    private int id_viaje;
    private String fecha_registro;
    private String hora_registro;
    private Double monto_cobrado;
    private String tarjeta;

    public ViajeUsuario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_viaje() {
        return id_viaje;
    }

    public void setId_viaje(int id_viaje) {
        this.id_viaje = id_viaje;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public String getHora_registro() {
        return hora_registro;
    }

    public void setHora_registro(String hora_registro) {
        this.hora_registro = hora_registro;
    }

    public Double getMonto_cobrado() {
        return monto_cobrado;
    }

    public void setMonto_cobrado(Double monto_cobrado) {
        this.monto_cobrado = monto_cobrado;
    }

    

    public String getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }
    
    
    
}
