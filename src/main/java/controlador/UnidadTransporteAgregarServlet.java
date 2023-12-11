/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.UsuarioDAO;
import modeloDTO.UnidadTransporteDTO;
import modeloDTO.UsuarioDTO;


@WebServlet(name = "UnidadTransporteAgregarServlet", urlPatterns = {"/UnidadTransporteAgregarServlet"})
public class UnidadTransporteAgregarServlet extends HttpServlet {

    
    UsuarioDAO usuDao = new UsuarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UnidadTransporteAgregarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UnidadTransporteAgregarServlet at " + request.getContextPath() + "</h1>");
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
        //UNIDAD DE TRANSPORTE
        String placa = request.getParameter("placa");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        
        
        // Realiza la lógica de agregar aquí, por ejemplo
        UnidadTransporteDTO u = new UnidadTransporteDTO();
        u.setMarca(marca);
        u.setModelo(modelo);
        u.setPlaca(placa);
        
        Boolean respuesta = usuDao.registrarUnidadTransporte(u);
        System.out.println("respuesta: " + respuesta);
        // Redirige a una página de confirmación o a la vista de detalle del usuario
        response.sendRedirect("./assets/vistas/administrar_unidad_transportes.jsp");
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
