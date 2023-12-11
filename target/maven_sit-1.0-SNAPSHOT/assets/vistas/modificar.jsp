<%@page import="modeloDTO.UsuarioDTO"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image.png" href="../img/icono.png">
  <title>Sistema integrado de Transporte - Devlex</title>
  <!--CSS-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="./../css/login.css">
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
  <main class="d-flex flex-column justify-content-center align-items-center">
    <section class="d-flex flex-column ">
      <h3 class="text-center mb-5">EDITAR</h3>
        <%
            UsuarioDAO usuDao = new UsuarioDAO();
            UsuarioDTO usu = (UsuarioDTO) request.getAttribute("usuario");
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
      
      <form action="UsuarioServlet" class="d-flex flex-column" method="post">
        <div class="d-flex flex-column ">
          <label>#</label>
          <input class="" id="input-login" type="number" placeholder="numero" name="idUsuario" value="<%= usu.getIdUsuario() %>">
          <input type="hidden" type="number" name="idPersona" value="<%= usu.getIdPersona()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>UserName</label>
          <input class="" id="input-login" type="email" placeholder="UserName" name="userName" value="<%= usu.getUsername()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Contraseña</label>
          <input class="" id="input-login" type="password" placeholder="Contraseña" name="contrasenia" value="<%= usu.getContrasenia()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Rol</label>
          <input class="" id="input-login" type="number" placeholder="Rol"  name="idRol" value="<%= usu.getId_rol()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Nombre</label>
          <input class="" id="input-login" type="text" placeholder="Nombre" name="nombre" value="<%= usu.getNombre()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Apellido Paterno</label>
          <input class="" id="input-login" type="text" placeholder="Apellido Paterno" name="apePat" value="<%= usu.getApellido_paterno()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Apellido Materno</label>
          <input class="" id="input-login" type="text" placeholder="Apellido Materno" name="apeMat" value="<%= usu.getApellido_materno()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Fecha Nacimiento</label>
          <input class="" id="input-login" type="text" placeholder="Fecha Nacimiento" name="fechaNac" value="<%= usu.getFechaNacimiento()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>DNI</label>
          <input class="" id="input-login" type="number" placeholder="DNI" name="dni" value="<%= usu.getDni()%>" required>
        </div>
        <div class="d-flex flex-column ">
          <label>Correo</label>
          <input class="" id="input-login" type="text" placeholder="Correo" name="correo" value="<%= usu.getCorreo()%>" required>
        </div>
        <hr>
        <a href="./administrar_usuario.html">...</a>
        <input id="submit-login" type="submit" name="accion" value="GUARDAR">
      </form>

    </section>
  </main>
</body>

</html>