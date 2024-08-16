using System;
using System.Collections.Generic;

namespace WebSachCoQuy.Data;

public partial class Customer
{
    public int CustomerId { get; set; }

    public string Fullname { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public bool IsAdmin { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}
