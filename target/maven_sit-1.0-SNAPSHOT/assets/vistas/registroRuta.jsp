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
        <form action="${pageContext.request.contextPath}/RutaAgregarServlet" class="d-flex row align-items-center justify-content-center" method="post">
            <section class="col col-lg-6 d-flex  flex-column align-items-center">
                <h5 class="text-center ">Datos de Unidad de Transporte</h5>
                
            <div class="d-flex flex-column  mt-3 mx-3">
            <label>COLOR</label>
            <input class="" id="input-login" type="text" placeholder="Color" name="color" value="">
          </div>
          <div class="d-flex flex-column mt-3 mx-3" >
            <label>NOMBRE RUTA</label>
            <input class="" id="input-login" type="text" placeholder="Nombre Ruta" name="nombre_ruta" value="">
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>ORIGEN</label>
            <input class="" id="input-login" type="text" placeholder="Origen" name="origen" value="">
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>DESTINO</label>
            <input class="" id="input-login" type="text" placeholder="Destino" name="destino" value="">
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>Distrito</label>
            <select name="idDistrito" id="input-login">
                <option value="">--Seleccionar--</option>
                <option value="1">Alto Selva Alegre</option>
                <option value="2">Arequipa</option>
                <option value="3">Cayma</option>
                <option value="4">Cerro Colorado</option>
                <option value="5">Characato</option>
                <option value="6">Chiguata</option>
                <option value="7">Jacobo Hunter</option>
                <option value="8">Jose Luis Bustamante Y Rivero</option>
                <option value="9">La Joya</option>
                <option value="10">Mariano Melgar</option>
                <option value="11">Miraflores</option>
                <option value="12">Mollebaya</option>
                <option value="13">Paucarpata</option>
                <option value="14">Pocsi</option>
                <option value="15">Polobaya</option>
                <option value="16">Quequeña</option>
                <option value="17">Sabandia</option>
                <option value="18">Sachaca</option>
                <option value="19">San Juan De Siguas</option>
                <option value="20">San Juan De Tarucani</option>
                <option value="21">Santa Isabel De Siguas</option>
                <option value="22">Santa Rita De Sihuas</option>
                <option value="23">Socabaya</option>
                <option value="24">Tiabaya</option>
                <option value="25">Uchumayo</option>
                <option value="26">Vitor</option>
                <option value="27">Yanahuara</option>
                <option value="28">Yarabamba</option>
                <option value="29">Yura</option>
            </select>
        </div>
          
          
            
          <hr>
          <input id="submit-login" type="submit" name="accion" value="GUARDAR">
        </form>

      </section>
    </main>
  </body>
</html>
