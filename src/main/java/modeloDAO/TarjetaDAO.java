
package modeloDAO;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import modelo.*;

public class TarjetaDAO {
    
    Conexion conexion = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    Tarjeta tar = new Tarjeta();
    
    
    public boolean add(Tarjeta  tar){
        //4,4,'2023-10-08 02:36:40','2023-10-08',1,1,2
        String sql = "INSERT INTO `tarjeta`( `codigo_tarjeta`, `numero_tarjeta`, `fecha_activacion`, `fecha_vencimiento`, `estado`, `saldo`, `id_usuario`) VALUES ('"+tar.getCodigo_tarjeta()+"','"+tar.getNumero_tarjeta()+"','2023-10-08 02:36:40','2023-10-08',1,"+tar.getSaldo()+","+tar.getIdUsuario()+")";
        
        try{
            conn = conexion.getConexion();
            ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            int rowsAffected = ps.executeUpdate();

        if (rowsAffected == 1) {
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                int generatedId = generatedKeys.getInt(1);
                tar.setId(generatedId); // Devuelve el ID autogenerado
                System.out.println("codigaso"+ tar.getId());
            }
        }
        }catch(Exception e){
            System.out.println(e);
        }
        
        return false;
    }
    
    
    public boolean recargar(double monto, int id){
        String sql = "UPDATE `tarjeta` SET saldo= "+monto+"  WHERE id ="+id;
        System.out.println("LLEGAMOS  A RECARGA"+monto+id);
        try{
            conn = conexion.getConexion();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("SE RECARGO: "+ monto + id);
        }catch(Exception e){
            e.printStackTrace();}
        return false;
    }
    
    public Tarjeta listarId(int id){
        
        String sql="SELECT * FROM `tarjeta` where id ="+id;
        try{
            conn=conexion.getConexion();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                tar.setId(rs.getInt("id"));
                tar.setSaldo(rs.getDouble("saldo"));
                
                
            }
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
        return tar;
    }
    
}
