using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;



namespace CapaDatos
{
    public class DCategoria
    {
        private int _prvIntIdCategoria;
        private string _prvStrNombre;
        private string _prvStrDescripcion;
        private string _prvStrTextoBuscar;

        private Conexion objDb = new Conexion();


        public int PrvIntIdCategoria { get => _prvIntIdCategoria; set => _prvIntIdCategoria = value; }
        public string PrvStrNombre { get => _prvStrNombre; set => _prvStrNombre = value; }
        public string PrvStrDescripcion { get => _prvStrDescripcion; set => _prvStrDescripcion = value; }
        public string PrvStrTextoBuscar { get => _prvStrTextoBuscar; set => _prvStrTextoBuscar = value; }


        // Constructor Vacio
        public DCategoria() { }

        /* Constructor Paramteros
         * 
         *
        */
        public DCategoria(int v_idCategoria, string v_nombre, string v_descripcion, string v_textoBuscar)
        {
            this.PrvIntIdCategoria = v_idCategoria;
            this.PrvStrNombre = v_nombre;
            this.PrvStrDescripcion = v_nombre;
            this.PrvStrTextoBuscar = v_textoBuscar;

        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: Insertar
         * Retorna: string
        *****************************/

        public string Insertar(DCategoria pObjCategoria)
        {
            string vStrRpta = "";
            try
            {
                // Inicializa la conexion y llama al Procedimiento almacenado
                objDb.AbrirConexion();
                DbCommand ComLeer;
                ComLeer = objDb.ConstruirComandoSp("sp_insertar_categoria");
                objDb.AgregarParametro(ComLeer, "@p_nombre", DbType.Int16, ParameterDirection.Output);
                objDb.AgregarParametro(ComLeer, "@p_nombre", DbType.String, ParameterDirection.Input, 50, pObjCategoria.PrvStrNombre);
                objDb.AgregarParametro(ComLeer, "@p_descripcion", DbType.String, ParameterDirection.Input, 250, pObjCategoria.PrvStrDescripcion);
                vStrRpta = objDb.EjecutarCommandSp(ComLeer) == 1 ? "OK" : "No se ingreso el articulo";
            }
            catch (Exception ex)
            {
                vStrRpta = ex.Message;
            }
            finally
            {
                objDb.CerrarConexion();
            }
            return vStrRpta;
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: Editar
         * Retorna: string
        *****************************/

        public string Editar(DCategoria pObjCategoria)
        {
            string vStrRpta = "";
            try
            {
                // Inicializa la conexion y llama al Procedimiento almacenado
                objDb.AbrirConexion();
                DbCommand ComLeer;
                ComLeer = objDb.ConstruirComandoSp("sp_editar_categoria");
                objDb.AgregarParametro(ComLeer, "@p_id", DbType.Int16, ParameterDirection.Input, pObjCategoria.PrvIntIdCategoria);
                objDb.AgregarParametro(ComLeer, "@p_nombre", DbType.String, ParameterDirection.Input, 50, pObjCategoria.PrvStrNombre);
                objDb.AgregarParametro(ComLeer, "@p_descripcion", DbType.String, ParameterDirection.Input, 250, pObjCategoria.PrvStrDescripcion);
                vStrRpta = objDb.EjecutarCommandSp(ComLeer) == 1 ? "OK" : "No se actualizo el articulo";
            }
            catch (Exception ex)
            {
                vStrRpta = ex.Message;
            }
            finally
            {
                objDb.CerrarConexion();
            }
            return vStrRpta;
        }


        /****************************
        * Creado Por: Sergio Garcia
        * Fecha Creacion: 26/09/2019
        * Método: Eliminar
        * Retorna: string
       *****************************/

        public string Eliminar(DCategoria pObjCategoria)
        {
            string vStrRpta = "";
            try
            {
                // Inicializa la conexion y llama al Procedimiento almacenado
                objDb.AbrirConexion();
                DbCommand ComLeer;
                ComLeer = objDb.ConstruirComandoSp("sp_eliminar_categoria");
                objDb.AgregarParametro(ComLeer, "@p_id", DbType.Int16, ParameterDirection.Input, pObjCategoria.PrvIntIdCategoria);
                vStrRpta = objDb.EjecutarCommandSp(ComLeer) == 1 ? "OK" : "No se elimino el articulo";
            }
            catch (Exception ex)
            {
                vStrRpta = ex.Message;
            }
            finally
            {
                objDb.CerrarConexion();
            }
            return vStrRpta;
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: Mostrar
         * Retorna: DataTable
        *****************************/

        public DataTable Mostrar()
        {
            DataTable DtResultado = new DataTable();
            try
            {
                // Inicializa la conexion y llama al Procedimiento almacenado
                objDb.AbrirConexion();
                DbCommand ComLeer;

                ComLeer = objDb.ConstruirComandoSp("sp_mostrar_categorias");
                DtResultado = objDb.LlenarDataTable(ComLeer, DtResultado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDb.CerrarConexion();
            }
            return DtResultado;
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: ConsultarNombre
         * Retorna: DataTable
        *****************************/

        public DataTable ConsultarNombre(DCategoria pObjCategoria)
        {
            DataTable DtResultado = new DataTable();
            try
            {
                // Inicializa la conexion y llama al Procedimiento almacenado
                objDb.AbrirConexion();
                DbCommand ComLeer;

                ComLeer = objDb.ConstruirComandoSp("sp_buscar_categoria");
                objDb.AgregarParametro(ComLeer, "@p_texto_buscar", DbType.String, ParameterDirection.Input, 50, pObjCategoria.PrvStrTextoBuscar);
                DtResultado = objDb.LlenarDataTable(ComLeer, DtResultado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDb.CerrarConexion();
            }
            return DtResultado;
        }
    }
}
