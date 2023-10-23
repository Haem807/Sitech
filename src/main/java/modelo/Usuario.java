
package modelo;

import java.util.ArrayList;


public class Usuario {
//atributos de usuario
  private int id;
  private String username;
  private String contrasenia;
  private int id_persona;
  private int id_rol;
  //constructor
  public Usuario() {

  }
  //METODOS
  public boolean isPasswordCorrect(String inputPassword) {
      
      if(this.contrasenia.equalsIgnoreCase(inputPassword)){
          return true;
      }
      
      return false;
}

  //getter y setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

  

    

    

}
