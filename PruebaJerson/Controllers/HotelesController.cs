using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PruebaJerson.Models;

namespace PruebaJerson.Controllers
{
    public class HotelesController : Controller
    {
        private readonly ViajesDbContext _context;

        public HotelesController(ViajesDbContext context)
        {
            _context = context;
        }

        // GET: Hoteles
        public async Task<IActionResult> Index()
        {
              return _context.Hoteles != null ? 
                          View(await _context.Hoteles.ToListAsync()) :
                          Problem("Entity set 'ViajesDbContext.Hoteles'  is null.");
        }

        public IActionResult AsignarHabitaciones(int id)
        {
            var hotel = _context.Hoteles.Include(h => h.Habitaciones).FirstOrDefault(h => h.Id == id);
            return View(hotel);
        }

        [HttpPost]
        public IActionResult EditarHabitacion(Habitaciones habitacion)
        {
            if (ModelState.IsValid)
            {
                _context.Habitaciones.Update(habitacion);
                _context.SaveChanges();
                return RedirectToAction("AsignarHabitaciones", new { id = habitacion.HotelId });
            }

            return View(habitacion);
        }

        // GET: Hoteles/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Hoteles == null)
            {
                return NotFound();
            }

            var hotele = await _context.Hoteles
                .FirstOrDefaultAsync(m => m.Id == id);
            if (hotele == null)
            {
                return NotFound();
            }

            return View(hotele);
        }

        // GET: Hoteles/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Hoteles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nombre")] Hoteles hotele)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hotele);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(hotele);
        }

        // GET: Hoteles/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Hoteles == null)
            {
                return NotFound();
            }

            var hotele = await _context.Hoteles.FindAsync(id);
            if (hotele == null)
            {
                return NotFound();
            }
            return View(hotele);
        }

        [HttpPost]
        public IActionResult CambiarEstadoHotel(int id)
        {
            var hotel = _context.Hoteles.Find(id);

            if (hotel != null)
            {
                hotel.Activo = !hotel.Activo;
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult CambiarEstadoHabitacion(int id)
        {
            var habitacion = _context.Habitaciones.Find(id);

            if (habitacion != null)
            {
                habitacion.Activa = !habitacion.Activa;
                _context.SaveChanges();
            }

            return RedirectToAction("AsignarHabitaciones", new { id = habitacion.HotelId });
        }

        // POST: Hoteles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nombre")] Hoteles hotele)
        {
            if (id != hotele.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hotele);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HoteleExists(hotele.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(hotele);
        }

        // GET: Hoteles/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Hoteles == null)
            {
                return NotFound();
            }

            var hotele = await _context.Hoteles
                .FirstOrDefaultAsync(m => m.Id == id);
            if (hotele == null)
            {
                return NotFound();
            }

            return View(hotele);
        }

        // POST: Hoteles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Hoteles == null)
            {
                return Problem("Entity set 'ViajesDbContext.Hoteles'  is null.");
            }
            var hotele = await _context.Hoteles.FindAsync(id);
            if (hotele != null)
            {
                _context.Hoteles.Remove(hotele);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HoteleExists(int id)
        {
          return (_context.Hoteles?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
