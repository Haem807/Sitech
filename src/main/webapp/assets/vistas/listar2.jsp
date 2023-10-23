<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
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
  <a href="UsuarioServlet?accion=add">Nuevo</a>
  <section class="tabla" >
    <table border="1">
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Correo</th>
          <th>Acciones</th>
        </tr>
      </thead>
        
      <% 
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> lista = dao.listar();
        Iterator<Usuario> iter = lista.iterator();
        Usuario usu = null;
        while(iter.hasNext()){
            usu = iter.next();
      %>
      <tbody>
        <tr>
          <td><%= usu.getUsername()%></td>
          <td><%= usu.getContrasenia()%></td>
          <td><%= usu.getId_persona()%></td>
          <td><%= usu.getId_rol()%></td>
          
          <td><a href="../../UsuarioServlet?accion=editar&id=<%= usu.getId()%>">Editar</a></td>
          <td><a href="../../UsuarioServlet?accion=eliminar&id=<%= usu.getId()%>">Eliminar</a></td>
          
        </tr>
        <%}%>
      </tbody>
    </table>    
    
  </section>
</body>
</html>