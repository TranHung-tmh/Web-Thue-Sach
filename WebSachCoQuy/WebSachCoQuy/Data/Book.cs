using System;
using System.Collections.Generic;

namespace WebSachCoQuy.Data;

public partial class Book
{
    public int BookId { get; set; }

    public string Title { get; set; } = null!;

    public string? Author { get; set; }

    public decimal? RentalPrice { get; set; }

    public int? Discount { get; set; }

    public DateOnly? PublishedDate { get; set; }

    public int? OrderQuantity { get; set; }

    public int? CatalogyId { get; set; }

    public string? Description { get; set; }

    public string? Img { get; set; }

    public virtual Catalogy? Catalogy { get; set; }

    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}
