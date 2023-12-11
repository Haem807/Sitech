<%@page import="modeloDTO.RutaDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDTO.UsuarioDTO"%>
<%@page import="modeloDAO.UsuarioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image.png" href="../img/icono.png">
        <title>Sistema integrado de Transporte - Devlex</title>
        <!--CSS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    </head>
    <body>
    <!--Cabezera-->
    <header class="d-flex justify-content-between" id="header">
      <div class="d-flex align-items-center">
        <img src="../img/buss.png" alt="logo buss" width="60">
      </div>
      <nav class="d-flex align-items-center">
        <a href="../../index.html">Inicio</a>
        <a href="#">Registro</a>
      </nav>
    </header>

    <!--Pagina principal-->
    <main class="d-flex flex-column align-items-center">
      <section class="d-flex flex-column ">
        <h3 class="text-center mb-5">GENERACION DE REPORTES</h3>
        <div class="d-flex row align-items-center justify-content-center">
            <form action="${pageContext.request.contextPath}/ReporteServlet" class="col col-lg-4 d-flex  flex-column align-items-center" method="post">
                <section class="col col-lg-6 d-flex  flex-column align-items-center">
                    <h5 class="text-center ">Reporte de Servicios por Pasajero</h5>
                    <label>Seleccionar pasajero</label>
                    <select  name="pasajero" id="input-login">
                        <%
                            UsuarioDAO usuDao = new UsuarioDAO();
                            List<UsuarioDTO> lista3 = usuDao.listarCompleto();
                            Iterator<UsuarioDTO> iter3 = lista3.iterator();
                            UsuarioDTO t3 = null;

                            while (iter3.hasNext()) {
                                t3 = iter3.next();
                        %>
                        <option value="<%= t3.getIdUsuario()%>"> <%= t3.getNombre()+ " " + t3.getApellido_paterno()+ " " + t3.getApellido_materno()%></option>
                        <% }%>

                    </select>
                    <label>Fecha inicio</label>
                    <input class="" id="input-login" type="date" placeholder="Fecha inicio" name="fechaIni" required>
                    <label>Fecha fin</label>
                    <input class="" id="input-login" type="date" placeholder="Fecha fin" name="fechaFin" required>

                    <input id="submit-login" type="submit" name="accion" value="GENERAR REPORTE">



                </section>

              </form>          
              <form action="${pageContext.request.contextPath}/ReporteServlet1" class="col col-lg-4 d-flex  flex-column align-items-center" method="post">          
              <section class="col col-lg-6 d-flex align-items-center flex-column">
                  <h5 class="text-center ">Resumen de servicios por fecha</h5>
                    <label>Seleccionar Linea</label>
                    <select  name="color" id="input-login">
                        <option value="0" selected>TODAS LAS LINEAS</option>
                        <%
                            List<RutaDTO> listaT = usuDao.listarCompletoRutas();
                            Iterator<RutaDTO> iter = listaT.iterator();
                            RutaDTO t2 = null;

                            while (iter.hasNext()) {
                                t2 = iter.next();
                        %>
                        <option value="<%= t2.getId()%>"> <%= t2.getColor()%></option>
                        <% }%>

                    </select>
                    <label>Fecha inicio</label>
                    <input class="" id="input-login" type="date" placeholder="Fecha inicio" name="fechaIni" required>
                    <label>Fecha fin</label>
                    <input class="" id="input-login" type="date" placeholder="Fecha fin" name="fechaFin" required>
                    <input id="submit-login" type="submit" name="accion" value="GENERAR REPORTE">

                </section>
                 
            </form>
                        <form action="${pageContext.request.contextPath}/ReporteServlet2" class="col col-lg-4 d-flex  flex-column align-items-center" method="post">          
              <section class="col col-lg-6 d-flex align-items-center flex-column">
                  <h5 class="text-center ">Reporte de pago de servicios por fecha</h5>
                    <label>Seleccionar Linea</label>
                    <select  name="conductor" id="input-login">
                        <%
                            List<UsuarioDTO> lista32 = usuDao.listarCompletoTransportistas();
                            Iterator<UsuarioDTO> iter32 = lista32.iterator();
                            UsuarioDTO t32 = null;

                            while (iter32.hasNext()) {
                                t32 = iter32.next();
                        %>
                        <option value="<%= t32.getIdUsuario()%>"> <%= t32.getNombre()+ " " + t32.getApellido_paterno()+ " " + t32.getApellido_materno()%></option>
                        <% }%>

                    </select>
                    <label>Fecha inicio</label>
                    <input class="" id="input-login" type="date" placeholder="Fecha inicio" name="fechaIni" required>
                    <label>Fecha fin</label>
                    <input class="" id="input-login" type="date" placeholder="Fecha fin" name="fechaFin" required>
                    <input id="submit-login" type="submit" name="accion" value="GENERAR REPORTE">

                </section>
                 
            </form>
        </div>               
      </section>
    </main>
  </body>
</html>
