
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
import modeloDTO.UnidadTransporteDTO;
import modeloDTO.UsuarioDTO;
import modeloDTO.UsuarioTransportistaDTO;


@WebServlet(name = "UnidadTransporteServlet", urlPatterns = {"/UnidadTransporteServlet"})
public class UnidadTransporteServlet extends HttpServlet {

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
            out.println("<title>Servlet UnidadTransporteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UnidadTransporteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


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
            UnidadTransporteDTO u = usuDao.listarIdUnidadTranport(idUni);
            request.setAttribute("unidadTransport", u);
            System.out.println("Llego editar!!!!" + u.getPlaca());
            RequestDispatcher dispatcher = request.getRequestDispatcher("./assets/vistas/editarUnidadTransporte.jsp"); // Reemplaza "/miVista.jsp" con la ruta real de tu JSP.
            dispatcher.forward(request, response);
            //response.sendRedirect("./assets/vistas/edit2.jsp");   
        }else if(accion.equalsIgnoreCase("eliminar")){
            int id = Integer.parseInt(request.getParameter("idUni"));
            
            usuDao.eliminarUnidadTransporte(id);
            response.sendRedirect("./assets/vistas/administrar_unidad_transportes.jsp");
        }else if(accion.equalsIgnoreCase("reactivar")){
            int id = Integer.parseInt(request.getParameter("idUni"));
            usuDao.reactivarUnidadTransporte(id);
            response.sendRedirect("./assets/vistas/administrar_unidad_transportes.jsp");
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
        int idUnidad = Integer.parseInt(request.getParameter("idUnidad"));
        String placa = request.getParameter("placa");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        System.out.println("Ingresado al edit: " + idUnidad + placa + marca + modelo);
        // Realiza la lógica de edición aquí, por ejemplo, actualizar la base de datos o realizar otras operaciones
        UnidadTransporteDTO u = new UnidadTransporteDTO();
        u.setId(idUnidad);
        u.setPlaca(placa);
        u.setMarca(marca);
        u.setModelo(modelo);
        Boolean respuesta = usuDao.editarUnidadTransporte(u);
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
