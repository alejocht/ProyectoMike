using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Funda
    {
        public Funda() 
        {
            id = new Int64();
            nombre = "";
            codigo = "";
            color = new Color();
            familia = new Familia();
            modelo = new Modelo();
            stock = new Int64();
        }
        public Int64 id { get; set; }
        public string nombre { get; set; }
        public string codigo { get; set; }
        public Color color { get; set; }
        public Familia familia { get; set; }
        public Modelo modelo { get; set; }
        public Int64 stock { get; set; }

    }
}
