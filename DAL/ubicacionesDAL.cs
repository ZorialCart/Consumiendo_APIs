using System.Data;
using System.Data.SqlClient;
using BILL;
using System;

public class ubicacionesDAL
{
    //Constructor que inicializa la conexión con la base de datos
    SQLDBHelper oConexion;

    public ubicacionesDAL()
    {
        oConexion = new SQLDBHelper();
    }
    public bool Agregar(ubicaciones_BILL oUbicacionesBLL)
    {
        SqlCommand cmdComando = new SqlCommand();
        cmdComando.CommandText = "INSERT INTO Direcciones (Ubicación, Latitud, Longitud) VALUES (@Ubicacion, @Latitud, @Longitud)";

        cmdComando.Parameters.Add("@Ubicacion", SqlDbType.VarChar).Value = oUbicacionesBLL.Ubicacion;
        cmdComando.Parameters.Add("@Latitud", SqlDbType.VarChar).Value = oUbicacionesBLL.Latitud;
        cmdComando.Parameters.Add("@Longitud", SqlDbType.VarChar).Value = oUbicacionesBLL.Longitud;

        return oConexion.EjecutarComandoSQL(cmdComando);
    }

    public bool Modificar(ubicaciones_BILL oUbicacionesBLL)
    {
        SqlCommand cmdComando = new SqlCommand();
        cmdComando.CommandText = "UPDATE Direcciones SET Ubicación = @Ubicacion, Latitud = @Latitud, Longitud = @Longitud WHERE ID = @ID";

        cmdComando.Parameters.Add("@ID", SqlDbType.Int).Value = oUbicacionesBLL.ID;
        cmdComando.Parameters.Add("@Ubicacion", SqlDbType.VarChar).Value = oUbicacionesBLL.Ubicacion;
        cmdComando.Parameters.Add("@Latitud", SqlDbType.VarChar).Value = oUbicacionesBLL.Latitud;
        cmdComando.Parameters.Add("@Longitud", SqlDbType.VarChar).Value = oUbicacionesBLL.Longitud;

        cmdComando.CommandType = CommandType.Text;

        return oConexion.EjecutarComandoSQL(cmdComando);
    }

    public DataTable Seleccionar(ubicaciones_BILL oUbicacionesBLL)
    {
        using (SqlCommand cmdComando = new SqlCommand())
        {
            cmdComando.CommandText = "SELECT * FROM Direcciones WHERE ID = @ID";
            cmdComando.Parameters.Add("@ID", SqlDbType.Int).Value = oUbicacionesBLL.ID;
            cmdComando.CommandType = CommandType.Text;

            
            DataTable TablaResultado = oConexion.EjecutarSentenciaSQL(cmdComando);
            return TablaResultado;
        }
    }

    public DataTable Listar()
    {
        SqlCommand cmdComando = new SqlCommand();
        cmdComando.CommandText = "SELECT * FROM Direcciones";
        cmdComando.CommandType = CommandType.Text;

        DataTable TablaResultado = oConexion.EjecutarSentenciaSQL(cmdComando);
        return TablaResultado;
    }

    public bool Eliminar(ubicaciones_BILL oUbicacionesBLL)
    {
        SqlCommand cmdComando = new SqlCommand();
        cmdComando.CommandText = "DELETE FROM Direcciones WHERE ID = @ID";
        cmdComando.Parameters.Add("@ID", SqlDbType.Int).Value = oUbicacionesBLL.ID;
        return oConexion.EjecutarComandoSQL(cmdComando);
    }

}



