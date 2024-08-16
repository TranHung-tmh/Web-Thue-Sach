namespace WebSachCoQuy.ViewModel
{
    public class DetailBookVM
    {
        public int BookId { get; set; }

        public string Title { get; set; } = null!;

        public string? Author { get; set; }

        public decimal? RentalPrice { get; set; }
        public DateOnly? PublishedDate { get; set; }
        public string? Description { get; set; }

        public string? Img { get; set; }
        public int? CatalogyId { get; set; }
    }
}
