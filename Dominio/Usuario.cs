namespace Dominio
{
    public class Usuario
    {
        public Usuario()
        {
            id = new Int64();
            nombre = "";
            apellido = "";
            usuario = "";
            clave = "";
        }

        public Int64 id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }


    }
}
