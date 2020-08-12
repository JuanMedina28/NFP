package Modelo;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Codigos {

    private String ruta_archivo;
    private String nombre_archivo;

    public String getRuta_archivo() {
        return ruta_archivo;
    }

    public void setRuta_archivo(String ruta_archivo) {
        this.ruta_archivo = ruta_archivo;
    }

    public String getNombre_archivo() {
        return nombre_archivo;
    }

    public void setNombre_archivo(String nombre_archivo) {
        this.nombre_archivo = nombre_archivo;
    }

    public Codigos() {

    }

    public String[][] insertarCodigos() {
        FileReader fr = null;
        BufferedReader br = null;
        int i = 0, inicio, fin, k, j, m;
        try {
            ruta_archivo = getRuta_archivo();
            nombre_archivo = getNombre_archivo();
            fr = new FileReader(ruta_archivo + "\\" + nombre_archivo);
            br = new BufferedReader(fr);

            String linea;
            while ((linea = br.readLine()) != null) {
                i++;
            }

            String puntos[][] = new String[i][2];
            i = 0;
            k = 0;
            j = 0;
            m = 0;
            linea = "";
            Conexion conex = new Conexion();
            fr = new FileReader(ruta_archivo + "\\" + nombre_archivo);
            br = new BufferedReader(fr);
            while ((linea = br.readLine()) != null) {
                inicio = linea.indexOf(" ");
                fin = linea.indexOf(",", inicio + 1);
                puntos[i][0] = linea.substring(inicio + 1, fin);

                if (puntos[i][0].length() == 9 && puntos[i][0].substring(0, 1).equals("C") || puntos[i][0].substring(0, 1).equals("M") || puntos[i][0].substring(0, 1).equals("G") || puntos[i][0].substring(0, 1).equals("E")) {
                    final String vc = "Select * from codigo where codigo = ?";
                    PreparedStatement validar_c = conex.obtenerConnexion().prepareStatement(vc);
                    validar_c.setString(1, puntos[i][0]);
                    ResultSet resultado = validar_c.executeQuery();
                    if (resultado.next()) {
                        puntos[i][1] = "duplicado";
                    } else {
                        final String sql = "Insert into codigo(codigo, fecha_lectura) values(?,?)";
                        PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);

                        java.util.Date fecha_actual = new Date();
                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

                        insertarUsuario.setString(1, puntos[i][0]);
                        insertarUsuario.setString(2, formato.format(fecha_actual));
                        insertarUsuario.executeUpdate();

                        puntos[i][1] = "valido";
                    }
                } else {
                    puntos[i][1] = "invalido";
                }
                
                i++;
            }
            return puntos;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        String[][] p = new String[1][1];
        p[0][0] = "incorrecto";
        return p;
    }

    public static void main(String[] args) {
        Codigos c = new Codigos();
        String im = "";
        String[][] codigos = c.insertarCodigos();
        int stop = codigos.length;
        for (int filas = 0; filas < stop; filas++) {
            System.out.print(codigos[filas][0] + "\t");
            System.out.print(codigos[filas][1] + "\t");
            System.out.println("\n");
        }
    }
}
