using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyApi.Core.Domain
{
    [Table("OrderItems")]
    public class OrderItem
    {
        [Key]
        [Column(Order = 1)]
        public long OrderId { get; set; }

        [Key]
        [Column(Order = 2)]
        public long ProductId { get; set; }
        
        [Required]
        public int Quantity { get; set; } = 0;

        [Required]
        public decimal Amount { get; set; }

        [ForeignKey("OrderId")]
        public virtual Order Order { get; set; }

        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
    }
}