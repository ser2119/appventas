using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class FrmCategoria : Form
    {
        private bool IsNuevo = false;
        private bool IsEditar = false;

        public FrmCategoria()
        {
            InitializeComponent();
            this.tt_Mensaje.SetToolTip(this.txt_Nombre,"Ingrese el nombre de la categoria");
        }

        /*
         * Mensaje de Confirmacion 
        */ 
        private void MensajeOk(string vpStrMensaje)
        {
            MessageBox.Show(vpStrMensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        /*
         * Mensaje de Error 
        */
        private void MensajeError(string vpStrMensaje)
        {
            MessageBox.Show(vpStrMensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        /*
         * Limpiar todos los controles 
        */
        private void LimpiarControles()
        {
            this.txt_Buscar.Text = "";
            this.txt_Codigo.Text = "";
            this.txt_Descripcion.Text = "";
            this.txt_Nombre.Text = "";
        }

        /*
         * habilitar Controles 
        */
        private void habilitar(bool vpValor)
        {
            this.txt_Nombre.ReadOnly = !vpValor;
            this.txt_Descripcion.ReadOnly = !vpValor;
            this.txt_Codigo.ReadOnly = !vpValor;
        }

        /*
         * habilitar Botones
        */
        private void habilitarBotones()
        {
           if(this.IsNuevo || this.IsEditar)
            {
                this.habilitar(true);
                this.btn_Nuevo.Enabled = false;
                this.btn_Guardar.Enabled = true;
                this.btn_Editar.Enabled = false;
                this.btn_Cancelar.Enabled = true;
            }
            else
            {
                this.habilitar(false);
                this.btn_Nuevo.Enabled = true;
                this.btn_Guardar.Enabled = false;
                this.btn_Editar.Enabled = true;
                this.btn_Cancelar.Enabled = false;
            }
        }

        /*
         * ocultar Columnas
        */
        private void OcultarColumnas()
        {
            this.dt_Listado.Columns[0].Visible = false;
            this.dt_Listado.Columns[1].Visible = false;
        }

        /*
        * MostrarCategoria
        */
        private void Mostrar()
        {
            this.dt_Listado.DataSource = NCategoria.Mostrar();
            this.OcultarColumnas();
            this.lbl_Total.Text = "Total Registros: " + dt_Listado.Rows.Count;
        }

        /*
       * MostrarCategoriaNombre
       */
        private void BuscarNombre()
        {
            this.dt_Listado.DataSource = NCategoria.ConsultarNombre(this.txt_Buscar.Text);
            this.OcultarColumnas();
            this.lbl_Total.Text = "Total Registros: " + dt_Listado.Rows.Count;
        }

        private void FrmCategoria_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            this.Mostrar();
            this.habilitar(false);
            this.habilitarBotones();
        }

        private void btn_Buscar_Click(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }

        private void txt_Buscar_TextChanged(object sender, EventArgs e)
        {
            this.BuscarNombre();
        }
    }
}
