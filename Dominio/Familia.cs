using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Familia
    {
        public Familia()
        {
            id = new Int64();
            nombre = "";
        }

        public Int64 id { get; set; }
        public string nombre { get; set; }
    }
}
