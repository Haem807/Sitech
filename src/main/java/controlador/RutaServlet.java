/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.UsuarioDAO;
import modeloDTO.RutaDTO;
import modeloDTO.UnidadTransporteDTO;

/**
 *
 * @author edson
 */
@WebServlet(name = "RutaServlet", urlPatterns = {"/RutaServlet"})
public class RutaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UsuarioDAO usuDao = new UsuarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RutaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RutaServlet at " + request.getContextPath() + "</h1>");
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
        String id2 = request.getParameter("idUni");
        System.out.println("Llego al servlet!! " + accion+ id2);
        //comparamos las acciones recibidas por las vistas
        if(accion.equalsIgnoreCase("editar")){
            int idUni = Integer.parseInt(request.getParameter("idUni"));
            System.out.println("idUni: "+idUni);
            RutaDTO u = usuDao.listarIdRuta(idUni);
            request.setAttribute("unidadTransport", u);
            System.out.println("Llego editar!!!!" + u.getColor());
            RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/editarRuta.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
            dispatcher.forward(request, response);
            //response.sendRedirect("./assets/vistas/edit2.jsp");   
        }else if(accion.equalsIgnoreCase("eliminar")){
            int id = Integer.parseInt(request.getParameter("idUni"));
            
            usuDao.eliminarRuta(id);
            response.sendRedirect("./assets/vistas/administrar_rutas.jsp");
        }else if(accion.equalsIgnoreCase("reactivar")){
            int id = Integer.parseInt(request.getParameter("idUni"));
            usuDao.reactivarRuta(id);
            response.sendRedirect("./assets/vistas/administrar_rutas.jsp");
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
        // Recupera los parámetros del formulario
        int id = Integer.parseInt(request.getParameter("id"));
        String color = request.getParameter("color");
        String nombre_ruta = request.getParameter("nombre_ruta");
        String origen = request.getParameter("origen");
        String destino = request.getParameter("destino");
        System.out.println("Ingresado al edit: " + id + color + nombre_ruta + origen + destino);
        // Realiza la lógica de edición aquí, por ejemplo, actualizar la base de datos o realizar otras operaciones
        RutaDTO u = new RutaDTO();
        u.setId(id);
        u.setColor(color);
        u.setNombre_ruta(nombre_ruta);
        u.setOrigen(origen);
        u.setDestino(destino);
        Boolean respuesta = usuDao.editarRuta(u);
        System.out.println("respuesta: " + respuesta);
        // Redirige a una página de confirmación o a la vista de detalle del usuario
        response.sendRedirect("./assets/vistas/administrar_rutas.jsp");
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
