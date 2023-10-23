<%@page contentType="text/html" %>
  <%@page pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Login FSorm Design One | Fazt</title>
      <link rel="stylesheet" href="../css/hola.css">
    </head>

    <body>

      <div class="login-box">
        <img src="../image/logo.png" class="avatar" alt="Avatar Image">
        <h1>Iniciar Sesion</h1>

        <form action="../../UsuarioPasajeroServlet">
          <!-- USERNAME INPUT -->
          <label for="username">Usuario</label>
          <input type="text" name="username" placeholder="Enter Username">
          <!-- PASSWORD INPUT -->
          <label for="password">Contraseña</label>
          <input type="password" name="contrasenia" placeholder="Enter Password">

          <input type="submit" name="accion" value="Login">
          
          <a href="#">¿Olvidaste tu contraseña?</a><br>
          <a href="#">¿No tienes una cuenta? Registrate</a>
        </form>
      </div>
    </body>

    </html>