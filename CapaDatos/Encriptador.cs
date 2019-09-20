using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace CapaDatos
{
    class Encriptador
    {
        private byte[] _Key = Encoding.ASCII.GetBytes("19951994511sguma");
        private byte[] _iV = Encoding.ASCII.GetBytes("sgumab1994199524");


        /* 
        Metodo: Encript
        Entrada: Cadena String
        Salida: Cadena String
        Autor: Sergio Garcia Urbano
        Funcion: Encriptar una cadena. 
        */

        public string Encript(string pstrCadena) {
            string respuesta = "";
            Rijndael vobjRijndael = Rijndael.Create();

            vobjRijndael.KeySize = 128;
            vobjRijndael.BlockSize = 128;
            vobjRijndael.Mode = CipherMode.CBC;
            vobjRijndael.Padding = PaddingMode.PKCS7;
            vobjRijndael.Key = _Key;
            vobjRijndael.IV = _iV;

            try
            {
                byte[] inputBytes  = System.Text.Encoding.ASCII.GetBytes(pstrCadena);
                byte[] encripted;
                ICryptoTransform encryptor = vobjRijndael.CreateEncryptor(_Key, _iV);
                encripted = encryptor.TransformFinalBlock(System.Text.Encoding.ASCII.GetBytes(pstrCadena), 0, pstrCadena.Length);
                respuesta = System.Convert.ToBase64String(encripted);
                encryptor.Dispose();  
            }
            catch (Exception e)
            {
                respuesta = e.Message;
            }
            
            vobjRijndael.Clear();
            
            return respuesta;
            }

        /* 
        Metodo: DesEncript
        Entrada: Cadena String
        Salida: Cadena String
        Autor: Sergio Garcia Urbano
        Funcion: DesEncriptar una cadena.    
        */
        public string DesEncript(string pstrCadena)
        {
            string respuesta = "";
            Rijndael vobjRijndael = Rijndael.Create();

            vobjRijndael.KeySize = 128;
            vobjRijndael.BlockSize = 128;
            vobjRijndael.Mode = CipherMode.CBC;
            vobjRijndael.Padding = PaddingMode.PKCS7;
            vobjRijndael.Key = _Key;
            vobjRijndael.IV = _iV;

            try
            {
                byte[] bytEncriptMsj = Convert.FromBase64String(pstrCadena);
                ICryptoTransform objdecryptor = vobjRijndael.CreateEncryptor(_Key, _iV);
                byte[] bytResultado = objdecryptor.TransformFinalBlock(bytEncriptMsj, 0, bytEncriptMsj.Length);
                objdecryptor.Dispose();
                respuesta = System.Text.Encoding.ASCII.GetString(bytResultado);
            }
            catch (Exception e)
            {
                respuesta = e.Message;
            }

            vobjRijndael.Clear();

            return respuesta;
        }

    }
}
