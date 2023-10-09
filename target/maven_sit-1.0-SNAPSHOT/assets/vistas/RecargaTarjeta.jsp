<%@page import="modelo.Tarjeta"%>
<%@page import="modelo.Usuario"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SIT</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" />
    <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/hola.css" />
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
                        <img class="imagen" src="../image/interfaz-de-usuario-de-administrador.png" alt="" />
                    </a>
                </div>
                <ul class="sidebar-nav">
                    
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
                                <img src="../image/icono.png" class="avatar img-fluid rounded" alt="" />
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- ========= Main content section of dashboard ======= -->

            <main class="content px-3 py-2">
                <div class="container-fluid">
                    <div class="mb-3">
                        <h3>RECARGA TARJETA</h3>
                    </div>
                    
                    <%Tarjeta tar=(Tarjeta) session.getAttribute("tarjeta");
                    Usuario user=(Usuario) session.getAttribute("user"); if (user !=null) { %>
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
                                <h3>SALDO: <%= tar.getSaldo()%></h3>
                            </div>
          
                          </div>
                        </div>
                        <%}%>
                    <form action="../../TarjetaServlet">
                        <div class="input-group mt-5 mb-5">
                            <span class="input-group-text">Ingresar monto a recargar:</span>
                            <input type="text" aria-label="First name" name="saldo" class="form-control" required/>
                        </div>
                        <input class="btn btn-primary" type="submit" name="accion" value="Recargar" >
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