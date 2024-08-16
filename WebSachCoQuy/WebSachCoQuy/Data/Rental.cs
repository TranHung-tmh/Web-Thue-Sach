using System;
using System.Collections.Generic;

namespace WebSachCoQuy.Data;

public partial class Rental
{
    public int RentalId { get; set; }

    public int? CustomerId { get; set; }

    public DateTime? RentalDate { get; set; }

    public DateTime? ReturnDate { get; set; }

    public DateTime? ActualReturnDate { get; set; }

    public int? Deposit { get; set; }

    public int? TotalAmount { get; set; }

    public int? BookId { get; set; }

    public virtual Book? Book { get; set; }

    public virtual Customer? Customer { get; set; }
}
