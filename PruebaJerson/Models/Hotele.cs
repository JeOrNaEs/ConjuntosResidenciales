using System;
using System.Collections.Generic;

namespace PruebaJerson.Models;

public partial class Hotele
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public virtual ICollection<Habitacione> Habitaciones { get; set; } = new List<Habitacione>();
}
