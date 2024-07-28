using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Movimiento
    {
        public Movimiento() 
        {
            id = new Int64();
            usuario = new Usuario();
            funda = new Funda();
            bolsa = new Bolsa();
            fila = new FilaDeBolsa();
            cantidad = new Int64();
        }
        public Int64 id { get; set; }
        public Usuario usuario { get; set; }
        public Funda funda { get; set; }
        public Bolsa bolsa { get; set; }
        public FilaDeBolsa fila { get; set; }
        public Int64 cantidad { get; set; }

    }
}
