using System;
using System.Collections.Generic;

namespace PruebaJerson.Models;

public partial class Reserva
{
    public int Id { get; set; }

    public int? HabitacionId { get; set; }

    public virtual Habitaciones? Habitacion { get; set; }
}
