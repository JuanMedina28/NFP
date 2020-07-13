package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Usuario {
    
    private int id_usuario;
    private String nombre_usuario;
    private String app_usuario;
    private String correo_usuario;
    private String password_usuario;
    private boolean existe_usuario;

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getApp_usuario() {
        return app_usuario;
    }

    public void setApp_usuario(String app_usuario) {
        this.app_usuario = app_usuario;
    }

    public String getCorreo_usuario() {
        return correo_usuario;
    }

    public void setCorreo_usuario(String correo_usuario) {
        this.correo_usuario = correo_usuario;
    }

    public String getPassword_usuario() {
        return password_usuario;
    }

    public void setPassword_usuario(String password_usuario) {
        this.password_usuario = password_usuario;
    }

    public boolean isExiste_usuario() {
        return existe_usuario;
    }

    public void setExiste_usuario(boolean existe_usuario) {
        this.existe_usuario = existe_usuario;
    }
    
    public Usuario(){
        
    }
    /*
    Utilizar el constructor con parametros para verificar si extiste un usuario o no.
    */
    public Usuario(String correo){
        try {
            final String sql = "Select * from usuario where correo_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement buscarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            buscarUsuario.setString(1, correo);
            ResultSet resulUsuario = buscarUsuario.executeQuery();
            while (resulUsuario.next()) {
                id_usuario = resulUsuario.getInt("id_usuario");
                nombre_usuario = resulUsuario.getString("nombre_usuario");
                app_usuario = resulUsuario.getString("app_usuario");
                correo_usuario = resulUsuario.getString("correo_usuario");
                password_usuario = resulUsuario.getString("password_usuario");
                existe_usuario = true;
            }            
        } catch (Exception e) {
            e.printStackTrace();
        }        
    }
    
    /*
    Valida que el correo electronico no este en uso.
    Si no está en uso, devuelve True.
    Utilizar este metodo para validar el correo al registrar.
    */
    public boolean validarCorreoRegistro(){
        try {
            final String sql = "Select * from usuario where correo_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if(validar.next()){
                return false;
            }else{
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /*
    Utilizar este metodo para corroborar que el correo y la contraseña existan y coincidan
    */
    public boolean iniciarSesion(){
        try {
            final String sql = "Select * from usuario where correo_usuario = ? and password_usuario = ?";
            Conexion con = new Conexion();
            PreparedStatement validarCorreo = con.obtenerConnexion().prepareStatement(sql);
            validarCorreo.setString(1, getCorreo_usuario());
            validarCorreo.setString(2, getPassword_usuario());
            ResultSet validar = validarCorreo.executeQuery();
            if(validar.next()){
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /*
    Registra a un usuario en la base de datos.
    Devuelve True si el registro fue exitoso.
    */
    public boolean createUsuario(){
        try {
            final String sql = "Insert into usuario(nombre_usuario, app_usuario, correo_usuario, password_usuario) values (?,?,?,?)";
            Conexion conex = new Conexion();
            PreparedStatement insertarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            insertarUsuario.setString(1, getNombre_usuario());
            insertarUsuario.setString(2, getApp_usuario());
            insertarUsuario.setString(3, getCorreo_usuario());
            insertarUsuario.setString(4, getPassword_usuario());
            insertarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /*
    Actualiza un usuario 
    */
    public boolean updateUsuario(){
        try {
            final String sql = "Update usuario set nombre_usuario = ?, app_usuario = ?, correo_usuario = ?, password_usuario = ? where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement actualizarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            actualizarUsuario.setString(1, nombre_usuario);
            actualizarUsuario.setString(2, app_usuario);
            actualizarUsuario.setString(3, correo_usuario);
            actualizarUsuario.setString(4, password_usuario);
            actualizarUsuario.setInt(5, getId_usuario());
            actualizarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteUsuario(){
        try {
            final String sql = "Delete from usuario where id_usuario = ?";
            Conexion conex = new Conexion();
            PreparedStatement eliminarUsuario = conex.obtenerConnexion().prepareStatement(sql);
            eliminarUsuario.setInt(1, getId_usuario());
            eliminarUsuario.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}