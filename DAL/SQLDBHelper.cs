using System.Data;
using System.Data.SqlClient;

internal class SQLDBHelper
{
    DataTable Tabla;
    SqlConnection strConexion = new SqlConnection("Data Source=DESKTOP-3A3O483\\SQLEXPRESS;Initial Catalog=BDUbicaciones;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();

    public bool EjecutarComandoSQL(SqlCommand strSQLCommand)
    {
        //Insertar, modificar y borrar
        bool Respuesta = true;

        cmd = strSQLCommand;
        cmd.Connection = strConexion;
        strConexion.Open();
        Respuesta = (cmd.ExecuteNonQuery() <= 0) ? false : true;
        strConexion.Close();
        return Respuesta;
    }

    public DataTable EjecutarSentenciaSQL(SqlCommand strSQLCommand)
    {
        // Base de datos

        cmd = strSQLCommand;
        cmd.Connection = strConexion;
        strConexion.Open();
        Tabla = new DataTable();
        Tabla.Load(cmd.ExecuteReader());
        strConexion.Close();
        return Tabla;
    }
}


