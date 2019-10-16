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
        private bool IsGuardar = false;

        public FrmCategoria()
        {
            InitializeComponent();
            this.tt_Mensaje.SetToolTip(this.txt_Nombre,"Ingrese el nombre de la categoria");
        }

        private void FrmCategoria_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            this.Mostrar();
            this.habilitar(false);
            this.txt_Codigo.Enabled = false;
            this.habilitarBotonesInicio(true);
        }

        private void MensajeOk(string vpStrMensaje)
        {
            MessageBox.Show(vpStrMensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void MensajeError(string vpStrMensaje)
        {
            MessageBox.Show(vpStrMensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void LimpiarControles()
        {
            this.txt_Buscar.Text = "";
            this.txt_Codigo.Text = "";
            this.txt_Descripcion.Text = "";
            this.txt_Nombre.Text = "";
        }

        private void habilitar(bool vpValor)
        {
            this.txt_Nombre.Enabled = vpValor;
            this.txt_Descripcion.Enabled = vpValor;
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 09/Octubre/2019
         * Método: habilitarBotones
         * Descripción: habilita los botones Nuevo, Editar, Guardar y Cancelar 
         *              dependiendo de la funcion.
        *****************************/
        private void habilitarBotones(bool pvBol_accion)
        {
            if (pvBol_accion)
            {
                this.btn_Nuevo.Enabled = false;
                this.btn_Editar.Enabled = false;
                this.btn_Cancelar.Enabled = true;
                this.btn_Guardar.Enabled = true;
            }
            else
            {
                this.btn_Nuevo.Enabled = true;
                this.btn_Editar.Enabled = false;
                this.btn_Cancelar.Enabled = true;
                this.btn_Guardar.Enabled = true;
            }
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 09/Octubre/2019
         * Método: habilitarBotones
         * Descripción: habilita los botones Nuevo, Editar al inicio de la 
         *              aplicacion.
        *****************************/
        private void habilitarBotonesInicio(bool pvBol_accion)
        {
            if (pvBol_accion)
            {
                this.btn_Nuevo.Enabled = true;
                this.btn_Editar.Enabled = false;
                this.btn_Guardar.Enabled = false;
                this.btn_Cancelar.Enabled = false;
            }
            else
            {
                this.btn_Nuevo.Enabled = false;
                this.btn_Editar.Enabled = true;
                this.btn_Guardar.Enabled = false;
                this.btn_Cancelar.Enabled = false;
            }

        }


        private void OcultarColumnas()
        {
            this.dt_Listado.Columns[0].Visible = false;
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 08/Octubre/2019
         * Método: Mostrar
         * Descripción: Muestra los registros de las categorias en el datatable dt_Listado
        *****************************/
        private void Mostrar()
        {
            this.dt_Listado.DataSource = NCategoria.Mostrar();
            this.dt_Listado.Columns[0].HeaderText = "Codigo";
            this.dt_Listado.Columns[1].HeaderText = "Nombre";
            this.dt_Listado.Columns[2].HeaderText = "Descripción";
            this.OcultarColumnas();
            this.lbl_Total.Text = "Total Registros: " + dt_Listado.Rows.Count;
        }

        /****************************
          * Creado Por: Sergio Garcia
          * Fecha Creacion: 08/Octubre/2019
          * Método: BuscarNombre
          * Descripción: Permite buscar por nombre las categorias.
         *****************************/
        private void BuscarNombre()
        {
            this.dt_Listado.DataSource = NCategoria.ConsultarNombre(this.txt_Buscar.Text);
            this.OcultarColumnas();
            this.lbl_Total.Text = "Total Registros: " + dt_Listado.Rows.Count;
        }

        /****************************
          * Creado Por: Sergio Garcia
          * Fecha Creacion: 08/Octubre/2019
          * Método: btn_Buscar_Click
          * Descripción: Permite buscar por nombre las categorias al hacer click en Buscar.
         *****************************/
        private void btn_Buscar_Click(object sender, EventArgs e)
        {
            if (txt_Buscar.Text == "")
            {
                MessageBox.Show("Ingresa un nombre", "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                this.BuscarNombre();
            }
        }

        /****************************
          * Creado Por: Sergio Garcia
          * Fecha Creacion: 08/Octubre/2019
          * Método: BuscarNombre
          * Descripción: Permite buscar por nombre las categorias al escribir por pantalla.
         *****************************/
        private void txt_Buscar_TextChanged(object sender, EventArgs e)
        {
            if(txt_Buscar.Text == "") {
                this.Mostrar();
            }
            else
            {
                this.BuscarNombre();
            }
        }

        /****************************
        * Creado Por: Sergio Garcia
        * Fecha Creacion: 08/Octubre/2019
        * Método: btn_Nuevo_Click
        * Descripción: Activa los controles para crear un nuevo registro
        *****************************/
        private void btn_Nuevo_Click(object sender, EventArgs e)
        {
            this.IsNuevo = true;
            this.IsEditar = false;
            this.LimpiarControles();
            this.habilitarBotones(true);
            this.habilitar(true);
            this.txt_Nombre.Focus();
            this.txt_Codigo.Enabled = false;    
        }

        /****************************
        * Creado Por: Sergio Garcia
        * Fecha Creacion: 08/Octubre/2019
        * Método: btn_Guardar_Click
        * Descripción: Permite guardar los registros dependiendo si es un registro nuevo
        *              o si esta modificando un registro.
        *****************************/
        private void btn_Guardar_Click(object sender, EventArgs e)
        {
            string vStr_respuesta = "";
            try
            {
                if (txt_Nombre.Text == string.Empty)
                {
                    this.MensajeError("Faltan datos por Ingresar");
                    errorIcono.SetError(txt_Nombre, "Ingrese el nombre");
                }
                else
                {
                    if (this.IsNuevo)
                    {
                        vStr_respuesta = NCategoria.Insertar(txt_Nombre.Text, txt_Descripcion.Text);
                    }
                    else
                    {
                        vStr_respuesta = NCategoria.Editar(Convert.ToInt32(txt_Codigo.Text), txt_Nombre.Text, txt_Descripcion.Text);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
            if (vStr_respuesta.Equals("OK"))
            {
                if (this.IsNuevo)
                {
                    this.MensajeOk("Se inserto de forma correcta el registro");
                }
                else
                {
                    this.MensajeOk("Se actualizo de forma correcta el registro");
                }
            }
            else
            {
                this.MensajeError(vStr_respuesta);
            }

            this.IsNuevo = false;
            this.IsEditar = false;
            this.LimpiarControles();
            this.Mostrar();
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 08/Octubre/2019
         * Método: MostrarArticuloTabControl
         * Descripción: Al hacer doble click en una fila del dataTable 
         *              muestra en la pestaña del tabcontrol la informacion de la fila
         *              seleccionada.
        *****************************/
        private void MostrarArticuloTabControl(object sender, EventArgs e)
        {
            this.txt_Codigo.Text = Convert.ToString(this.dt_Listado.CurrentRow.Cells[0].Value);
            this.txt_Nombre.Text = Convert.ToString(this.dt_Listado.CurrentRow.Cells[1].Value);
            this.txt_Descripcion.Text = Convert.ToString(this.dt_Listado.CurrentRow.Cells[2].Value);
            this.tabControl1.SelectedIndex = 1;
            this.IsEditar = true;
            this.IsNuevo = false;
            this.habilitar(false);
            this.habilitarBotonesInicio(false);
            
        }

        /****************************
        * Creado Por: Sergio Garcia
        * Fecha Creacion: 08/Octubre/2019
        * Método: btn_Editar_Click
        * Descripción: Habilitar Botones para editar la categoria.
       *****************************/
        private void btn_Editar_Click(object sender, EventArgs e)
        {
            this.habilitarBotones(false);
            this.habilitar(true);  
        }
    }
}
