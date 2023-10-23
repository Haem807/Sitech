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
import modelo.ViajeUsuario;
import modeloDAO.TarjetaDAO;
import modeloDAO.UsuarioDAO;

/**
 *
 * @author edson
 */
@WebServlet(name = "CobrarServlet", urlPatterns = {"/CobrarServlet"})
public class CobrarServlet extends HttpServlet {

    UsuarioDAO usuDao = new UsuarioDAO();
    TarjetaDAO tarDao = new TarjetaDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CobrarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CobrarServlet at " + request.getContextPath() + "</h1>");
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
        int idViaje = Integer.parseInt(request.getParameter("id_viaje"));
        String numero_tarjeta = request.getParameter("numTarjeta");
        int usuario = usuDao.buscarUsuTarjeta(numero_tarjeta);
        double tarifa = Double.parseDouble(request.getParameter("tarifa"));
        ViajeUsuario viaje = new ViajeUsuario();
        
        viaje.setFecha_registro("12-12-2023");
        viaje.setHora_registro("00:00:00");
        viaje.setId_usuario(usuario);
        viaje.setId_viaje(idViaje);
        viaje.setMonto_cobrado(tarifa);
        viaje.setTarjeta(numero_tarjeta);
        tarDao.descuentoTarjeta(viaje);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/cobrar.jsp");
        dispatcher.forward(request, response);
        //response.sendRedirect("./assets/vistas/cobrar.jsp");
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
