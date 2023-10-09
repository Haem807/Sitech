<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SIT</title>
  <!--ESTILOS CSS-->
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div>
      <form action="UsuarioServlet" >
        <input type="text" name="nombre" placeholder="Nombre">
        <input type="text" name="apellido_paterno" placeholder="Apellido Paterno">
        <input type="text" name="apellido_materno" placeholder="Apellido Materno">
        <input type="text" name="correo" placeholder="Correo">
        <input type="text" name="contrasena" placeholder="Contraseña">
        <input type="submit" name="accion" value="Editar">
      </form>
    </div>
</body>
</html>