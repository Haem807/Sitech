
package modelo;

import java.sql.Time;
import java.util.Date;

public class Viaje {
    //Atributos de Viaje
    private int id;
    private Date fecha;
    private Time hora;
    private double tarifa;
    private String reporte_viaje;
    private int id_ruta;
    private int id_transporte;

    public Viaje() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public double getTarifa() {
        return tarifa;
    }

    public void setTarifa(double tarifa) {
        this.tarifa = tarifa;
    }

    public String getReporte_viaje() {
        return reporte_viaje;
    }

    public void setReporte_viaje(String reporte_viaje) {
        this.reporte_viaje = reporte_viaje;
    }

    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public int getId_transporte() {
        return id_transporte;
    }

    public void setId_transporte(int id_transporte) {
        this.id_transporte = id_transporte;
    }
    
    
    
    
}
