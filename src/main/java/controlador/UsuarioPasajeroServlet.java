/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.Tarjeta;
import modeloDAO.UsuarioDAO;
import modeloDTO.UsuarioDTO;
import modeloDTO.UsuarioTransportistaDTO;


@WebServlet(name = "UsuarioPasajeroServlet", urlPatterns = {"/UsuarioPasajeroServlet"})
public class UsuarioPasajeroServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    Usuario usuario = new Usuario();
    UsuarioDAO usuDao = new UsuarioDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //se recibe la ACCION a realizar
        String accion = request.getParameter("accion");
        System.out.println("Llego al servlet!! " + accion);
        //comparamos las acciones recibidas por las vistas
        if(accion.equalsIgnoreCase("Login")){
            
            
            String username = request.getParameter("username");         //recibimos el username de la vista
            String contrasenia = request.getParameter("contrasenia");   //recibimos la contraseña de la vista
            
            Usuario user = usuDao.listarUsername(username);            //buscamos el usuario en la base de datos
            
            
            if (user != null && user.isPasswordCorrect(contrasenia)) {  //si el usuario existe y la contraseña es correcta
                if(user.getId_rol() == 3){
                    UsuarioDTO u = usuDao.listarId2(user.getId(), user.getId_persona());
                    u.setListaTarjetas((ArrayList<Tarjeta>) usuDao.listarTarjetas(user.getId()));
                    u.getListaTarjetas().get(0);
                    HttpSession session = request.getSession();               //creamos una sesion
                    System.out.println("Llego el usuario: " + u.getNombre());

                    session.setAttribute("usuarioNuevo", u);                      //guardamos el usuario en la sesion
                    RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/ComprarTarjeta.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
                    dispatcher.forward(request, response);
                    //response.sendRedirect("./assets/vistas/pasajero.jsp");    //redireccionamos a la vista de compra de tarjeta
                }
                else if(user.getId_rol() == 2){
                    UsuarioTransportistaDTO transport = usuDao.listarIdTranport(user.getId(), user.getId_persona());
                    transport.setListaUsuarios((ArrayList<UsuarioDTO>) usuDao.listarCobros());
                    transport.setViaje(usuDao.listarViajeID(user.getId()));
                    System.out.println("Transportista: "+ transport.getNombre());
                    System.out.println("Transportista: "+ transport.getListaUsuarios().get(0).getUsername());
                    System.out.println("Viaje: tarifa: "+ transport.getViaje().getTarifa());
                    HttpSession session = request.getSession();  
                    session.setAttribute("usuarioTransportista", transport);                      //guardamos el usuario en la sesion
                    RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/cobrar.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
                    dispatcher.forward(request, response);
                }
            }
            
        } else if(accion.equalsIgnoreCase("editar")){
            int idUsu = Integer.parseInt(request.getParameter("idUsu"));
            int idPer = Integer.parseInt(request.getParameter("idPer"));
            UsuarioDTO u = usuDao.listarId2(idUsu, idPer);
            request.setAttribute("usuario", u);
            System.out.println("Llego editar!!!!" + u.getUsername());
            RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/editarUsuario.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
            dispatcher.forward(request, response);
            //response.sendRedirect("./assets/vistas/edit2.jsp");   
        }else if(accion.equalsIgnoreCase("eliminar")){
            int id = Integer.parseInt(request.getParameter("id"));
            usuario.setId(id);
            usuDao.eliminar(id);
            response.sendRedirect("./assets/vistas/listar2.jsp");
        }
            else {
            // Credenciales incorrectas, muestra un mensaje de error
            request.setAttribute("error", "Credenciales incorrectas");
            request.getRequestDispatcher("login.jsp").forward(request, response);   //redireccionamos a la vista de login
        }
            
        
        
        /*
        System.out.println("LLEGO");
        if(accion.equalsIgnoreCase("listar")){
            acceso= listar;
            System.out.println("LISTAR");
        }else if(accion.equalsIgnoreCase("add")){
            acceso = add;
        }else if(accion.equalsIgnoreCase("Agregar")){
            
            
            String username = request.getParameter("username");
            String contrasenia = request.getParameter("cantrasenia");
            String nombre = request.getParameter("nombre");
            String apellido_p = request.getParameter("apellido_paterno");
            String apellido_m = request.getParameter("apellido_materno");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            
            usuario.setNombre(nombre);
            usuario.setApellido_paterno(apellido_p);
            usuario.setApellido_materno(apellido_m);
            usuario.setCorreo(correo);
            usuario.setContrasena(contrasena);
            usuDao.add(usuario);
            acceso = listar;
            
        }else if(accion.equalsIgnoreCase("editar")){
            request.setAttribute("id_usu", request.getParameter("id"));
            acceso = edit;
        }else if(accion.equalsIgnoreCase("Actualizar")){
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellido_p = request.getParameter("apellido_paterno");
            String apellido_m = request.getParameter("apellido_materno");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            
            usuario.setId(id);
            usuario.setNombre(nombre);
            usuario.setApellido_paterno(apellido_p);
            usuario.setApellido_materno(apellido_m);
            usuario.setCorreo(correo);
            usuario.setContrasena(contrasena);
            usuDao.editar(usuario);
            acceso = listar;
        }else if(accion.equalsIgnoreCase("eliminar")){
            int id = Integer.parseInt(request.getParameter("id"));
            usuario.setId(id);
            usuDao.eliminar(id);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
*/
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera los parámetros del formulario
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        int idPersona = Integer.parseInt(request.getParameter("idPersona"));
        String userName = request.getParameter("userName");
        String contrasenia = request.getParameter("contrasenia");
        int idRol = Integer.parseInt(request.getParameter("idRol"));
        String nombre = request.getParameter("nombre");
        String apePat = request.getParameter("apePat");
        String apeMat = request.getParameter("apeMat");
        String fechaNac = request.getParameter("fechaNac");
        int dni = Integer.parseInt(request.getParameter("dni"));
        String correo = request.getParameter("correo");
        System.out.println("Ingresado al edit: " + userName + contrasenia + idPersona + idRol);
        // Realiza la lógica de edición aquí, por ejemplo, actualizar la base de datos o realizar otras operaciones
        UsuarioDTO u = new UsuarioDTO();
        u.setIdUsuario(idUsuario);
        u.setIdPersona(idPersona);
        u.setUsername(userName);
        u.setContrasenia(contrasenia);
        u.setId_rol(idRol);
        u.setNombre(nombre);
        u.setApellido_paterno(apePat);
        u.setApellido_materno(apeMat);
        u.setFechaNacimiento(fechaNac);
        u.setDni(dni);
        u.setCorreo(correo);
        Boolean respuesta = usuDao.editar2(u);
        System.out.println("respuesta: " + respuesta);
        // Redirige a una página de confirmación o a la vista de detalle del usuario
        response.sendRedirect("./assets/vistas/administrar_usuario.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
