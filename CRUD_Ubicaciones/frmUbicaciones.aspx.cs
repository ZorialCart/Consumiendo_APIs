using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using BILL; 


namespace CRUD_Ubicaciones
{
    public partial class frmUbocaciones : System.Web.UI.Page
    {

        ubicaciones_BILL oUbicacionesBILL;
        ubicacionesDAL oUbicacionesDAL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarUbicaciones();
                txtLat.Text = "27.368838973721562";
                txtLong.Text = "-109.93231695168663";
            }
        }

        public void ListarUbicaciones()
        {
            oUbicacionesDAL = new ubicacionesDAL();
            gvUbicaciones.DataSource = oUbicacionesDAL.Listar();
            gvUbicaciones.DataBind();
        }


        public ubicaciones_BILL DatosDeUbicacion()
        {
            int ID = 0;
            int.TryParse(txtID.Value, out ID);
            oUbicacionesBILL = new ubicaciones_BILL();
            if (gvUbicaciones.SelectedRow != null)
            {
                oUbicacionesBILL.ID = int.Parse(gvUbicaciones.SelectedRow.Cells[1].Text);
            }
            oUbicacionesBILL.Ubicacion = txtUbicacion.Text;
            oUbicacionesBILL.Latitud = txtLat.Text;
            oUbicacionesBILL.Longitud = txtLong.Text;

            return oUbicacionesBILL;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicacionesDAL();
            oUbicacionesDAL.Agregar(DatosDeUbicacion());
            ListarUbicaciones();
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicacionesDAL();
            oUbicacionesDAL.Modificar(DatosDeUbicacion());
            ListarUbicaciones();

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            oUbicacionesDAL = new ubicacionesDAL();
            oUbicacionesDAL.Eliminar(DatosDeUbicacion());
            ListarUbicaciones();

        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtUbicacion.Text = string.Empty;
            txtLat.Text = string.Empty;
            txtLong.Text = string.Empty;
            txtID.Value = null;
            btnEliminar.Enabled = false;
            btnModificar.Enabled = false;

        }

        protected void SeleccionarUbi(object sender, EventArgs e)
        {
            var tabla = new DataTable();
            oUbicacionesDAL = new ubicacionesDAL();

            tabla = oUbicacionesDAL.Seleccionar(DatosDeUbicacion());

            txtID.Value = tabla.Rows[0].ItemArray[0].ToString();
            txtUbicacion.Text = tabla.Rows[0].ItemArray[1].ToString();
            txtLat.Text = tabla.Rows[0].ItemArray[2].ToString();
            txtLong.Text = tabla.Rows[0].ItemArray[3].ToString();

            btnEliminar.Enabled = true;
            btnModificar.Enabled = true;

        }
    }
}
