
package Modelo;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    private String url;
    private String user;
    private String password;
    private Connection connection;

    public Conexion() {
        url="jdbc:postgresql://localhost:5432/proyecto_refrescos";
        user="postgres";
        password="bd";
    }
    
    public Connection obtenerConnexion(){
        try {
            Class.forName("org.postgresql.Driver");
            return connection = DriverManager.getConnection(url, user, password);
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
}
