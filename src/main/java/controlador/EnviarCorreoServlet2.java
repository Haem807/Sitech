/**package controlador;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.sun.mail.smtp.SMTPTransport;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Arrays;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

@WebServlet(name = "EnviarCorreoServlet2", urlPatterns = {"/EnviarCorreoServlet2"})
public class EnviarCorreoServlet2 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Cargar el archivo JSON de credenciales descargado desde la Consola de Desarrolladores
            GoogleCredential googleCredential = GoogleCredential.fromStream(new FileInputStream("client_secret_87842288790-cobs8jntdsr41dbb4ua0mp9dc2d59nvh.apps.googleusercontent.com.json"))
                    .createScoped(Arrays.asList("https://mail.google.com/"));

            // Propiedades de la sesión de Java Mail
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");

            // Autenticación OAuth
            Session session = Session.getInstance(properties, null);
            SMTPTransport transport = (SMTPTransport) session.getTransport("smtp");
            transport.connect("smtp.gmail.com", 587, "pl.lvl30@gmail.com", googleCredential.getAccessToken());

            // Crear un mensaje
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("pl.lvl30@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(request.getParameter("destinatario")));
            message.setSubject("Asunto del correo");
            message.setText("Cuerpo del correo electrónico");

            // Adjuntar el archivo
            Part filePart = (Part) request.getPart("archivo");
            String fileName = getFileName(filePart);
            InputStream fileContent = filePart.getInputStream();
            addAttachment(message, fileName, fileContent);

            // Enviar el mensaje
            transport.sendMessage(message, message.getAllRecipients());

            // Cerrar la conexión
            transport.close();

            response.getWriter().println("Correo electrónico enviado con éxito.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al enviar el correo electrónico.");
        }
    }

    private String getFileName(final Part part) throws MessagingException {
        for (String content : part.getHeader("content-disposition")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private void addAttachment(Message message, String fileName, InputStream fileContent) throws MessagingException, IOException {
        MimeBodyPart attachmentPart = new MimeBodyPart();
        DataSource source = new ByteArrayDataSource(readFile(fileContent), "application/octet-stream");
        attachmentPart.setDataHandler(new DataHandler(source));
        attachmentPart.setFileName(fileName);
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(attachmentPart);
        message.setContent(multipart);
    }

    private byte[] readFile(InputStream fileContent) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = fileContent.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }
}
**/