using System;
using System.Collections.Generic;

namespace WebSachCoQuy.Data;

public partial class Catalogy
{
    public int CatalogyId { get; set; }

    public string? Genre { get; set; }

    public virtual ICollection<Book> Books { get; set; } = new List<Book>();
}
