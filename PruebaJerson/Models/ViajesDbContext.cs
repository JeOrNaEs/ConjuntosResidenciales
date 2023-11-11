using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PruebaJerson.Models;

public partial class ViajesDbContext : DbContext
{
    public ViajesDbContext()
    {
    }

    public ViajesDbContext(DbContextOptions<ViajesDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Habitacione> Habitaciones { get; set; }

    public virtual DbSet<Hotele> Hoteles { get; set; }

    public virtual DbSet<Reserva> Reservas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-SLG2215;Initial Catalog=ViajesDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Habitacione>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Habitaci__3214EC070A558F46");

            entity.Property(e => e.CostoBase).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Hotel).WithMany(p => p.Habitaciones)
                .HasForeignKey(d => d.HotelId)
                .HasConstraintName("FK__Habitacio__Hotel__267ABA7A");
        });

        modelBuilder.Entity<Hotele>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Hoteles__3214EC075242341C");

            entity.Property(e => e.Nombre).HasMaxLength(255);
        });

        modelBuilder.Entity<Reserva>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Reservas__3214EC0771C1E581");

            entity.HasOne(d => d.Habitacion).WithMany(p => p.Reservas)
                .HasForeignKey(d => d.HabitacionId)
                .HasConstraintName("FK__Reservas__Habita__29572725");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
