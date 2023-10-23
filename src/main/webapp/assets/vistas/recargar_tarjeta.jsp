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
  <link rel="stylesheet" href="../css/recargar.css">
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

  <main class="d-flex flex-column justify-content-center align-items-center">

    <h3>RECARGAR TARJETA</h3>

    <section class="my-5">
      <form action="">
        <h5>Datos de la tarjeta</h5>
        <div class="d-flex flex-column ">
          <label for="">Ingrese el monto</label>
          <input name="monto" id="input-recarga" type="number" placeholder="12">
        </div>
        <div class="d-flex flex-column ">
          <label for="">Numero de tarjeta</label>
          <input name="numero" id="input-recarga" type="text" placeholder="45873456987567">
        </div>
        <div class="d-flex flex-column ">
          <label for="">CVV</label>
          <input name="cvv" id="input-recarga" type="text" placeholder="123">
        </div>
        <input type="submit" id="submit-recarga" value="Recargar" name="accion">
      </form>
    </section>
  </main>

</body>

</html>