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
import modeloDTO.UsuarioDTO;

/**
 *
 * @author edson
 */
@WebServlet(name = "UsuarioAgregarServlet", urlPatterns = {"/UsuarioAgregarServlet"})
public class UsuarioAgregarServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioAgregarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioAgregarServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        processRequest(request, response);
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
        //USUARIO
        String userName = request.getParameter("userName");
        String contrasenia = request.getParameter("contrasenia");
        int tipoUsu = Integer.parseInt(request.getParameter("tipoUsuario"));
        
        //PERSONA
        String nombre = request.getParameter("nombre");
        String apePat = request.getParameter("apePat");
        String apeMat = request.getParameter("apeMat");
        String fechaNac = request.getParameter("fechaNac");
        int dni = Integer.parseInt(request.getParameter("dni"));
        String correo = request.getParameter("correo");
        // Realiza la lógica de agregar aquí, por ejemplo
        UsuarioDTO u = new UsuarioDTO();
        
        u.setUsername(userName);
        u.setContrasenia(contrasenia);
        u.setId_rol(tipoUsu);
        
        u.setNombre(nombre);
        u.setApellido_paterno(apePat);
        u.setApellido_materno(apeMat);
        u.setFechaNacimiento(fechaNac);
        u.setDni(dni);
        u.setCorreo(correo);
        Boolean respuesta = usuDao.registrarUsuario(u);
        System.out.println("respuesta: " + respuesta);
        // Redirige a una página de confirmación o a la vista de detalle del usuario
        response.sendRedirect("./assets/vistas/administrar_usuario.jsp");
        
        
        
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
