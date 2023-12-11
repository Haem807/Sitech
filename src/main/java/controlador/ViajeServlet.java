/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Tarjeta;
import modelo.Usuario;
import modeloDAO.UsuarioDAO;
import modeloDTO.UsuarioDTO;
import modeloDTO.UsuarioTransportistaDTO;

/**
 *
 * @author edson
 */
@WebServlet(name = "ViajeServlet", urlPatterns = {"/ViajeServlet"})
public class ViajeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Usuario usuario = new Usuario();
    UsuarioDAO usuDao = new UsuarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViajeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViajeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
                    /*if(!u.getListaTarjetas().isEmpty())
                        u.getListaTarjetas().get(0);
                    */
                    HttpSession session = request.getSession();               //creamos una sesion
                    System.out.println("Llego el usuario: " + u.getNombre());

                    session.setAttribute("usuarioNuevo", u);                      //guardamos el usuario en la sesion
                    RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/pasajero.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
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
            int id = Integer.parseInt(request.getParameter("idViaje"));
            
            usuDao.eliminarViaje(id);
            response.sendRedirect("./assets/vistas/administrar_viajes.jsp");
        }else if(accion.equalsIgnoreCase("reactivar")){
            int id = Integer.parseInt(request.getParameter("idUsu"));
            int idrol = Integer.parseInt(request.getParameter("idRol"));
            usuDao.reactivar(id);
            if(idrol == 3)
                response.sendRedirect("./assets/vistas/administrar_usuario.jsp");
            else if(idrol == 2)
                response.sendRedirect("./assets/vistas/administrar_transportistas.jsp");
            else
                response.sendRedirect("./assets/vistas/administrar_usuario.jsp");
        }
            else {
            // Credenciales incorrectas, muestra un mensaje de error
            request.setAttribute("error", "Credenciales incorrectas");
            request.getRequestDispatcher("login.jsp").forward(request, response);   //redireccionamos a la vista de login
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
