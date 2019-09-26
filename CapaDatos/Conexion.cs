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
    class Conexion
    {
        public DbProviderFactory prvObjProviderFactory;
        public DbConnection prvObjConnection;
        public String prvStrProveedor = "SqlClient";
        public String pubStrCadenaConexion = "data Source= CL-FE-SGU; Initial Catalog= dbventas; Integrated Security= true";


        /****************************
        * Creado Por: Sergio Garcia
        * Fecha Creacion: 26/09/2019
        * Método: AbrirConexion
        * Entrada: prvStrProveedor : Motor Base de datos, permite conectarse a cualquier base de datos.
        *          pubStrCadenaConexion : Cadena de Conexion.
       *****************************/
        public void AbrirConexion() {

            try{
                //Determina el tipo de proveedor
                prvObjProviderFactory = DbProviderFactories.GetFactory(prvStrProveedor);
                //'Crea la conexion
                prvObjConnection = prvObjProviderFactory.CreateConnection();
                //'Conecta a la base de datos
                prvObjConnection.ConnectionString = pubStrCadenaConexion;
                prvObjConnection.Open();
              }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: CerrarConexion
        *****************************/
        public void CerrarConexion() {
            if (prvObjConnection.State == ConnectionState.Open)
                prvObjConnection.Close();
        }


        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: ConstruirComando
         * Entrada: pvStrCommand : DbCommand
         * Salida: Comando Para ejecutar procedimiento almacenado.
        *****************************/
        public DbCommand ConstruirComandoSp(string pvStrCommand)
        {
            DbCommand comLeer = prvObjProviderFactory.CreateCommand();
            try
            {
                comLeer.Connection = prvObjConnection;
                comLeer.CommandText = pvStrCommand;
                comLeer.CommandType = CommandType.StoredProcedure;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return comLeer;
        }


        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: AgregarParametro
         * Entrada: pvStrCommand : DbCommand
         *          pvStrNombreParametro : Nombre Parametro Tipo string
         *          pvDbTipo : Tipo de Dato del parametro
         *          pvPdDireccion : Entrada o Salida
         *          objValue : Valor que se envia si el parametro es de tipo entrada.
         * Salida: Parametro Agregado.
        *****************************/

        public void AgregarParametro(DbCommand pvStrCommand, string pvStrNombreParametro, DbType pvDbTipo, 
                                     ParameterDirection pvPdDireccion, int pvIntTamanio = 0, string pvStrValor = "")
        {
            DbParameter pvParametro;
            try {
                pvParametro = prvObjProviderFactory.CreateParameter(); 
                pvParametro.ParameterName = pvStrNombreParametro; 
                pvParametro.DbType = pvDbTipo; 
                pvParametro.Direction = pvPdDireccion; 
                pvParametro.Size = pvIntTamanio; 
            if (pvStrValor != "") { pvParametro.Value = pvStrValor; } else { }
                pvStrCommand.Parameters.Add(pvParametro);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: EjecutarCommandSp 
        *****************************/

        public int EjecutarCommandSp(DbCommand pvStrCommand)
        {
            try
            {
                return pvStrCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: EjecutarCommandReader 
        *****************************/

        public DbDataReader EjecutarCommandReader(DbCommand pvStrCommand)
        {
            try
            {
                return pvStrCommand.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: LlenarDataTable
        *****************************/

        public DataTable LlenarDataTable(DbCommand pvStrCommand, DataTable pDtResultado)
        {
            DbDataAdapter vDa;
            try {
                vDa = prvObjProviderFactory.CreateDataAdapter();
                vDa.SelectCommand = pvStrCommand;
                vDa.Fill(pDtResultado);
            return pDtResultado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
