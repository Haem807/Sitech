
package modeloDTO;

import modelo.*;
import java.sql.Time;
import java.util.Date;


public class HorarioDTO {
    //Atributos de Horario
    private int id;
    private Date fecha;
    private String hora_salida;
    private String hora_retorno;
    private int estado;

    public HorarioDTO() {
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

    public String getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(String hora_salida) {
        this.hora_salida = hora_salida;
    }

    public String getHora_retorno() {
        return hora_retorno;
    }

    public void setHora_retorno(String hora_retorno) {
        this.hora_retorno = hora_retorno;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

   
    
    
    
}
