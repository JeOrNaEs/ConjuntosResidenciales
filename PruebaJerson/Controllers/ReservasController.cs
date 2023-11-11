using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using PruebaJerson.Models;

namespace PruebaJerson.Controllers
{
    public class ReservasController : Controller
    {
        private readonly ViajesDbContext _context;

        public ReservasController(ViajesDbContext context)
        {
            _context = context;
        }

        // GET: Reservas
        public async Task<IActionResult> Index()
        {
            var viajesDbContext = _context.Reservas.Include(r => r.Habitacion);
            return View(await viajesDbContext.ToListAsync());
        }

        // GET: Reservas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Reservas == null)
            {
                return NotFound();
            }

            var reserva = await _context.Reservas
                .Include(r => r.Habitacion)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (reserva == null)
            {
                return NotFound();
            }

            return View(reserva);
        }

        // GET: Reservas/Create
        public IActionResult Create()
        {
            ViewData["HabitacionId"] = new SelectList(_context.Habitaciones, "Id", "Id");
            return View();
        }

        // POST: Reservas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,HabitacionId")] Reserva reserva)
        {
            if (ModelState.IsValid)
            {
                _context.Add(reserva);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["HabitacionId"] = new SelectList(_context.Habitaciones, "Id", "Id", reserva.HabitacionId);
            return View(reserva);
        }

        // GET: Reservas/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Reservas == null)
            {
                return NotFound();
            }

            var reserva = await _context.Reservas.FindAsync(id);
            if (reserva == null)
            {
                return NotFound();
            }
            ViewData["HabitacionId"] = new SelectList(_context.Habitaciones, "Id", "Id", reserva.HabitacionId);
            return View(reserva);
        }

        // POST: Reservas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,HabitacionId")] Reserva reserva)
        {
            if (id != reserva.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(reserva);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReservaExists(reserva.Id))
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
            ViewData["HabitacionId"] = new SelectList(_context.Habitaciones, "Id", "Id", reserva.HabitacionId);
            return View(reserva);
        }

        // GET: Reservas/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Reservas == null)
            {
                return NotFound();
            }

            var reserva = await _context.Reservas
                .Include(r => r.Habitacion)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (reserva == null)
            {
                return NotFound();
            }

            return View(reserva);
        }

        // POST: Reservas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Reservas == null)
            {
                return Problem("Entity set 'ViajesDbContext.Reservas'  is null.");
            }
            var reserva = await _context.Reservas.FindAsync(id);
            if (reserva != null)
            {
                _context.Reservas.Remove(reserva);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ReservaExists(int id)
        {
          return (_context.Reservas?.Any(e => e.Id == id)).GetValueOrDefault();
        }

        //private readonly SendGridOptions _sendGridOptions;

        //// Inyecta la configuración de SendGrid en el controlador
        //public ReservasController(IOptions<SendGridOptions> sendGridOptions)
        //{
        //    _sendGridOptions = sendGridOptions.Value;
        //}

        //// ... Otras acciones ...

        //[HttpPost]
        //public IActionResult ReservarHabitacion(Reserva reserva)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        // Guarda la reserva en la base de datos
        //        _dbContext.Reservas.Add(reserva);
        //        _dbContext.SaveChanges();

        //        // Envía un correo electrónico al usuario
        //        EnviarCorreoElectronico(reserva.CorreoElectronico, "¡Reserva Exitosa!", "Gracias por reservar con nosotros.");

        //        return RedirectToAction("Index"); // O la página que desees después de la reserva
        //    }

        //    return View(reserva);
        //}

        //// Método para enviar un correo electrónico utilizando SendGrid
        //private void EnviarCorreoElectronico(string destinatario, string asunto, string contenido)
        //{
        //    var apiKey = _sendGridOptions.ApiKey;
        //    var client = new SendGridClient(apiKey);

        //    var from = new EmailAddress("tucorreo@tudominio.com", "Nombre de tu Empresa");
        //    var to = new EmailAddress(destinatario);
        //    var msg = MailHelper.CreateSingleEmail(from, to, asunto, contenido, contenido);

        //    // Envía el correo electrónico de forma asíncrona
        //    var response = client.SendEmailAsync(msg).Result;
        //}
    }
}
