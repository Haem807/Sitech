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
            String idString = (String) request.getAttribute("id_usu");
            Usuario usu = new Usuario();
            try {
                int id_usu = Integer.parseInt(idString);
                usu = (Usuario) usuDao.listarId(id_usu);
                // Realiza acciones con 'usu'
            } catch (NumberFormatException e) {
                // Manejo de error si la conversión falla
                out.println("Error: El valor de 'id' no es un número válido.");
            }
        %>
        <form action="UsuarioServlet" method="post">
        <input type="hidden" name="id" value="<%= usu.getId()%>">
        <input type="text" name="userName" value="<%= usu.getUsername()%>">
        <input type="text" name="contrasenia" placeholder="contraseña" value="<%= usu.getContrasenia()%>">
        <input type="text" name="idPersona" placeholder="idPersona" value="<%= usu.getId_persona()%>">
        <input type="text" name="idRol" placeholder="idRol" value="<%= usu.getId_rol()%>">
        <input type="submit" name="accion" value="Actualizar">
      </form>
    </div>
</body>
</html>