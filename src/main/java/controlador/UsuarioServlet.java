/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modeloDAO.UsuarioDAO;


@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {
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
        
        //comparamos las acciones recibidas por las vistas
        if(accion.equalsIgnoreCase("Login")){
            
            
            String username = request.getParameter("username");         //recibimos el username de la vista
            String contrasenia = request.getParameter("contrasenia");   //recibimos la contraseña de la vista
            
            Usuario user = usuDao.listarUsername(username);            //buscamos el usuario en la base de datos

            if (user != null && user.isPasswordCorrect(contrasenia)) {  //si el usuario existe y la contraseña es correcta
            
            HttpSession session = request.getSession();               //creamos una sesion
            session.setAttribute("user", user);                      //guardamos el usuario en la sesion
            
            response.sendRedirect("./assets/vistas/ComprarTarjeta.jsp");    //redireccionamos a la vista de compra de tarjeta
            
            
        } else {
            // Credenciales incorrectas, muestra un mensaje de error
            request.setAttribute("error", "Credenciales incorrectas");
            request.getRequestDispatcher("login.jsp").forward(request, response);   //redireccionamos a la vista de login
        }
            
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
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
