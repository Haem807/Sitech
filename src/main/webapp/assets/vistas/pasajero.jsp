
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
  <link rel="icon" type="image.png" href="${pageContext.request.contextPath}/assets/img/buss.png">
  <title>Sistema integrado de Transporte - Devlex</title>
  <!--CSS-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pasajero.css">
</head>

<body>
    <%
        UsuarioDAO usuDao = new UsuarioDAO();
        UsuarioDTO usu = (UsuarioDTO) session.getAttribute("usuarioNuevo");
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
      <img src="${pageContext.request.contextPath}/assets/img/buss.png" alt="logo buss" width="60">
    </div>
    <nav class="d-flex align-items-center">
      <a href="../../index.html">Inicio</a>
      <a href="#">Registro</a>
    </nav>
  </header>
  <main>
    <section class="d-flex justify-content-center align-items-center flex-column ">
      <article class="my-5" id="tarjeta">
        <img id="img-tarjeta" src="${pageContext.request.contextPath}/assets/img/font-tar.png" alt="" width="100%">
        <header class="" id="codigo">
          <h6># <%= usu.getListaTarjetas().get(0).getNumero_tarjeta()%></h6>
        </header>
        <div class="d-flex justify-content-start align-items-center flex-column" id="contenido">
          <h2>SIT <span>Card</span></h2>
          <p>Tarjeta solo valido para transporte </p>
          <h6><%= usu.getNombre()%></h6>
        </div>
        <footer class="d-flex justify-content-around " id="extra">
          <h6>Saldo: <span>S/ </span><%= usu.getListaTarjetas().get(0).getSaldo()%></h6>
          <h6>Creada: <%= usu.getListaTarjetas().get(0).getFecha_activacion()%></h6>
        </footer>
      </article>

      <section class="pt-4" id="">
        <h5>Realiza las siguientes operaciones con tu tarjeta</h5>
        <div class="d-flex flex-row justify-content-center align-items-center">
          <a href="${pageContext.request.contextPath}/assets/vistas/comprar_tarjeta.jsp" id="botones">Comprar Tarjeta</a>
          <a href="${pageContext.request.contextPath}/assets/vistas/recargar_tarjeta.jsp" id="botones">Recargar Tarjeta</a>

        </div>
        
        <div class="d-flex flex-column">
    <label for="exampleSelect1" class="mt-4">Seleccione su tarjeta</label>
    <select class="" id="input-login">
        <%
            List<Tarjeta> listaT = usu.getListaTarjetas();
            Iterator<Tarjeta> iter = listaT.iterator();
            Tarjeta t2 = null;

            while (iter.hasNext()) {
                t2 = iter.next();
        %>
            <option> <%= t2.getNumero_tarjeta()%></option>
        <% }%>
    </select>
</div>
      </section>
    </section>

  </main>

</body>

</html>