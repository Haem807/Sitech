<%@page import="modeloDTO.UsuarioTransportistaDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Tarjeta"%>
<%@page import="modeloDTO.UsuarioDTO"%>
<%@page import="modeloDAO.UsuarioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image.png" href="../img/buss.png">
  <title>Sistema integrado de Transporte - Devlex</title>
  <!--CSS-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="./assets/css/style.css">
  <link rel="stylesheet" href="./assets/css/login.css">
</head>

<body>
    <%
        UsuarioDAO usuDao = new UsuarioDAO();
        UsuarioTransportistaDTO usuTransport = (UsuarioTransportistaDTO) session.getAttribute("usuarioTransportista");
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
  <!--Cabezera-->
  <header class="d-flex justify-content-between" id="header">
    <div class="d-flex align-items-center">
      <img src="../img/buss.png" alt="logo buss" width="60">
    </div>
    <nav class="d-flex align-items-center">
      <a href="${pageContext.request.contextPath}/index.html">Inicio</a>
      <a href="#">Registro</a>
    </nav>
  </header>

  <!--Pagina principal-->
  <main class="d-flex flex-column justify-content-center align-items-center">
    <section class="d-flex flex-column align-items-center">
      <h3 class="text-center mb-5">Cobrar Tarifa</h3>
      <div class="d-flex ">
        <h6 class="text-center mb-4 mx-3">Transporte: <span><%= usuTransport.getViaje().getMarca()%></span></h6>
        <h6 class="text-center mb-4 mx-3">Placa Transporte: <span><%= usuTransport.getViaje().getPlaca()%></span></h6>
        <h6 class="text-center mb-4 mx-3">Tarifa: <span>S/<%= usuTransport.getViaje().getTarifa()%></span></h6>
        <h6 class="text-center mb-4 mx-3">Origen: <span><%= usuTransport.getViaje().getOrigen()%></span></h6>
        <h6 class="text-center mb-4 mx-3">Destino: <span><%= usuTransport.getViaje().getDestino()%></span></h6>

      </div>
      <form action="CobrarServlet" class="d-flex flex-column" method="post">
        <div class="d-flex flex-column ">
          <label for="exampleSelect1" class=" mt-4">Usuario</label>
          <select  class="" id="input-login">
            <%
                List<UsuarioDTO> listaT = usuTransport.getListaUsuarios();
                Iterator<UsuarioDTO> iter = listaT.iterator();
                UsuarioDTO t2 = null;

                while (iter.hasNext()) {
                    t2 = iter.next();
            %>
            <option> <%= t2.getUsername()%></option>
            <% }%>
            
          </select>
        </div>
        <div class="d-flex flex-column ">
          <label>Numero de tarjeta</label>
          <input type="hidden" name="id_viaje" value="<%= usuTransport.getViaje().getIdViaje() %>">
          <input type="hidden" name="tarifa" value="<%= usuTransport.getViaje().getTarifa() %>">
          <input class="" name="numTarjeta" id="input-login" type="text" placeholder="234567890">
        </div>
        
        <hr>
        <a href="pasajero.html">...</a>
        <input id="submit-login" type="submit" name="accion" value="Cobrar">
      </form>

    </section>
  </main>
</body>

</html>