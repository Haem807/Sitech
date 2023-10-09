
package modelo;

import java.sql.Time;
import java.util.Date;


public class Horario {
    //Atributos de Horario
    private int id;
    private Date fecha;
    private Time hora_salida;
    private Time hora_retorno;

    public Horario() {
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

    public Time getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(Time hora_salida) {
        this.hora_salida = hora_salida;
    }

    public Time getHora_retorno() {
        return hora_retorno;
    }

    public void setHora_retorno(Time hora_retorno) {
        this.hora_retorno = hora_retorno;
    }
    
    
    
}
