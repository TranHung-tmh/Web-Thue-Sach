using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebSachCoQuy.Data;

public partial class WedChoThueSachCoContext : DbContext
{
    public WedChoThueSachCoContext()
    {
    }

    public WedChoThueSachCoContext(DbContextOptions<WedChoThueSachCoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<Catalogy> Catalogies { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Rental> Rentals { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Data Source=DATMINO;Initial Catalog=WedChoThueSachCo;Integrated Security=True;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Book>(entity =>
        {
            entity.HasKey(e => e.BookId).HasName("PK__books__490D1AE14F43AAC6");

            entity.ToTable("books");

            entity.Property(e => e.BookId).HasColumnName("book_id");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasColumnName("author");
            entity.Property(e => e.CatalogyId).HasColumnName("catalogy_id");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .HasColumnName("description");
            entity.Property(e => e.Discount).HasColumnName("discount");
            entity.Property(e => e.Img)
                .HasMaxLength(255)
                .HasColumnName("img");
            entity.Property(e => e.OrderQuantity).HasColumnName("Order_quantity");
            entity.Property(e => e.PublishedDate).HasColumnName("published_date");
            entity.Property(e => e.RentalPrice)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("rental_price");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .HasColumnName("title");

            entity.HasOne(d => d.Catalogy).WithMany(p => p.Books)
                .HasForeignKey(d => d.CatalogyId)
                .HasConstraintName("FK__books__catalogy___403A8C7D");
        });

        modelBuilder.Entity<Catalogy>(entity =>
        {
            entity.HasKey(e => e.CatalogyId).HasName("PK__catalogy__25CEBA4E6840E927");

            entity.ToTable("catalogy");

            entity.Property(e => e.CatalogyId).HasColumnName("catalogy_id");
            entity.Property(e => e.Genre)
                .HasMaxLength(100)
                .HasColumnName("genre");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__customer__CD65CB853BC9B24F");

            entity.ToTable("customers");

            entity.HasIndex(e => e.Email, "UQ__customer__AB6E61644676A911").IsUnique();

            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .HasColumnName("address");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.Fullname)
                .HasMaxLength(255)
                .HasColumnName("fullname");
            entity.Property(e => e.IsAdmin).HasColumnName("is_admin");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .HasColumnName("phone");
        });

        modelBuilder.Entity<Rental>(entity =>
        {
            entity.HasKey(e => e.RentalId).HasName("PK__rentals__67DB611BBE1D583B");

            entity.ToTable("rentals");

            entity.Property(e => e.RentalId).HasColumnName("rental_id");
            entity.Property(e => e.ActualReturnDate)
                .HasColumnType("datetime")
                .HasColumnName("actual_return_date");
            entity.Property(e => e.BookId).HasColumnName("book_id");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.RentalDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("rental_date");
            entity.Property(e => e.ReturnDate)
                .HasColumnType("datetime")
                .HasColumnName("return_date");
            entity.Property(e => e.TotalAmount).HasColumnName("total_amount");

            entity.HasOne(d => d.Book).WithMany(p => p.Rentals)
                .HasForeignKey(d => d.BookId)
                .HasConstraintName("FK__rentals__book_id__412EB0B6");

            entity.HasOne(d => d.Customer).WithMany(p => p.Rentals)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK__rentals__custome__4222D4EF");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
