/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.UsuarioDAO;
import modeloDTO.UsuarioDTO;
import modeloDTO.ViajeDTO;

/**
 *
 * @author edson
 */
@WebServlet(name = "ReporteServlet", urlPatterns = {"/ReporteServlet"})
public class ReporteServlet extends HttpServlet {

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
            out.println("<title>Servlet ReporteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReporteServlet at " + request.getContextPath() + "</h1>");
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
        int pasajero = Integer.parseInt(request.getParameter("pasajero"));
        String fechaIni = request.getParameter("fechaIni");
        String fechaFin = request.getParameter("fechaFin");
        System.out.println("Pasajero: "+ pasajero+" Fecha1 : " +fechaIni+" Fecha1 : " +fechaFin);
        List<ViajeDTO> viajeDTO = usuDao.listarCompletoReporte1(pasajero, fechaIni, fechaFin);
        UsuarioDTO u = usuDao.listarId3(pasajero);
        String nombreCompleto = u.getNombre()+" "+u.getApellido_paterno()+" "+u.getApellido_materno();
        request.setAttribute("viajesReportes", viajeDTO);
        request.setAttribute("nombreCompleto", nombreCompleto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/reportesUsuario.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
        dispatcher.forward(request, response);        
        
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
