package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet(name = "EnviarCorreoServlet", urlPatterns = {"/EnviarCorreoServlet"})
@MultipartConfig
public class EnviarCorreoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configuración para el servidor de correo saliente (SMTP)
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.put("mail.smtp.password", "dosj zpgi ptku vkbm");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.user", "pl.lvl30@gmail.com");
        properties.put("mail.smtp.password", "abcd1234/*S$");
        

        // Configuración de la sesión
        Session session = Session.getDefaultInstance(properties, 
            new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(
                        "pl.lvl30@gmail.com", "abcd1234/*S$");// Specify the Username and the PassWord
                }
        });
        session.getDebug();
        // Obtener el destinatario y el archivo del formulario
        String destinatario = request.getParameter("destinatario");
        Part filePart = request.getPart("archivo");
        InputStream fileContent = filePart.getInputStream();

        // Crear el mensaje de correo
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("pl.lvl30@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            message.setSubject("Asunto del Correo");

            // Adjuntar el archivo al correo
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(fileContent, filePart.getContentType());

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            message.setContent(multipart);

            // Enviar el mensaje
            Transport.send(message);

            response.getWriter().println("Correo enviado con éxito");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().println("Error al enviar el correo");
        }
    }
}