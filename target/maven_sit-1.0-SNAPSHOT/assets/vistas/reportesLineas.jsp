<%@page import="modeloDTO.ViajeDTO"%>
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
  <%
              UsuarioDAO usuDao = new UsuarioDAO();
              List<ViajeDTO> viajeDTO = (List<ViajeDTO>) request.getAttribute("viajesReportes");
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
  <title>Reporte de Lineas</title>
  <!--CSS-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!--font awesome con CDN-->  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  

  
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/administrar.css">
</head>

<body>
  <!--Cabezera-->
  <header class="d-flex justify-content-between" id="header">
    <div class="d-flex align-items-center">
      <img src="../img/buss.png" alt="logo buss" width="60">
    </div>
    <nav class="d-flex align-items-center">
      <a href="${pageContext.request.contextPath}/index.html">Inicio</a>
      <a href="${pageContext.request.contextPath}/assets/vistas/reportes.jsp">Reportes</a>
    </nav>
  </header>

  <!--Pagina principal-->
  <main class="d-flex flex-column justify-content-center align-items-center">


    <div class="mb-3">
      <h3>REPORTE DE LINEAS</h3>
    </div>
    
    <section id="tabla">
        
        <table class="" id="miTabla" style="width:100%;">
            <thead>
              <tr>
                <th scope="col">Color</th>
                <th scope="col">Total</th>
                <th scope="col">Cantidad de usuarios</th>
              </tr>
            </thead>
        
            <tbody>
              <% 
                UsuarioDAO dao = new UsuarioDAO();
                Iterator<ViajeDTO> iter = viajeDTO.iterator();
                ViajeDTO usu = null;
                while(iter.hasNext()){
                usu = iter.next();
              %>
              <tr>
                <td style="background-color:#1e1e20;"><%= usu.getColor() %></td>
                <td style="background-color:#1e1e20;"><%= usu.getTarifa()%></td>
                <td style="background-color:#1e1e20;"><%= usu.getCantidad()%></td>
                
                
              </tr>
            
            <%}%>
          </tbody>
      </table>
    </section>

    
      
      
      
      <script>
        // Seleccionar el botï¿½n por su ID
        var boton = document.getElementById('botonAgregar');
        var boton2 = document.getElementById('botonReactivar');

        // Agregar un controlador de eventos de clic al botï¿½n
        boton.addEventListener('click', function() {
            // Redirigir a otra pï¿½gina HTML
            window.location.href = 'registroUsuario.jsp';
        });
        // Agregar un controlador de eventos de clic al botï¿½n
        boton2.addEventListener('click', function() {
            // Redirigir a otra pï¿½gina HTML
            window.location.href = 'reactivar_Usuario.jsp';
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

    
<!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="popper/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
      
<!-- datatables JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/datatables/datatables.min.js"></script>    
    
<!-- para usar botones en datatables JS -->  
    <script src="${pageContext.request.contextPath}/assets/datatables/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>  
    <script src="${pageContext.request.contextPath}/assets/datatables/JSZip-2.5.0/jszip.min.js"></script>    
    <script src="${pageContext.request.contextPath}/assets/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>    
    <script src="${pageContext.request.contextPath}/assets/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/datatables/Buttons-1.5.6/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vistas/main_tablas.js"></script>
  </main>
</body>

</html>