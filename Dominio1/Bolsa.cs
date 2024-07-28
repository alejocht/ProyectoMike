using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Bolsa
    {
        public Bolsa() 
        {
            id = new Int64();
            nombre = "";
            filas = new List<FilaDeBolsa>();
        }
        public Int64 id { get; set; }
        public string nombre { get; set; }
        public List<FilaDeBolsa> filas { get; set; }
    }
}
