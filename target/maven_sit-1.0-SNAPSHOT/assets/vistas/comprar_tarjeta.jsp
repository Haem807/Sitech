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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/comprar.css">
</head>

<body>
  <!--Cabezera-->
  <header class="d-flex justify-content-between" id="header">
    <div class="d-flex align-items-center">
      <img src="../img/buss.png" alt="logo buss" width="60">
    </div>
    <nav class="d-flex align-items-center">
      <a href="../../index.html">Inicio</a>
      <a href="./recargar_tarjeta.html">Recargar Tarjeta</a>
    </nav>
  </header>

  <main>
    <section class="d-flex justify-content-center align-items-center flex-column">
      <h2>Cajero Automatico SIT</h2>
      <h5>Precio de tarjeta <span>S/10</span></h5>

      <div>
        <button class="botones" id="abrirTarjeta">Con tarjeta</button>
        <button class="botones" id="abrirDeposito">Realizar Deposito</button>
        <button class="botones" id="abrirMonedero">Monedero</button>

      </div>
      <dialog id="tarjetita">
        <div id="abrirRecoger1"><img src="https://i.pinimg.com/originals/dc/db/22/dcdb2231aaf5aae183a1a096b41b43f4.gif" border="0"
            alt="tarjeta-de-credito-imagen-animada-0015" width="300" /></div>
      </dialog>
      <dialog id="deposito">
        <div id="abrirRecoger2"><img src="https://us.123rf.com/450wm/tbaodatui1991/tbaodatui19911807/tbaodatui1991180700082/105519312-insertar-monedas-en-una-m%C3%A1quina-expendedora.jpg?ver=6" border="0"
            alt="tarjeta-de-credito-imagen-animada-0015" width="300" /></div>
      </dialog>
      <dialog id="monedero">
        <div id="abrirRecoger3"><img src="${pageContext.request.contextPath}/assets/img/cartel-yape-plin.jpg" border="0"
            alt="MONEDERO" width="300" /></div>
      </dialog>
      <dialog id="recoger">
        <h3>Felicidades se a creado tu tarjeta</h3>
        <a class="btn-recoger" href="${pageContext.request.contextPath}/assets/vistas/pasajero.jsp">Aceptar</a>
      </dialog>



      <script>
        window.abrirTarjeta.addEventListener('click', () => {
          window.tarjetita.showModal();
        })
        window.abrirDeposito.addEventListener('click', () => {
          window.deposito.showModal();
        })
        window.abrirMonedero.addEventListener('click', () => {
          window.monedero.showModal();
        })
        window.abrirRecoger1.addEventListener('click', () => {
          window.recoger.showModal();
        })
        

        window.abrirRecoger1.addEventListener('click', () => {
          window.tarjetita.close();
        })
        window.abrirRecoger2.addEventListener('click', () => {
          window.recoger.showModal();
        })

        window.abrirRecoger2.addEventListener('click', () => {
          window.deposito.close();
        })
        window.abrirRecoger3.addEventListener('click', () => {
          window.recoger.showModal();
        })

        window.abrirRecoger3.addEventListener('click', () => {
          window.monedero.close();
        })
      </script>
    </section>

    <section class="">

    </section>

  </main>

</body>

</html>