using Microsoft.AspNetCore.Mvc;
using WebSachCoQuy.Data;
using WebSachCoQuy.ViewModel;

namespace WebSachCoQuy.ViewComponents
{
    public class CatalogiesViewComponent : ViewComponent
    {
        private readonly WedChoThueSachCoContext db;

        public CatalogiesViewComponent(WedChoThueSachCoContext context) => db = context;

        public IViewComponentResult Invoke()
        {
            var data = db.Catalogies.Select(c => new CatalogiesVM
            {
                CatalogiesId = c.CatalogyId,
                CatalogiesName = c.Genre
            });
            return View(data);
        }

    }
}
