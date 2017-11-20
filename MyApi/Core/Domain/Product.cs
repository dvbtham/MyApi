using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyApi.Core.Domain
{
    [Table("Products")]
    public class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }

        [StringLength(700)]
        public string Name { get; set; }

        public decimal Price { get; set; }

        public decimal OriginalPrice { get; set; }

        public string Image { get; set; }

        public string Description { get; set; }

        public DateTime CreateDate { get; set; }

        public int Quantity { get; set; }

        public bool Status { get; set; }

        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}