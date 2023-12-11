/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDTO;

/**
 *
 * @author edson
 */
public class ViajeDTO {
    private int idViaje;
    private double tarifa;
    private int id_ruta;
    private String origen;
    private String destino;
    private int id_transporte;
    private String placa;
    private String marca;
    private int id_transportista;
    private String color;
    private String nombre_ruta;
    private String nombre_transportista;
    private String hora_salida;
    private String hora_retorno;
    private int horario;
    
    
    
    public ViajeDTO() {
    }

    public int getHorario() {
        return horario;
    }

    public void setHorario(int horario) {
        this.horario = horario;
    }

    
    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    public double getTarifa() {
        return tarifa;
    }

    public void setTarifa(double tarifa) {
        this.tarifa = tarifa;
    }

    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getId_transporte() {
        return id_transporte;
    }

    public void setId_transporte(int id_transporte) {
        this.id_transporte = id_transporte;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getId_transportista() {
        return id_transportista;
    }

    public void setId_transportista(int id_transportista) {
        this.id_transportista = id_transportista;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getNombre_ruta() {
        return nombre_ruta;
    }

    public void setNombre_ruta(String nombre_ruta) {
        this.nombre_ruta = nombre_ruta;
    }

    public String getNombre_transportista() {
        return nombre_transportista;
    }

    public void setNombre_transportista(String nombre_transportista) {
        this.nombre_transportista = nombre_transportista;
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
    
}
