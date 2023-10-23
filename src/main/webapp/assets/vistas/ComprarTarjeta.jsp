<%@page import="modeloDTO.UsuarioDTO"%>
<%@page import="java.util.Random"%>
<%@page import="modelo.Usuario" %>
  <!DOCTYPE html>
  <html lang="en" data-bs-theme="dark">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SIT</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" />
    <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hola.css" />
  </head>

  <body>
    <!-- ======== Main wrapper for dashboard =========== -->

    <div class="wrapper">
      <!-- =========== Sidebar for admin dashboard =========== -->

      <aside id="sidebar">
        <!-- ======== Content For Sidebar ========-->
        <div class="h-100">
          <div class="sidebar-logo">
            <a href="#">
              <img class="imagen" src="${pageContext.request.contextPath}/assets/img/interfaz-de-usuario-de-administrador.png" alt="" />
            </a>
          </div>
          <ul class="sidebar-nav">
            <li class="sidebar-header">Saldo: S/41.00</li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> RUTAS Y HORARIOS </a>
            </li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> HISTORIAL </a>
            </li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> RECARGA TARJETA </a>
            </li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> ACTIVAR TARJETA </a>
            </li>
          </ul>

          <!-- ======= Navigation links for sidebar ======== -->
          <ul class="sidebar-nav"></ul>
        </div>
      </aside>

      <!-- ========= Main section of dashboard ======= -->

      <div class="main">
        <!-- ========= Main navbar section of dashboard ======= -->

        <nav class="navbar navbar-expand px-3 border-bottom">
          <button class="btn" id="sidebar-toggle" type="button">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="navbar-collapse navbar">
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a href="#" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                  <img src="${pageContext.request.contextPath}/assets/img/icono.png" class="avatar img-fluid rounded" alt="" />
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <!-- ========= Main content section of dashboard ======= -->

        <main class="content px-3 py-2">
          <div class="container-fluid">
            <div class="mb-3">
              <h3>COMPRAR TARJETA</h3>
            </div>
            <!--tarjeta de sit-->
            <% 
            UsuarioDTO user=(UsuarioDTO) session.getAttribute("usuarioNuevo"); if (user !=null) { %>
              <div class="d-flex justify-content-center">
                <div class="tarjeta-compra px-4 py-3 my-3 bg-white rounded border border-success border-4"
                  style="width: 500px;height: 250px;">
                  <p class="text-dark"># <span>5423</span></p>
                  <div class="d-flex flex-column justify-content-center align-items-center">
                    <h1 class="text-dark ">Tarjeta SIT</h1>
                    <!<!-- obtenemos el nombre de usuario del modelo Usuario -->
                      <p class="text-dark ">
                        <%= user.getUsername()%>
                      </p>
                  </div>

                </div>
              </div>
              <%}%>
                <div class="mb-3">
                  <h3>DATOS DE TARJETA</h3>
                </div>
                <form action="../../TarjetaServlet">
                  <div class="input-group mb-3">
                    <%
                      Random random = new Random();
                      StringBuilder numeroAleatorio = new StringBuilder(16);
                        for (int i = 0; i < 16; i++) {
                            int digito = random.nextInt(10); // Generar un d�gito aleatorio del 0 al 9
                            numeroAleatorio.append(digito);
                        }
                      if(numeroAleatorio != null){
                    %>
                    <span class="input-group-text">Numero de tarjeta</span>
                    <input type="text" aria-label="First name" name="numero_tarjeta" class="form-control" value="" placeholder="<%= numeroAleatorio%>" />
                       <%}%>
                  </div>

                  <div class="input-group mb-3">
                    <span class="input-group-text">Fecha Vencimiento</span>
                    <input type="text" aria-label="First name" name="fecha_activacion" class="form-control"
                      placeholder="2023-10-08" />
                    <span class="input-group-text">CVV</span>
                    <input type="text" aria-label="Last name" class="form-control" />
                  </div>
                  <div class="input-group mb-3">
                    <span class="input-group-text">Codigo</span>
                    <input type="text" aria-label="First name" name="codigo_tarjeta" class="form-control" />
                  </div>
          </div>
          <div class="centrar">
            <input type="submit" class="btn btn-primary" name="accion" value="Comprar">
          </div>
          </form>

        </main>

        <!-- ========= light and dark mode toggle button ======= -->

        <a href="#" class="theme-toggle">
          <i class="fa-regular fa-moon"></i>
          <i class="fa-regular fa-sun"></i>
        </a>

        <!-- ========= footer section of dashboard ======= -->

        <footer class="footer"></footer>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/script.js"></script>
  </body>

  </html>