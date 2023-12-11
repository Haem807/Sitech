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
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/recargar.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/comprar.css">
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
      <img src="../img/buss.png" alt="logo buss" width="60">
    </div>
    <nav class="d-flex align-items-center">
      <a href="../../index.html">Inicio</a>
      <a href="#">Registro</a>
    </nav>
  </header>

  <main class="d-flex flex-column justify-content-center align-items-center">

    <h3>RECARGAR TARJETA</h3>

    <section class="my-5">
        <form action="${pageContext.request.contextPath}/RecargarTarjetaServlet" method="post">
        <h5>Datos de la tarjeta</h5>
        <div class="d-flex flex-column ">
          <label for="">Ingrese el monto</label>
          <input name="monto" id="input-recarga" type="number" placeholder="12" required>
        </div>
        
        <div class="d-flex flex-column ">
            
          <label for="">Escojer tarjeta</label>
          
          <select  id="input-recarga" name="tarjetaSeleccionada" id="tarjetaSeleccionada">
               <%
                    List<Tarjeta> listaT = usu.getListaTarjetas();
                    Iterator<Tarjeta> iter = listaT.iterator();
                    Tarjeta t2 = null;

                    while (iter.hasNext()) {
                        t2 = iter.next();
                %>
                    <option id="input-recarga" name="cuentaElegida" value="<%=t2.getNumero_tarjeta()%>"><%=t2.getNumero_tarjeta()%></option>
                    <%}%>
          </select>
        </div>
        <dialog id="recoger">
            <h3>Felicidades se a recargado tu tarjeta</h3>
            <input type="submit" id="submitRecarga" value="Aceptar" name="accion">
        </dialog>
        
      </form>
          <div>

            <button class="botones" id="abrirTarjeta">Con tarjeta</button>
            <button class="botones" id="abrirDeposito">Realizar Deposito</button>
            <button class="botones" id="abrirMonedero">Monedero</button>
          </div>
        
    </section>
          
      <dialog id="tarjetita">
        <div id="abrirRecoger1"><img src="https://i.pinimg.com/originals/dc/db/22/dcdb2231aaf5aae183a1a096b41b43f4.gif" border="0"
            alt="tarjeta-de-credito-imagen-animada-0015" width="300" /></div>
      </dialog>
      <dialog id="deposito">
        <div id="abrirRecoger2"><img src="https://us.123rf.com/450wm/tbaodatui1991/tbaodatui19911807/tbaodatui1991180700082/105519312-insertar-monedas-en-una-m%C3%A1quina-expendedora.jpg?ver=6" border="0"
            alt="tarjeta-de-credito-imagen-animada-0015" width="300" /></div>
      </dialog>
      <dialog id="monedero">
        <div id="abrirRecoger3"><img src="${pageContext.request.contextPath}/assets/img/cartel-yape-plin.jpg" border="0"
            alt="MONEDERO" width="300" /></div>
      </dialog>
      



      <script>
        window.abrirTarjeta.addEventListener('click', () => {
          window.tarjetita.showModal();
        })
        window.abrirDeposito.addEventListener('click', () => {
          window.deposito.showModal();
        })
        window.abrirMonedero.addEventListener('click', () => {
          window.monedero.showModal();
        })
        window.abrirRecoger1.addEventListener('click', () => {
          window.recoger.showModal();
        })
        

        window.abrirRecoger1.addEventListener('click', () => {
          window.tarjetita.close();
        })
        window.abrirRecoger2.addEventListener('click', () => {
          window.recoger.showModal();
        })

        window.abrirRecoger2.addEventListener('click', () => {
          window.deposito.close();
        })
        window.abrirRecoger3.addEventListener('click', () => {
          window.recoger.showModal();
        })

        window.abrirRecoger3.addEventListener('click', () => {
          window.monedero.close();
        })
        window.submitRecarga.addEventListener('click', () => {
          window.recoger.close();
        })
      </script>
  </main>

</body>

</html>