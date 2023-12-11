import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JREmptyDataSource;

public class GenerarInformePDF {

    public static void main(String[] args) {
        try {
            // Cargar el archivo JRXML y compilarlo en un objeto JasperReport
            JasperReport jasperReport = JasperCompileManager.compileReport("ruta/al/informe.jrxml");

            // Crear un objeto Map con los parámetros del informe (si los hay)
            Map<String, Object> parametros = new HashMap<>();

            // Llenar el informe con datos (si es necesario)
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, new JREmptyDataSource());

            // Exportar el informe a formato PDF
            JasperExportManager.exportReportToPdfFile(jasperPrint, "ruta/de/salida/informe.pdf");

            System.out.println("Informe generado exitosamente en formato PDF.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
