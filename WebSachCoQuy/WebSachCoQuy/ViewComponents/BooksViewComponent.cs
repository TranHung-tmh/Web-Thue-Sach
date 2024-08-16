using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol.Plugins;
using WebSachCoQuy.Data;
using WebSachCoQuy.ViewModel;

namespace WebSachCoQuy.ViewComponents
{
    public class BooksViewComponent : ViewComponent
    {
        private readonly WedChoThueSachCoContext db;

        public BooksViewComponent(WedChoThueSachCoContext context) => db = context;
        public IViewComponentResult Invoke(int? loai)
        {
            var books = db.Books.AsQueryable();
            if (loai.HasValue)
            {
                books = books.Where(p => p.CatalogyId == loai.Value);
            }
            var result = db.Books.Select(p => new BookVM
            {

                BookID = p.BookId,
                BookName = p.Title ?? "",
                DonGia = p.RentalPrice ?? 0,
                BookHinh = p.Img ?? "",
                CatalogiesID = p.CatalogyId ?? 0,

            });
            return View("Default", result);

        }
    }
}
