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
        
        <%
              UsuarioDAO usuDao = new UsuarioDAO();
              ViajeDTO usu = (ViajeDTO) request.getAttribute("Viaje");
              //out.println("VISTA: "+ usu.getUsername());
              /*try {
                  int id_usu = Integer.parseInt(idString);
                  usu = (UsuarioDTO) usuDao.listarId2(usuario);
                  // Realiza acciones con 'usu'
              } catch (NumberFormatException e) {
                  // Manejo de error si la conversión falla
                  out.println("Error: El valor de 'id' no es un número válido.");
              }*/
          %>
        <form action="${pageContext.request.contextPath}/ViajeServlet" class="d-flex row align-items-center justify-content-center" method="post">
            <section class="col col-lg-6 d-flex  flex-column align-items-center">
                <h5 class="text-center ">Datos de viaje</h5>
                
            
            <input type="hidden" class="" id="input-login" type="number" placeholder="numero" name="idViaje" value="<%= usu.getIdViaje() %>">
            <input type="hidden" type="number" name="idHorarioViaje" value="<%= usu.getIdHorarioViaje() %>">
            <div class="d-flex flex-column mt-3 mx-3" >
              <label>Color de ruta</label>
              <select  name="color" id="input-login">
                <%
                    List<RutaDTO> listaT = usuDao.listarCompletoRutas();
                    Iterator<RutaDTO> iter = listaT.iterator();
                    RutaDTO t2 = null;
                    String select = "";
                    while (iter.hasNext()) {
                        t2 = iter.next();
                        if(t2.getId() == usu.getId_ruta()){
                            select = "selected";
                        }
                        else{
                            select = "";
                        }
                %>
                <option value="<%= t2.getId()%>" <%= select%>> <%= t2.getColor()%></option>
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
                        if(t.getId() == usu.getId_transporte()){
                            select = "selected";
                        }
                        else{
                            select = "";
                        }
                %>
                <option value="<%= t.getId()%>" <%= select%>> <%= t.getPlaca()%></option>
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
                        if(t3.getIdUsuario() == usu.getId_transportista()){
                            select = "selected";
                        }
                        else{
                            select = "";
                        }
                %>
                <option value="<%= t3.getIdUsuario()%>" <%= select%>> <%= t3.getNombre()+ " " + t3.getApellido_paterno()+ " " + t3.getApellido_materno()%></option>
                <% }%>

              </select>
                </div>
                <div class="d-flex flex-column mt-3 mx-3">
                    <label>Tarifa</label>
                    <input class="" id="input-login" type="text" placeholder="Tarifa" name="tarifa" value= "<%= usu.getTarifa()%>" required>
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
                        if(t4.getId() == usu.getHorario()){
                            select = "selected";
                        }
                        else{
                            select = "";
                        }
                %>
                <option value="<%= t4.getId()%>" <%= select%>> <%= t4.getHora_salida().substring(0,5)+" - "+t4.getHora_retorno().substring(0,5) %></option>
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
