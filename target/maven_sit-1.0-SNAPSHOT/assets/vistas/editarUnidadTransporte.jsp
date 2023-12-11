<%@page import="modeloDTO.UnidadTransporteDTO"%>
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
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/login.css">
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
        <h3 class="text-center mb-5">EDITAR</h3>
          <%
              UsuarioDAO usuDao = new UsuarioDAO();
              UnidadTransporteDTO uni = (UnidadTransporteDTO) request.getAttribute("unidadTransport");
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

        <form action="${pageContext.request.contextPath}/UnidadTransporteServlet" class="d-flex row align-items-center justify-content-center" method="post">
            <section class="col col-lg-6 d-flex  flex-column align-items-center">
                <div class="d-flex flex-column mt-3 mx-3">
            <label>#</label>
            <input class="" id="input-login" type="number" placeholder="numero" name="idUnidad" value="<%= uni.getId() %>">
          </div>
          <div class="d-flex flex-column  mt-3 mx-3">
            <label>PLACA</label>
            <input class="" id="input-login" type="text" placeholder="UserName" name="placa" value="<%= uni.getPlaca()%>">
          </div>
          <div class="d-flex flex-column mt-3 mx-3" >
            <label>MARCA</label>
            <input class="" id="input-login" type="text" placeholder="Contraseña" name="marca" value="<%= uni.getMarca()%>">
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>MODELO</label>
            <input class="" id="input-login" type="text" placeholder="Nombre" name="modelo" value="<%= uni.getModelo()%>">
          </div>
          
            
          <hr>
          <a href="./administrar_usuario.html">...</a>
          <input id="submit-login" type="submit" name="accion" value="GUARDAR">
        </form>

      </section>
    </main>
  </body>
</html>
