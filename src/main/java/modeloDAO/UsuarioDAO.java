    
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;
import modelo.Tarjeta;
import modeloDTO.UsuarioDTO;
import modeloDTO.UsuarioTransportistaDTO;
import modeloDTO.ViajeDTO;


public class UsuarioDAO {
    
    Conexion conexion = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    Usuario usu=new Usuario();
    UsuarioDTO usuDTO = new UsuarioDTO();
    UsuarioTransportistaDTO usutransportDTO = new UsuarioTransportistaDTO();
    ViajeDTO viaje = new ViajeDTO();
    
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
                u.setUsername(rs.getString("nombreUsuario"));
                u.setContrasenia(rs.getString("contrasenia"));
                u.setId_persona(rs.getInt("idPersona"));
                u.setId_rol(rs.getInt("id_rol"));
                list.add(u);
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return list;
    }
    
    public List listarCompleto(){
        ArrayList<UsuarioDTO> list=new ArrayList();
        String sql="SELECT * FROM `usuario` U INNER JOIN `persona` P ON P.id = U.idPersona";
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                UsuarioDTO u=new UsuarioDTO();
                //Usuario
                u.setIdUsuario(rs.getInt("U.id"));
                u.setUsername(rs.getString("U.nombreUsuario"));
                u.setContrasenia(rs.getString("U.contrasenia"));
                u.setIdPersona(rs.getInt("U.idPersona"));
                u.setId_rol(rs.getInt("U.id_rol"));
                //Persona
                u.setNombre(rs.getString("P.nombre"));
                u.setApellido_paterno(rs.getString("P.apellidoPaterno"));
                u.setApellido_materno(rs.getString("P.apellidoMaterno"));
                u.setFechaNacimiento(rs.getString("P.fechaNacimiento"));
                u.setDni(rs.getInt("P.dni"));
                u.setCorreo(rs.getString("P.correo"));
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
                usu.setUsername(rs.getString("nombreUsuario"));
                usu.setContrasenia(rs.getString("contrasenia"));
                usu.setId_persona(rs.getInt("idPersona"));
                usu.setId_rol(rs.getInt("id_rol"));
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return usu;
    }
    
    public UsuarioDTO listarId2(int idUsu, int idPer){
        
        String sql="SELECT * FROM `usuario` U INNER JOIN `persona` P ON P.id = U.idPersona WHERE U.id = "+idUsu+" AND P.id = "+idPer;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                usuDTO.setIdUsuario(rs.getInt("U.id"));
                usuDTO.setUsername(rs.getString("U.nombreUsuario"));
                usuDTO.setContrasenia(rs.getString("U.contrasenia"));
                usuDTO.setIdPersona(rs.getInt("P.id"));
                usuDTO.setId_rol(rs.getInt("U.id_rol"));
                usuDTO.setNombre(rs.getString("P.nombre"));
                usuDTO.setApellido_paterno(rs.getString("P.apellidoPaterno"));
                usuDTO.setApellido_materno(rs.getString("P.apellidoMaterno"));
                usuDTO.setFechaNacimiento(rs.getString("P.fechaNacimiento"));
                usuDTO.setDni(rs.getInt("P.dni"));
                usuDTO.setCorreo(rs.getString("P.correo"));
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return usuDTO;
    }
    //Listar usuario transportista
    public UsuarioTransportistaDTO listarIdTranport(int idUsu, int idPer){
        
        String sql="SELECT * FROM `usuario` U INNER JOIN `persona` P ON P.id = U.idPersona WHERE U.id = "+idUsu+" AND P.id = "+idPer;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                usutransportDTO.setIdUsuario(rs.getInt("U.id"));
                usutransportDTO.setUsername(rs.getString("U.nombreUsuario"));
                usutransportDTO.setContrasenia(rs.getString("U.contrasenia"));
                usutransportDTO.setIdPersona(rs.getInt("P.id"));
                usutransportDTO.setId_rol(rs.getInt("U.id_rol"));
                usutransportDTO.setNombre(rs.getString("P.nombre"));
                usutransportDTO.setApellido_paterno(rs.getString("P.apellidoPaterno"));
                usutransportDTO.setApellido_materno(rs.getString("P.apellidoMaterno"));
                usutransportDTO.setFechaNacimiento(rs.getString("P.fechaNacimiento"));
                usutransportDTO.setDni(rs.getInt("P.dni"));
                usutransportDTO.setCorreo(rs.getString("P.correo"));
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return usutransportDTO;
    }
    //Listar tarjetas
    public List listarTarjetas(int id){
        ArrayList<Tarjeta> list=new ArrayList();
        String sql="SELECT * FROM `usuario` U INNER JOIN `tarjeta` T ON U.id = T.id_usuario where T.id_usuario = "+id;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Tarjeta t =new Tarjeta();
                //Tarjeta
                t.setId(rs.getInt("T.id"));
                t.setCodigo_tarjeta(rs.getString("T.codigo_tarjeta"));
                t.setNumero_tarjeta(rs.getString("T.numero_tarjeta"));
                t.setFecha_activacion(rs.getString("T.fecha_activacion"));
                t.setFecha_vencimiento(rs.getString("T.fecha_vencimiento"));
                t.setEstado(rs.getInt("T.estado"));
                t.setSaldo(rs.getDouble("T.saldo"));
                list.add(t);
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return list;
    }
    
    //Listar Usuarios con tarjeta para cobrar
    public List listarCobros(){
        ArrayList<UsuarioDTO> list=new ArrayList();
        String sql="SELECT * FROM `usuario` U where U.id_rol <> 2 ";
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                UsuarioDTO u =new UsuarioDTO();
                //Usuario
                u.setIdUsuario(rs.getInt("U.id"));
                u.setUsername(rs.getString("U.nombreUsuario"));
                u.setContrasenia(rs.getString("U.contrasenia"));
                u.setIdPersona(rs.getInt("U.idPersona"));
                u.setId_rol(rs.getInt("U.id_rol"));
                u.setListaTarjetas((ArrayList<Tarjeta>) listarTarjetas(u.getIdUsuario()));
                list.add(u);
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return list;
    }
    //LISTAR VIAJE
    public ViajeDTO listarViajeID(int id){
        
        String sql=" SELECT * FROM `viaje` V INNER JOIN `ruta` R on V.id_ruta = R.id INNER JOIN `unidad_transporte` UT on V.id_transporte = UT.id INNER JOIN `usuario` U  ON V.id_transportista = U.id Where V.id_transportista = " +id;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                viaje.setIdViaje(rs.getInt("V.id"));
                viaje.setId_ruta(rs.getInt("R.id"));
                viaje.setOrigen(rs.getString("R.origen"));
                viaje.setDestino(rs.getString("R.destino"));
                viaje.setId_transporte(rs.getInt("UT.id"));
                viaje.setMarca(rs.getString("UT.marca"));
                viaje.setPlaca(rs.getString("UT.placa"));
                viaje.setTarifa(rs.getDouble("V.tarifa"));
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return viaje;
    }
    
    
    //--MODIFICAR USUARIO
    public boolean editar(Usuario usu){
        String sql = "UPDATE `usuario` SET `nombreUsuario`='"+usu.getUsername()+"',`contrasenia`='"+usu.getContrasenia()+"',`idPersona`="+usu.getId_persona()+" ,`id_rol`="+usu.getId_rol()+" WHERE id ="+usu.getId();
        try{
            conn = conexion.getConexion();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){}
        return false;
    }
    
    //--MODIFICAR USUARIO
    public boolean editar2(UsuarioDTO usu){
        String sql = "UPDATE `usuario` SET `nombreUsuario`='"+usu.getUsername()+"',`contrasenia`='"+usu.getContrasenia()+"',`idPersona`="+usu.getIdPersona()+" ,`id_rol`="+usu.getId_rol()+" WHERE id ="+usu.getIdUsuario();
        String sql2 = "UPDATE `persona` SET `nombre`='"+ usu.getNombre()+"',`apellidoPaterno`='"+ usu.getApellido_paterno()+"',`apellidoMaterno`='"+usu.getApellido_materno()+"',`fechaNacimiento`='"+usu.getFechaNacimiento()+"',`dni`="+ usu.getDni()+",`correo`='"+ usu.getCorreo()+"' WHERE id ="+usu.getIdPersona();
        try{
            conn = conexion.getConexion();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            ps = conn.prepareStatement(sql2);
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
    //--AGREGAR USUARIO
    public boolean add(Usuario usu){
  
        String sql = "INSERT INTO `usuario`( `nombre`, `apellidoParterno`, `apellidoMaterno`, `correo`, `contrasenia`,  `id_rol`) VALUES ('',1)";
        
        try{
            conn = conexion.getConexion();
            ps = conn.prepareCall(sql);
            ps.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return false;
    }
    //buscar usuario por numero de tarjeta
    public int buscarUsuTarjeta(String numTarjeta){
        
        String sql="SELECT * FROM `usuario` U INNER JOIN `tarjeta` T ON U.id = T.id_usuario WHERE T.numero_tarjeta = "+numTarjeta;
        int idEncontrado = 0;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                idEncontrado= rs.getInt("U.id");
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return idEncontrado;
    }
    
    /*
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
