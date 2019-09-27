using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;


namespace CapaNegocio
{
    public class NCategoria
    {

        /*
         * Metodos que se comunican con la capa Datos. 
        */

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: EditarCategoria
         * Retorna: Insertar
        *****************************/

        public static string Insertar(string pStrNombre, string pStrDescripcion)
        {
            DCategoria objDCategoria = new DCategoria();
            objDCategoria.PrvStrNombre = pStrNombre;
            objDCategoria.PrvStrDescripcion = pStrDescripcion;

            return objDCategoria.Insertar(objDCategoria);
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: Editar
         * Retorna: string
        *****************************/

        public static string Editar(int pIntId, string pStrNombre, string pStrDescripcion)
        {
            DCategoria objDCategoria = new DCategoria();
            objDCategoria.PrvIntIdCategoria = pIntId;
            objDCategoria.PrvStrNombre = pStrNombre;
            objDCategoria.PrvStrDescripcion = pStrDescripcion;

            return objDCategoria.Editar(objDCategoria);
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: Eliminar
         * Retorna: string
        *****************************/

        public static string Eliminar(int pIntId)
        {
            DCategoria objDCategoria = new DCategoria();
            objDCategoria.PrvIntIdCategoria = pIntId;

            return objDCategoria.Eliminar(objDCategoria);
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: Mostrar
         * Retorna: DataTable
        *****************************/

        public static DataTable Mostrar()
        {
            DCategoria objDCategoria = new DCategoria();

            return objDCategoria.Mostrar();
        }

        /****************************
         * Creado Por: Sergio Garcia
         * Fecha Creacion: 26/09/2019
         * Método: ConsultarNombre
         * Retorna: DataTable
        *****************************/

        public static DataTable ConsultarNombre(string pStrNombre)
        {
            DCategoria objDCategoria = new DCategoria();
            objDCategoria.PrvStrNombre = pStrNombre;

            return objDCategoria.ConsultarNombre(objDCategoria);
        }

    }
}
