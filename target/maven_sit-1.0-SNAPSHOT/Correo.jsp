<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enviar Correo</title>
</head>
<body>
    <h2>Formulario para enviar correo</h2>
    <form action="${pageContext.request.contextPath}/EnviarCorreoServlet2" method="post" enctype="multipart/form-data">
        <label for="destinatario">Correo de Destino:</label>
        <input type="email" id="destinatario" name="destinatario" required>
        
        <br><br>
        
        <label for="archivo">Seleccionar Archivo:</label>
        <input type="file" id="archivo" name="archivo" accept=".txt, .pdf, .docx" required>
        
        <br><br>
        
        <input type="submit" value="Enviar Correo">
    </form>
</body>
</html>