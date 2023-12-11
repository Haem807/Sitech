<%@page import="modeloDTO.HorarioDTO"%>
<%@page import="modeloDTO.UsuarioTransportistaDTO"%>
<%@page import="modeloDTO.UnidadTransporteDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDTO.RutaDTO"%>
<%@page import="modeloDTO.ViajeDTO"%>
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
        <h3 class="text-center mb-5">Registro de Usuario</h3>
        <form action="${pageContext.request.contextPath}/ViajeAgregarServlet" class="d-flex row align-items-center justify-content-center" method="post">
            <section class="col col-lg-6 d-flex  flex-column align-items-center">
                <h5 class="text-center ">Datos de viaje</h5>
                
            
                
            <div class="d-flex flex-column mt-3 mx-3" >
              <label>Color de ruta</label>
              <select  name="color" id="input-login">
                <%
                    UsuarioDAO usuDao = new UsuarioDAO();
                    List<RutaDTO> listaT = usuDao.listarCompletoRutas();
                    Iterator<RutaDTO> iter = listaT.iterator();
                    RutaDTO t2 = null;

                    while (iter.hasNext()) {
                        t2 = iter.next();
                %>
                <option value="<%= t2.getId()%>"> <%= t2.getColor()%></option>
                <% }%>

              </select>
            </div>
                
            <div class="d-flex flex-column mt-3 mx-3" >
              <label>Transporte</label>
              <select  name="transporte" id="input-login">
                <%
                    List<UnidadTransporteDTO> lista = usuDao.listarCompletoUnidadTransportistas();
                    Iterator<UnidadTransporteDTO> iter2 = lista.iterator();
                    UnidadTransporteDTO t = null;

                    while (iter2.hasNext()) {
                        t = iter2.next();
                %>
                <option value="<%= t.getId()%>"> <%= t.getPlaca()%></option>
                <% }%>

              </select>
            </div>
                <div class="d-flex flex-column mt-3 mx-3" >
              <label>Conductor</label>
              <select  name="conductor" id="input-login">
                <%
                    List<UsuarioDTO> lista3 = usuDao.listarCompletoTransportistas();
                    Iterator<UsuarioDTO> iter3 = lista3.iterator();
                    UsuarioDTO t3 = null;

                    while (iter3.hasNext()) {
                        t3 = iter3.next();
                %>
                <option value="<%= t3.getIdUsuario()%>"> <%= t3.getNombre()+ " " + t3.getApellido_paterno()+ " " + t3.getApellido_materno()%></option>
                <% }%>

              </select>
                </div>
                <div class="d-flex flex-column mt-3 mx-3">
                    <label>Tarifa</label>
                    <input class="" id="input-login" type="text" placeholder="Tarifa" name="tarifa" required>
                  </div>
                
                <div class="d-flex flex-column mt-3 mx-3" >
              <label>Horario</label>
              <select  name="horario" id="input-login">
                <%
                    List<HorarioDTO> lista4 = usuDao.listarCompletoHorarios();
                    Iterator<HorarioDTO> iter4 = lista4.iterator();
                    HorarioDTO t4 = null;

                    while (iter4.hasNext()) {
                        t4 = iter4.next();
                %>
                <option value="<%= t4.getId()%>"> <%= t4.getHora_salida().substring(0,5)+" - "+t4.getHora_retorno().substring(0,5) %></option>
                <% }%>

              </select>
            </div>
                
            
          
          
            
          <hr>
          <input id="submit-login" type="submit" name="accion" value="GUARDAR">
        </form>

      </section>
    </main>
  </body>
</html>
