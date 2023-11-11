using System;
using System.Collections.Generic;

namespace PruebaJerson.Models;

public partial class Habitacione
{
    public int Id { get; set; }

    public int? HotelId { get; set; }

    public decimal CostoBase { get; set; }

    public virtual Hotele? Hotel { get; set; }

    public virtual ICollection<Reserva> Reservas { get; set; } = new List<Reserva>();
}
