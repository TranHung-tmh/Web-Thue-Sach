using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebSachCoQuy.Data;
using WebSachCoQuy.ViewModel;

namespace WebSachCoQuy.Controllers
{
    public class DetailBookController:Controller
    {
        private readonly WedChoThueSachCoContext db;
        public DetailBookController(WedChoThueSachCoContext context)
        {
            db=context;
        }
        public IActionResult DetailBook(int id)
        {
            var data =db.Books.Include(p=>p.Catalogy).SingleOrDefault(p=>p.BookId==id);
            if (data == null)
            {
                return NotFound();
            }
            var result = new DetailBookVM
            {
                Title = data.Title ?? "",
                RentalPrice = data.RentalPrice ?? 0,
                Img = data.Img ?? "",
                CatalogyId = data.CatalogyId ?? 0,
                Author = data.Author,
                Description=data.Description ?? "",
                PublishedDate=data.PublishedDate,

            };
            return View(result);
        }
    }
}
