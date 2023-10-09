<%@page import="modelo.Usuario"%>
<%@page import="modeloDAO.UsuarioDAO"%>
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
        <%
            UsuarioDAO usuDao = new UsuarioDAO();
            int id_usu = Integer.parseInt((String) request.getAttribute("id_usu"));
            Usuario usu = (Usuario) usuDao.listarId(id_usu);
        %>
      <form action="UsuarioServlet" >
        <input type="hidden" name="id" value="">
        <input type="text" name="nombre" value="<%= usu.getNombre()%>">
        <input type="text" name="apellido_paterno" placeholder="Apellido Paterno">
        <input type="text" name="apellido_materno" placeholder="Apellido Materno">
        <input type="text" name="correo" placeholder="Correo">
        <input type="text" name="contrasena" placeholder="Contraseña">
        <input type="submit" name="accion" value="Actualizar">
      </form>
    </div>
</body>
</html>