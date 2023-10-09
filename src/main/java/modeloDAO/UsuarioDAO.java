
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;


public class UsuarioDAO {
    
    Conexion conexion = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    Usuario usu=new Usuario();
    
    public Usuario listarUsername(String username){
        
        String sql="SELECT * FROM `usuario` where nombreUsuario = '"+ username + "'";
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                usu.setId(rs.getInt("id"));
                usu.setUsername(rs.getString("nombreUsuario"));
                usu.setContrasenia(rs.getString("contrasenia"));
                usu.setId_persona(rs.getInt("idPersona"));
                usu.setId_rol(rs.getInt("id_rol"));
                
                
            }
            System.out.println("nombre"+usu.getUsername());
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return usu;
    }
    
    /*
    public List listar(){
        ArrayList<Usuario> list=new ArrayList();
        String sql="SELECT * FROM `usuario`";
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Usuario u=new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido_paterno(rs.getString("apellidoPaterno"));
                u.setApellido_materno(rs.getString("apellidoMaterno"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("contrasenia"));
                list.add(u);
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return list;
    }
    public Usuario listarId(int id){
        
        String sql="SELECT * FROM `usuario` where id ="+id;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                usu.setId(rs.getInt("id"));
                usu.setNombre(rs.getString("nombre"));
                usu.setApellido_paterno(rs.getString("apellidoPaterno"));
                usu.setApellido_materno(rs.getString("apellidoMaterno"));
                usu.setCorreo(rs.getString("correo"));
                usu.setContrasena(rs.getString("contrasenia"));
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return usu;
    }
    
    //--AGREGAR USUARIO
    public boolean add(Usuario usu){
  
        String sql = "INSERT INTO `usuario`( `nombre`, `apellidoParterno`, `apellidoMaterno`, `correo`, `contrasenia`,  `id_rol`) VALUES ('"+usu.getNombre()+"','"+usu.getApellido_paterno()+"','"+usu.getApellido_materno()+"','"+usu.getCorreo()+"','"+usu.getContrasena()+"',1)";
        
        try{
            conn = conexion.getConexion();
            ps = conn.prepareCall(sql);
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        
        return false;
    }
    //--MODIFICAR USUARIO
    public boolean editar(Usuario usu){
        String sql = "UPDATE `usuario` SET `nombre`='"+usu.getNombre()+"',`apellidoPaterno`='"+usu.getApellido_paterno()+"',`apellidoMaterno`='"+usu.getApellido_materno()+"',`correo`='"+usu.getCorreo()+"',`contrasenia`='"+usu.getContrasena()+"' WHERE id ="+usu.getId();
        try{
            conn = conexion.getConexion();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){}
        return false;
    }
    
    //--ELIMINAR USUARIO
    public boolean eliminar(int id){
        String sql = "DELETE FROM `usuario` WHERE id =" +id;
        try{
            conn = conexion.getConexion();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){}
        return false;
    }
*/
}
