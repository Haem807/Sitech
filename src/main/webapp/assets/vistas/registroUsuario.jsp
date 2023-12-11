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
        <form action="${pageContext.request.contextPath}/UsuarioAgregarServlet" class="d-flex row align-items-center justify-content-center" method="post">
            <section class="col col-lg-6 d-flex  flex-column align-items-center">
                <h5 class="text-center ">Datos de Usuario</h5>
                
            <div class="d-flex flex-column  mt-3 mx-3">
              <label>UserName</label>
              <input class="" id="input-login" type="email" placeholder="UserName" name="userName" required>
            </div>
            <div class="d-flex flex-column mt-3 mx-3" >
              <label>Contraseña</label>
              <input class="" id="input-login" type="password" placeholder="Contraseña" name="contrasenia" required>
            </div> 
                
            <div class="d-flex flex-column mt-3 mx-3" >
              <label>Tipo de usuario</label>
              <select name="tipoUsuario" id="input-login">
                <option value="">--Seleccionar--</option>
                <option value="3">Pasajero</option>
                <option value="2">Transportista</option>
                <option value="1">Administrador</option>
              </select>
            </div>
            
          
          
            </section>
          <section class="col col-lg-6 d-flex align-items-center flex-column">
              <h5 class="text-center ">Datos de persona</h5>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>Nombre</label>
            <input class="" id="input-login" type="text" placeholder="Nombre" name="nombre" required>
          </div>
              <div class="d-flex flex-column mt-3 mx-3">
            <label>Apellido Paterno</label>
            <input class="" id="input-login" type="text" placeholder="Apellido Paterno" name="apePat" required>
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>Apellido Materno</label>
            <input class="" id="input-login" type="text" placeholder="Apellido Materno" name="apeMat" required>
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>Fecha Nacimiento</label>
            <input class="" id="input-login" type="date" placeholder="Fecha Nacimiento" name="fechaNac" required>
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>DNI</label>
            <input class="" id="input-login" type="number" placeholder="DNI" name="dni" required>
          </div>
          <div class="d-flex flex-column mt-3 mx-3">
            <label>Correo</label>
            <input class="" id="input-login" type="text" placeholder="Correo" name="correo" required>
          </div>
              
          
          </section>
          <hr>
          <input id="submit-login" type="submit" name="accion" value="GUARDAR">
        </form>

      </section>
    </main>
  </body>
</html>
