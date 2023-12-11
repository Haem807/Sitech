<%@page contentType="text/html"%> <%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>SIT</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
    />
    <script
      src="https://kit.fontawesome.com/ae360af17e.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="assets/css/hola.css" />
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
              <img
                class="imagen"
                src="assets/img/interfaz-de-usuario-de-administrador.png"
                alt=""
              />
            </a>
          </div>
          <ul class="sidebar-nav">
            <li class="sidebar-header">Administrador</li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> REPORTES </a>
            </li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> GESTIONAR RUTAS Y HORARIOS </a>
            </li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> GESTIONAR CONDUCTORES </a>
            </li>
            <li class="sidebar-item">
              <a href="#" class="sidebar-link"> GESTIONAR UNIDADES </a>
            </li>
            <li class="sidebar-item">
              <a href="assets/vistas/listar2.jsp" class="sidebar-link"> GESTIONAR TABLAS!! </a>
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
                <li><a href="assets/vistas/login.jsp">Login</a></li>
              <li class="nav-item dropdown">
                <a href="#" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                  <img
                    src="assets/img/icono.png"
                    class="avatar img-fluid rounded"
                    alt=""
                  />
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <!-- ========= Main content section of dashboard ======= -->

        <main class="content px-3 py-2">
          <div class="container-fluid">
            <div class="mb-3">
              <h3>TIPO DE REPORTE</h3>
            </div>
            <div class="row">
              <div class="col-sm-6 mb-3">
                <a href="#">
                  <div class="tarjeta card">
                    <div class="card-body">
                      <h5 class="subtarjeta card-title">Pago por rutas</h5>
                    </div>
                  </div>
                </a>
              </div>
              <div class="col-sm-6 mb-3">
                <a href="#">
                  <div class="tarjeta card">
                    <div class="card-body">
                      <h5 class="subtarjeta card-title">
                        Servicio de pasajeros
                      </h5>
                    </div>
                  </div>
                </a>
              </div>
              <div class="col-sm-6 mb-3">
                <a href="#">
                  <div class="tarjeta card">
                    <div class="card-body">
                      <h5 class="subtarjeta card-title">Servicio por fecha</h5>
                    </div>
                  </div>
                </a>
              </div>
              <div class="col-sm-6 mb-3">
                <a href="#">
                  <div class="tarjeta card">
                    <div class="card-body">
                      <h5 class="subtarjeta card-title">Descargar reporte</h5>
                    </div>
                  </div>
                </a>
              </div>
               
            </div>
          </div>
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
    <script src="assets/js/script.js"></script>
  </body>
</html>
