<%@page import="modeloDTO.UsuarioDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
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
  <link rel="stylesheet" href="../css/administrar.css">
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


    <div class="mb-3">
      <h3>ADMINISTRACION DE USUARIOS</h3>
    </div>
    <section class="my-4 d-flex">
      <a href="./administrar_rutas.html" class="sidebar-link">
        Rutas
      </a>
      <a href="./administrar_conductores.html" class="sidebar-link">
        Conductores
      </a>
      <a href="./administrar_unidades.html" class="sidebar-link">
        Unidades
      </a>
    </section>
    <section id="tabla">
      <table class="">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Usuario</th>
            <th scope="col">Contraseña</th>
            <th scope="col">Rol</th>
            <th scope="col">Nombres</th>
            <th scope="col">Apellido Paterno</th>
            <th scope="col">Apellido Materno</th>
            <th scope="col">Fecha N.</th>
            <th scope="col">DNI</th>
            <th scope="col">Correo</th>
            <th scope="col"></th>
            <th scope="col"></th>
          </tr>
        </thead>
        
        <% 
            UsuarioDAO dao = new UsuarioDAO();
            List<UsuarioDTO> lista = dao.listarCompleto();
            Iterator<UsuarioDTO> iter = lista.iterator();
            UsuarioDTO usu = null;
            while(iter.hasNext()){
                usu = iter.next();
          %>
        <tbody>
          <tr>
            <td><%= usu.getIdUsuario() %></td>
            <td><%= usu.getUsername()%></td>
            <td><%= usu.getContrasenia()%></td>
            <td><%= usu.getId_rol()%></td>
            <td><%= usu.getNombre()%></td>
            <td><%= usu.getApellido_paterno()%></td>
            <td><%= usu.getApellido_materno()%></td>
            <td><%= usu.getFechaNacimiento()%></td>
            <td><%= usu.getDni()%></td>
            <td><%= usu.getCorreo()%></td>
            
            <td><a href="../../UsuarioServlet?accion=editar&idUsu=<%= usu.getIdUsuario()%>&idPer=<%= usu.getIdPersona()%>">E</a></td>
            <td><a href="../../UsuarioServlet?accion=eliminar&idUsu=<%= usu.getIdUsuario()%>&idPer=<%= usu.getIdPersona()%>">E2</a></td>
          </tr>
        </tbody>
        <%}%>
      </table>
    </section>

    <section class="my-4 d-flex">
      <button type="button" class="botones">Agregar</button>
      <button type="button" class="botones">Guardar</button>
    </section>

  </main>
</body>

</html>