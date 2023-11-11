using System;
using System.Collections.Generic;

namespace PruebaJerson.Models;

public partial class Hoteles
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;
    public int Activo { get; set; }
    public virtual ICollection<Habitaciones> Habitaciones { get; set; } = new List<Habitaciones>();
}
