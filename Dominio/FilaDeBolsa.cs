using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class FilaDeBolsa
    {
        public FilaDeBolsa() 
        {
            id = new Int64();
            id_bolsa = new Int64();
            nombre = "";
        }
        public Int64 id { get; set; }
        public Int64 id_bolsa { get; set; }
        public string nombre { get; set; }
    }
}
