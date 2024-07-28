using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LecturaDatos
{
    public class LecturaBolsa
    {
        public List<Bolsa> listarTodo(bool SoloActivos = false)
        {
            List<Bolsa> lista = new List<Bolsa>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                //string consulta = SoloActivos ? "select * from Bolsas WHERE Estado = 1" : "select * from Bolsas";
                //datos.SetearConsulta(consulta);
                datos.EjecutarLectura();
                while(datos.Lector.Read())
                {
                    Bolsa aux = new Bolsa();
                    aux.id = (int)datos.Lector["ID"];
                    aux.nombre = (string)datos.Lector["NOMBRE"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
    }
}
